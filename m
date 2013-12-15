From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:34:02 +0100
Subject: [Buildroot] [git commit] python-bottle: convert to the Python
	package infrastructure
Message-ID: <20131215130825.9C3409BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a60e061622cc4d772ff61f33a3ff1927a3b190c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/python-bottle.mk |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index db71512..58c51f9 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -7,16 +7,8 @@
 PYTHON_BOTTLE_VERSION = 0.11.6
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
-PYTHON_BOTTLE_DEPENDENCIES = python
 PYTHON_BOTTLE_LICENSE = MIT
 # README.rst refers to the file "LICENSE" but it's not included
+PYTHON_BOTTLE_SETUP_TYPE = distutils
 
-define PYTHON_BOTTLE_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
-endef
-
-define PYTHON_BOTTLE_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
