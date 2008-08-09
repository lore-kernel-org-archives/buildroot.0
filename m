From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 9 Aug 2008 14:03:44 +0200
Subject: [Buildroot] [PATCH] u-boot: fix wrong syntax in Makefile
Message-ID: <200808091403.44855.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

u-boot: fix wrong syntax in Makefile

Some $(call insert_define, ..., ...) calls were lacking the comma after the
variable. That didn't lead to a syntax error but it didn't have any effect on
the output u-boot/include/config.h
---
 target/u-boot/Makefile.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index d7af24c..9148e05 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -98,16 +98,16 @@ ifneq ($(strip $(BR2_TARGET_UBOOT_ETHADDR)),"")
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
