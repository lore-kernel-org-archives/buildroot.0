From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:04:28 +0200
Subject: [Buildroot] [git commit] boot/uboot: remove Blackfin related code
Message-ID: <20180415200629.09FD3886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be37c03943e5919024addbe92a2941c4bcfd6c29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 4 ----
 boot/uboot/uboot.mk  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index cef8ccd3cd..b980745d1b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -202,10 +202,6 @@ config BR2_TARGET_UBOOT_FORMAT_KWB
 	bool "u-boot.kwb (Marvell)"
 	depends on BR2_arm
 
-config BR2_TARGET_UBOOT_FORMAT_LDR
-	bool "u-boot.ldr"
-	depends on BR2_bfin
-
 config BR2_TARGET_UBOOT_FORMAT_ELF
 	bool "u-boot.elf"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 24d3e4ef54..03bd7ea743 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -61,10 +61,6 @@ UBOOT_BINS += u-boot.ais
 UBOOT_MAKE_TARGET += u-boot.ais
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
-UBOOT_BINS += u-boot.ldr
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BINS += u-boot-nand.bin
 endif
