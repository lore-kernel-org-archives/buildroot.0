From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 14:49:19 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090126144919.DA7D9768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 14:49:19 +0000 (Mon, 26 Jan 2009)
New Revision: 25052

Log:
u-boot: halt build early with description if no u-boot board name is set

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 14:49:00 UTC (rev 25051)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 14:49:19 UTC (rev 25052)
@@ -281,8 +281,14 @@
 #############################################################
 ifeq ($(BR2_TARGET_UBOOT),y)
 TARGETS+=u-boot
+
+# we NEED a board name
+ifeq ($(UBOOT_BOARD_NAME),)
+$(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
 
+endif
+
 u-boot-status:
 	@echo
 	@echo U_BOOT_INC_CONF_FILE = $(U_BOOT_INC_CONF_FILE)
