From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 14:50:01 +0200
Subject: [Buildroot] [git commit] uboot: mark Freescale i.MX28 specific
	formats as such
Message-ID: <20150719125006.BC01881DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58b2598a3d7089c26143fcb2c97163dca8ddea5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's rather unclear that uboot.sb, uboot.sd and uboot.nand are
Freescale i.MX28 specific, so let's make that clear in the prompt of
each option, like we do for the Marvell-specific uboot.kwb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d28d93d..be51642 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -178,11 +178,11 @@ config BR2_TARGET_UBOOT_FORMAT_ELF
 
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
@@ -194,7 +194,7 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 config BR2_TARGET_UBOOT_FORMAT_NAND
 	depends on BR2_arm
-	bool "u-boot.nand"
+	bool "u-boot.nand (Freescale i.MX28)"
 	help
 	  This is Freescale i.MX28 BootStream format (.sb), with a header
 	  for booting from a NAND flash.
