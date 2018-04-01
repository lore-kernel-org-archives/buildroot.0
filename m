From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:06:37 +0200
Subject: [Buildroot] [git commit] boot/*/Config.in: fix attributes order
Message-ID: <20180401060642.8F0FA814F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f96b4b9e5716a3ebbcaa239020aabc865603746b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... to follow the convention: type, default, depends on, select, help.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap/Config.in     |  2 +-
 boot/at91bootstrap3/Config.in    |  2 +-
 boot/at91dataflashboot/Config.in |  2 +-
 boot/lpc32xxcdl/Config.in        |  2 +-
 boot/mxs-bootlets/Config.in      |  8 ++++----
 boot/uboot/Config.in             | 12 ++++++------
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 57fdeda946..96cfdbc7e9 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_AT91BOOTSTRAP
-	depends on BR2_arm926t
 	bool "AT91 Bootstrap"
+	depends on BR2_arm926t
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
 	  devices. It integrates algorithms for:
diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 237deb929c..bdc1e775a8 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_AT91BOOTSTRAP3
-	depends on BR2_arm926t || BR2_cortex_a5
 	bool "AT91 Bootstrap 3"
+	depends on BR2_arm926t || BR2_cortex_a5
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
 	  devices. It integrates algorithms for:
diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 80b57a4ad0..4055f96410 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
-	depends on BR2_arm926t
 	bool "AT91 DataFlashBoot"
+	depends on BR2_arm926t
diff --git a/boot/lpc32xxcdl/Config.in b/boot/lpc32xxcdl/Config.in
index ce7589c35c..97137aa7d4 100644
--- a/boot/lpc32xxcdl/Config.in
+++ b/boot/lpc32xxcdl/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_LPC32XXCDL
-	depends on BR2_arm926t
 	bool "LPC32XX CDL (kickstart and S1L)"
+	depends on BR2_arm926t
 
 if BR2_TARGET_LPC32XXCDL
 
diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index 4bb07a06f5..b3e392afa8 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -24,8 +24,8 @@ config BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT
 endchoice
 
 config BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL
-	depends on BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL
 	string "URL of custom bootlets tarball"
+	depends on BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL
 
 if BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT
 
@@ -43,16 +43,16 @@ choice
 	  Select which bootstream to generate
 
 config BR2_TARGET_MXS_BOOTLETS_BAREBOX
-	depends on BR2_TARGET_BAREBOX
 	bool "Barebox Bootloader"
+	depends on BR2_TARGET_BAREBOX
 
 config BR2_TARGET_MXS_BOOTLETS_LINUX
-	depends on BR2_LINUX_KERNEL
 	bool "Linux Kernel"
+	depends on BR2_LINUX_KERNEL
 
 config BR2_TARGET_MXS_BOOTLETS_UBOOT
-	depends on BR2_TARGET_UBOOT
 	bool "U-boot bootloader"
+	depends on BR2_TARGET_UBOOT
 
 endchoice
 
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 264f343767..d96e7f687f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -199,23 +199,23 @@ config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
 config BR2_TARGET_UBOOT_FORMAT_KWB
-	depends on BR2_arm
 	bool "u-boot.kwb (Marvell)"
+	depends on BR2_arm
 
 config BR2_TARGET_UBOOT_FORMAT_LDR
-	depends on BR2_bfin
 	bool "u-boot.ldr"
+	depends on BR2_bfin
 
 config BR2_TARGET_UBOOT_FORMAT_ELF
 	bool "u-boot.elf"
 
 config BR2_TARGET_UBOOT_FORMAT_SB
-	depends on BR2_arm
 	bool "u-boot.sb (Freescale i.MX28)"
+	depends on BR2_arm
 
 config BR2_TARGET_UBOOT_FORMAT_SD
-	depends on BR2_arm
 	bool "u-boot.sd (Freescale i.MX28)"
+	depends on BR2_arm
 	help
 	  This is Freescale i.MX28 SB format, with a header for booting
 	  from an SD card.
@@ -226,8 +226,8 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
 config BR2_TARGET_UBOOT_FORMAT_NAND
-	depends on BR2_arm
 	bool "u-boot.nand (Freescale i.MX28)"
+	depends on BR2_arm
 	help
 	  This is Freescale i.MX28 BootStream format (.sb), with a header
 	  for booting from a NAND flash.
@@ -303,10 +303,10 @@ config BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME
 endmenu
 
 config BR2_TARGET_UBOOT_OMAP_IFT
+	bool "produce a .ift signed image (OMAP)"
 	depends on BR2_TARGET_UBOOT_FORMAT_BIN
 	depends on BR2_arm || BR2_armeb
 	select BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
-	bool "produce a .ift signed image (OMAP)"
 	help
 	  Use gpsign to produce an image of u-boot.bin signed with
 	  a Configuration Header for booting on OMAP processors.
