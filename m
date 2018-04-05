From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:19 +0200
Subject: [Buildroot] [PATCH 05/23] boot/uboot: remove Blackfin related code
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.14.3
