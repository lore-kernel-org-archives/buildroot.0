From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 14:10:56 +0200
Subject: [Buildroot] [PATCH] uboot: mark Freescale i.MX28 specific formats
	as such
Message-ID: <1436616656-2566-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's rather unclear that uboot.sb, uboot.sd and uboot.nand are
Freescale i.MX28 specific, so let's make that clear in the prompt of
each option, like we do for the Marvell-specific uboot.kwb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index fa1741c..f2ddc2f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -128,11 +128,11 @@ config BR2_TARGET_UBOOT_FORMAT_ELF
 
 config BR2_TARGET_UBOOT_FORMAT_SB
 	depends on BR2_arm
-	bool "u-boot.sb"
+	bool "u-boot.sb (Freescale i.MX28)"
 
 config BR2_TARGET_UBOOT_FORMAT_SD
 	depends on BR2_arm
-	bool "u-boot.sd"
+	bool "u-boot.sd (Freescale i.MX28)"
 	help
 	  This is Freescale i.MX28 SB format, with a header for booting
 	  from an SD card.
@@ -144,7 +144,7 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 config BR2_TARGET_UBOOT_FORMAT_NAND
 	depends on BR2_arm
-	bool "u-boot.nand"
+	bool "u-boot.nand (Freescale i.MX28)"
 	help
 	  This is Freescale i.MX28 BootStream format (.sb), with a header
 	  for booting from a NAND flash.
-- 
2.4.5
