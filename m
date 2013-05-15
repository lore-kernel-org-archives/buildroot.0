From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 18:12:02 -0500
Subject: [Buildroot] [PATCH 1/3] uboot: Add ELF target
Message-ID: <1368659524-21154-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <Spenser309@gmail.com>

adds ELF image option to uboot

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a1874a1..aadf757 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -98,6 +98,9 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 	depends on BR2_bfin
 	bool "u-boot.ldr"
 
+config BR2_TARGET_UBOOT_FORMAT_ELF
+	bool "u-boot.elf"
+
 endchoice
 
 config BR2_TARGET_UBOOT_OMAP_IFT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 004bdf2..593bb29 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -25,7 +25,9 @@ UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE  = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
+UBOOT_BIN          = u-boot
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BIN          = u-boot.kwb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
-- 
1.7.9.5
