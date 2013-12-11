From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:48 +0100
Subject: [Buildroot] [PATCHv2 13/36] python-pyparsing: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyparsing/python-pyparsing.mk | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

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
-- 
1.8.1.2
