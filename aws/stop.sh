#!/bin/bash

set -e

echo "---stopping zms---"
cd /opt/athenz/athenz-zms*
sudo -E bin/zms stop


echo "---stopping ui---"
cd /opt/athenz/athenz-ui*
public_hostname=`curl http://169.254.169.254/latest/meta-data/public-hostname`
export ZMS_SERVER=$public_hostname
export UI_SERVER=$public_hostname
bin/athenz_ui stop

echo "---stopping zts---"
cd /opt/athenz/athenz-zts*
sudo bin/zts stop
