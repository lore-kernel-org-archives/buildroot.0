From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed,  8 Aug 2012 21:04:13 -0400
Subject: [Buildroot] [PATCH] uboot: add AIS binary target format
Message-ID: <1344474253-19265-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This format embeds the SPL boot code with U-Boot, which is necessary on
TI platforms such as the DA850.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index afc2f91..7f4b076 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -80,6 +80,9 @@ endif
 choice
 	prompt "U-Boot binary format"
 
+config BR2_TARGET_UBOOT_FORMAT_AIS
+	bool "u-boot.ais"
+
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e03d6a..b61400e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -25,6 +25,9 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BIN          = u-boot.kwb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
+UBOOT_BIN          = u-boot.ais
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
-- 
1.7.11.2
