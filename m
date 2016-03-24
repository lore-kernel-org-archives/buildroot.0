From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 24 Mar 2016 09:29:12 +0100
Subject: [Buildroot] [PATCH 4/4] board/atmel/xplained/readme.txt: update
	documentation
In-Reply-To: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1458808152-15778-4-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This documentation is not only dedicated to SAMA5D3 Xplained boards. The
procedure is the same for SAMA5D4 and SAMA5D2.
sfdisk, -u (--unit) option is obsolete on latest versions.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 board/atmel/xplained/readme.txt | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
index ba45122..4833e72 100644
--- a/board/atmel/xplained/readme.txt
+++ b/board/atmel/xplained/readme.txt
@@ -1,9 +1,8 @@
-Atmel SAMA5D3 Xplained board
-============================
+Atmel SAMA5Dx Xplained boards
+=============================
 
 This document explains how to set up a basic Buildroot system on the
-Atmel SAMA5D3 Xplained board, whose main site is
-http://www.atmel.com/tools/ATSAMA5D3-XPLD.aspx. Additional details can
+Atmel SAMA5D2/SAMA5D3/SAMA5D4 Xplained boards. Additional details can
 also be found on the http://www.at91.com/linux4sam/bin/view/Linux4SAM/
 web site.
 
@@ -16,7 +15,9 @@ from NAND flash, see board/atmel/readme.txt
 Configuring and building Buildroot
 ----------------------------------
 
-  make atmel_sama5d3_xplained_mmc_defconfig
+Use the alternative mmc defconfig for you board. For instance:
+
+  make atmel_sama5d2_xplained_mmc_defconfig
   make
 
 Preparing the SD card
@@ -27,8 +28,8 @@ FAT16 partition for the bootloaders, kernel image and Device Tree
 blob, and one ext4 partition for the root filesystem. To partition the
 SD card:
 
-sudo sfdisk -uM /dev/mmcblk0 <<EOF
-,64,6
+sudo sfdisk /dev/mmcblk0 <<EOF
+,64MiB,6
 ;
 EOF
 
@@ -52,10 +53,10 @@ sudo mount /dev/mmcblk0p2 /media/rootfs
 Copy the bootloaders, kernel image and Device Tree blob to the first
 partition:
 
-cp output/images/u-boot-spl.bin /media/boot/boot.bin
-cp output/images/u-boot.img /media/boot/u-boot.img
-cp output/images/zImage /media/boot/zImage
-cp output/images/at91-sama5d3_xplained.dtb /media/boot/at91-sama5d3_xplained.dtb
+cp output/images/boot.bin /media/boot/
+cp output/images/u-boot.bin /media/boot/
+cp output/images/zImage /media/boot/
+cp output/images/at91-sama5d2_xplained.dtb /media/boot/
 
 Extract the root filesystem to the second partition:
 
-- 
2.5.0
