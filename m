From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 13:36:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/AMD/DBAu1500
Message-ID: <20080329203654.4326C3C4F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 13:36:54 -0700 (Sat, 29 Mar 2008)
New Revision: 21564

Log:
Remove duplication of default kernel patch dir setting

Modified:
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk


Changeset:
Modified: trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2008-03-29 20:36:24 UTC (rev 21563)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2008-03-29 20:36:54 UTC (rev 21564)
@@ -30,7 +30,8 @@
 LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # kernel patches
-LINUX26_PATCH_DIR=target/device/AMD/DBAu1500/kernel-patches/
+# This is default anyway
+# LINUX26_PATCH_DIR=$(BOARD_PATH)/kernel-patches/
 
 LINUX26_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS) ARCH=$(KERNEL_ARCH) \
 	PATH=$(TARGET_PATH) INSTALL_MOD_PATH=$(TARGET_DIR) \
