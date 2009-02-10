From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 15:19:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090210151925.1F80776275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 15:19:24 +0000 (Tue, 10 Feb 2009)
New Revision: 25291

Log:
u-boot: remove unused BOOTARGS / BOOTCMD handling

Not available in Kconfig and no references to it in the tree.

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-02-10 15:19:04 UTC (rev 25290)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-02-10 15:19:24 UTC (rev 25291)
@@ -134,16 +134,6 @@
 	$(call insert_define, CONFIG_ETH1ADDR, $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
 endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),)
-ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),"")
-	$(call insert_define, CONFIG_BOOTARGS, $(BR2_TARGET_UBOOT_BOOTARGS))
-endif
-endif
-ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),)
-ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
-	$(call insert_define, CONFIG_BOOTCOMMAND, $(BR2_TARGET_UBOOT_BOOTCMD))
-endif
-endif
 ifeq ($(BR2_TARGET_UBOOT_SILENT),y)
 	$(call insert_define, CONFIG_SILENT_CONSOLE,)
 endif
@@ -298,8 +288,6 @@
 	@echo BR2_TARGET_UBOOT_NETMASK = $(BR2_TARGET_UBOOT_NETMASK)
 	@echo BR2_TARGET_UBOOT_ETH0ADDR = $(BR2_TARGET_UBOOT_ETHADDR)
 	@echo BR2_TARGET_UBOOT_ETH1ADDR = $(BR2_TARGET_UBOOT_ETH1ADDR)
-	@echo BR2_TARGET_UBOOT_BOOTARGS = $(BR2_TARGET_UBOOT_BOOTARGS)
-	@echo BR2_TARGET_UBOOT_BOOTCMD = $(BR2_TARGET_UBOOT_BOOTCMD)
 	@echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
 	@echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
 	@exit 0
