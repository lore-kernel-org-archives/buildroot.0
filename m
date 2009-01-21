From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 15:49:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090121154908.53870770FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-21 15:49:06 +0000 (Wed, 21 Jan 2009)
New Revision: 24939

Log:
u-boot: unbreak target tools

Got broken by r24697.

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-21 15:29:37 UTC (rev 24938)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-21 15:49:06 UTC (rev 24939)
@@ -21,7 +21,7 @@
 MKIMAGE:=$(U_BOOT_TOOLS)
 U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
-U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
+U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS)
 
 ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
 #"))
@@ -54,10 +54,10 @@
 
 U_BOOT_TARGET_TOOLS:=
 ifeq ($(BR2_TARGET_UBOOT_TOOL_MKIMAGE),y)
-U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/bin/mkimage
+U_BOOT_TARGETS+=$(TARGET_DIR)/usr/bin/mkimage
 endif
 ifeq ($(BR2_TARGET_UBOOT_TOOL_ENV),y)
-U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/sbin/fw_printenv
+U_BOOT_TARGETS+=$(TARGET_DIR)/usr/sbin/fw_printenv
 endif
 
 U_BOOT_CONFIGURE_OPTS :=
