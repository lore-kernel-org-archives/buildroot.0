From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 22 Jul 2007 10:17:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package target/device/Atmel
Message-ID: <20070722171703.79776A4756@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-22 10:17:03 -0700 (Sun, 22 Jul 2007)
New Revision: 19194

Log:
ATMEL_MIRROR needs to be available before toolchain is built

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-22 17:04:11 UTC (rev 19193)
+++ trunk/buildroot/package/Makefile.in	2007-07-22 17:17:03 UTC (rev 19194)
@@ -106,6 +106,11 @@
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(TOOLCHAIN_EXTERNAL_PREFIX)
 TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 IMAGE:=$(BINARIES_DIR)/rootfs.$(TOOLCHAIN_EXTERNAL_PREFIX)
+
+# ATMEL_MIRROR Needs to be available before toolchain is built
+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+#"))
+
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 KERNEL_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-22 17:04:11 UTC (rev 19193)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-07-22 17:17:03 UTC (rev 19194)
@@ -1,6 +1,4 @@
 # *******************************************************************
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
-#"))
 
 ifeq ($(strip $(BR2_TARGET_ATMEL)),y)
 ATMEL_PATH:=target/device/Atmel
