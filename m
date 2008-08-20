From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 20 Aug 2008 13:04:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080820200412.16A1C3C360@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-20 13:04:11 -0700 (Wed, 20 Aug 2008)
New Revision: 23121

Log:
u-boot: fix wrong syntax in Makefile

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Some $(call insert_define, ..., ...) calls were lacking the comma after
the variable. That didn't lead to a syntax error but it didn't have any
effect on the output u-boot/include/config.h

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-08-20 14:28:58 UTC (rev 23120)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-08-20 20:04:11 UTC (rev 23121)
@@ -98,16 +98,16 @@
 	$(call insert_define, "CONFIG_ETHADDR", $(BR2_TARGET_UBOOT_ETHADDR))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_ETH1ADDR)),"")
-	$(call insert_define "CONFIG_ETH2ADDR", $(BR2_TARGET_UBOOT_ETH1ADDR))
+	$(call insert_define, "CONFIG_ETH2ADDR", $(BR2_TARGET_UBOOT_ETH1ADDR))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTARGS)),"")
-	$(call insert_define "CONFIG_BOOTARGS", $(BR2_TARGET_UBOOT_BOOTARGS))
+	$(call insert_define, "CONFIG_BOOTARGS", $(BR2_TARGET_UBOOT_BOOTARGS))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_BOOTCMD)),"")
-	$(call insert_define "CONFIG_BOOTCOMMAND", $(BR2_TARGET_UBOOT_BOOTCMD))
+	$(call insert_define, "CONFIG_BOOTCOMMAND", $(BR2_TARGET_UBOOT_BOOTCMD))
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_SILENT)),"")
-	$(call insert_define "CONFIG_SILENT_CONSOLE", "")
+	$(call insert_define, "CONFIG_SILENT_CONSOLE", "")
 endif
 	@echo "#endif /* __BR2_ADDED_CONFIG_H */" >> $(U_BOOT_INC_CONF_FILE)
 	touch $@
