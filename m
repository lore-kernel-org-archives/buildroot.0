From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 10 Apr 2013 23:23:39 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: Add ELF target
In-Reply-To: <1365654219-15272-1-git-send-email-spenser@gillilanding.com>
References: <1365654219-15272-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1365654219-15272-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <Spenser309@gmail.com>


Signed-off-by: Spenser Gilliland <Spenser309@gmail.com>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bc5ce19..9ece417 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -115,6 +115,9 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 	depends on BR2_bfin
 	bool "u-boot.ldr"
 
+config BR2_TARGET_UBOOT_FORMAT_ELF
+	bool "u-boot.elf"
+
 endchoice
 
 config BR2_TARGET_UBOOT_OMAP_IFT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c337e75..cd42fc4 100644
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
