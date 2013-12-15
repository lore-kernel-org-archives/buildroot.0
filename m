From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:38:28 +0100
Subject: [Buildroot] [git commit] python-pyparsing: convert to the Python
	package infrastructure
Message-ID: <20131215130826.253E79C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cce98611b40f2db170eee57376d7f130b2199fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyparsing/python-pyparsing.mk |   28 +------------------------
 1 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 7814ce3..07dda58 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -9,30 +9,6 @@ PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
 PYTHON_PYPARSING_SITE            = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
 PYTHON_PYPARSING_LICENSE         = MIT
 PYTHON_PYPARSING_LICENSE_FILES   = LICENSE
-PYTHON_PYPARSING_INSTALL_STAGING = YES
-PYTHON_PYPARSING_DEPENDENCIES    = python
+PYTHON_PYPARSING_SETUP_TYPE      = distutils
 
-# Shamelessly vampirised from python-pygame ;-)
-define PYTHON_PYPARSING_BUILD_CMDS
-	(cd $(@D);                                              \
-	 CC="$(TARGET_CC)"                                      \
-	 CFLAGS="$(TARGET_CFLAGS)"                              \
-	 LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
-	 CROSS_COMPILING=yes                                    \
-	 _python_sysroot=$(STAGING_DIR)                         \
-	 _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
-	 _python_prefix=/usr                                    \
-	 _python_exec_prefix=/usr                               \
-	 $(HOST_DIR)/usr/bin/python setup.py build              \
-	)
-endef
-
-# Shamelessly vampirised from python-pygame ;-)
-define PYTHON_PYPARSING_INSTALL_TARGET_CMDS
-	(cd $(@D);                                              \
-	 $(HOST_DIR)/usr/bin/python setup.py install            \
-	                            --prefix=$(TARGET_DIR)/usr  \
-	)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
