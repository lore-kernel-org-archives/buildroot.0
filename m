From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun,  4 Aug 2019 14:22:52 +0200
Subject: [Buildroot] [PATCH] boot/uboot: use proper spelling of "U-Boot"
Message-ID: <1564921372-1314-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 boot/uboot/Config.in | 4 ++--
 boot/uboot/uboot.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f64df50..8642b58 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -249,7 +249,7 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 	  This is Freescale i.MX28 SB format, with a header for booting
 	  from an SD card.
 
-	  U-boot includes an mxsboot tool to generate this format,
+	  U-Boot includes an mxsboot tool to generate this format,
 	  starting from 2011.12.
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
@@ -261,7 +261,7 @@ config BR2_TARGET_UBOOT_FORMAT_NAND
 	  This is Freescale i.MX28 BootStream format (.sb), with a
 	  header for booting from a NAND flash.
 
-	  U-boot includes an mxsboot tool to generate this format,
+	  U-Boot includes an mxsboot tool to generate this format,
 	  starting from 2011.12.
 
 	  There are two possibilities when preparing an image writable
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4ea2b96..3bdedd7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -390,7 +390,7 @@ endef
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
-$(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
+$(error Please provide U-Boot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
 endif
 endif
 UBOOT_DEPENDENCIES += host-uboot-tools
@@ -399,7 +399,7 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_BOOT_SCRIPT),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)),)
-$(error Please define a source file for Uboot boot script (BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE setting))
+$(error Please define a source file for U-Boot boot script (BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE setting))
 endif
 endif
 UBOOT_DEPENDENCIES += host-uboot-tools
-- 
2.7.4
