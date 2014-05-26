From: Javier Almansa <javier.almansa@efsystems.net>
Date: Mon, 26 May 2014 13:13:37 +0200
Subject: [Buildroot] Install python setuptools package in staging directory
Message-ID: <CAPnaeVCKRCqFkGoJifzGHw7FZHofZ6sTGj6_bjp54+iq5_RJMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody.

I am new in this mailing list and I have been using BuildRoot since some
months ago for making rootfs for Raspberry PI, FriendlyARM and Beagleboard
targets.

Now, I am trying to add support for ROS (http://www.ros.org) into buildroot
but I have some troubles with dependencies.

Specifically, trying to install some ROS depemdencies, such as PyYaml (
http://pyyaml.org), I can add this package to the target directory, but I
am not able to install into Staging directory too (PyYaml is needed in
croos-compilation too).

This is my python-yaml.mk file:

################################################################################
#
# python-yaml
#
################################################################################

PYTHON_YAML_VERSION = 3.11
PYTHON_YAML_SOURCE = PyYAML-$(PYTHON_YAML_VERSION).tar.gz
PYTHON_YAML_SITE = http://pyyaml.org/download/pyyaml
PYTHON_YAML_LICENSE = MIT License
PYTHON_YAML_LICENSE_FILES = MIT License
PYTHON_YAML_SETUP_TYPE = distutils

$(eval $(python-package))
$(eval $(host-python-package))

Also, I tried with key PYTHON_YAML_INSTALL_STAGING = YES and it did not
install PyYaml in staging directory, only in target.

Also, I tried removing python-package evaluation rule and when I tried
"make python-yaml" I received a message telling that there is not rule for
python-yaml.

I am trying with master branch and SHA1
ID 78271772e3dcb09fe7f9a249e896acd925e7fc79.

Any Idea?

Thanks in advance.

Javier
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/fbb95cad/attachment.html>
