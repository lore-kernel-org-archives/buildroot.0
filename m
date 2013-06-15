From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jun 2013 23:24:09 +0200
Subject: [Buildroot] [git commit] uboot: Add ELF target
Message-ID: <20130615213835.107339AE65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d27205ab1c140f9d81fa200f36d118a3dbdad33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

adds ELF image option to uboot

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    4 +++-
 2 files changed, 6 insertions(+), 1 deletions(-)

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
index 3e188ee..b357e0f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -26,7 +26,9 @@ UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE  = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
+UBOOT_BIN          = u-boot
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BIN          = u-boot.kwb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
