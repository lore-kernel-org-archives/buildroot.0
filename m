Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7051C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 18:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9057670833;
	Sun, 29 Oct 2023 18:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9057670833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzP8qkVFgKJD; Sun, 29 Oct 2023 18:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E20870827;
	Sun, 29 Oct 2023 18:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E20870827
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1D11BF33E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 773EE4EFD3
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 773EE4EFD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfHkdvO5hrbM for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 18:43:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C1354ECF1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 18:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1354ECF1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2515F86109; Sun, 29 Oct 2023 18:43:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 19:43:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72c653367daaccb47089bfed4ca7ce459a75bde7
X-Git-Newrev: 9a51a07a9175cd564fffa89a6b8b851c258384a0
X-Patchwork-Hint: ignore
Message-Id: <20231029184356.2515F86109@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_licheepi_nano: new board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a51a07a9175cd564fffa89a6b8b851c258384a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the LicheePi Nano with mainline components:
  - U-Boot 2023.04
  - Linux 6.5.9

Board homepage and more usable WiKi:
  - https://wiki.sipeed.com/hardware/en/lichee/Nano/Nano.html
  - https://linux-sunxi.org/LicheePi_Nano

linux.fragment is required to disable some features in order to keep the
kernel size small, otherwise the board does not boot due to limited
memory. See note in readme.txt.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
[yann.morin.1998@free.fr:
  - use fixed kernel version
  - use manufacturer directory
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/sipeed/licheepi_nano/genimage.cfg   | 33 ++++++++++++
 board/sipeed/licheepi_nano/linux.fragment | 11 ++++
 board/sipeed/licheepi_nano/readme.txt     | 84 +++++++++++++++++++++++++++++++
 board/sipeed/licheepi_nano/uboot.fragment |  3 ++
 configs/sipeed_licheepi_nano_defconfig    | 45 +++++++++++++++++
 5 files changed, 176 insertions(+)

diff --git a/board/sipeed/licheepi_nano/genimage.cfg b/board/sipeed/licheepi_nano/genimage.cfg
new file mode 100644
index 0000000000..5e398eeb21
--- /dev/null
+++ b/board/sipeed/licheepi_nano/genimage.cfg
@@ -0,0 +1,33 @@
+flash w25q128 {
+	pebsize = 65536
+	numpebs = 256
+	minimum-io-unit-size = 1
+	sub-page-size = 1
+	vid-header-offset = 64
+}
+
+image flash.bin {
+	flash {}
+	flashtype = w25q128
+
+	partition uboot {
+		image = "u-boot-sunxi-with-spl.bin"
+		size = 512K
+	}
+
+	partition dtb {
+		image = "suniv-f1c100s-licheepi-nano.dtb"
+		size = 64K
+	}
+
+	partition zimage {
+		image = "zImage"
+		size = 5M
+	}
+
+	partition rootfs {
+		image = "rootfs.jffs2"
+		size = 0
+	}
+}
+
diff --git a/board/sipeed/licheepi_nano/linux.fragment b/board/sipeed/licheepi_nano/linux.fragment
new file mode 100644
index 0000000000..af68f28167
--- /dev/null
+++ b/board/sipeed/licheepi_nano/linux.fragment
@@ -0,0 +1,11 @@
+# CONFIG_NET is not set
+# CONFIG_DRM is not set
+# CONFIG_CMA is not set
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_UEVENT_HELPER=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_JFFS2_FS=y
diff --git a/board/sipeed/licheepi_nano/readme.txt b/board/sipeed/licheepi_nano/readme.txt
new file mode 100644
index 0000000000..1f1f8ef17d
--- /dev/null
+++ b/board/sipeed/licheepi_nano/readme.txt
@@ -0,0 +1,84 @@
+Intro
+=====
+
+This directory contains a buildroot configuration for building a
+LicheePi Nano image which can be flashed into the board.
+
+This frees the MMC port which can be used for an additional SD
+card of for a WiFi adapter.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+  $ make sipeed_licheepi_nano_defconfig
+
+Build the rootfs
+----------------
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+You may now build your rootfs with:
+
+  $ make
+
+(This may take a while, consider getting yourself a coffee ;-) )
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- flash.bin
+    +-- rootfs.jffs2
+    +-- rootfs.tar
+    +-- suniv-f1c100s-licheepi-nano.dtb
+    +-- u-boot.bin
+    +-- u-boot-sunxi-with-spl.bin
+    `-- zImage
+
+How to flash
+============
+
+Once the build process is finished you will have an image called
+"flash.bin" in the output/images/ directory. It contains the
+bootloader, the device tree, the kernel and the root file system.
+
+The device can be flashed when it is in special mode called "FEL
+mode". There are multiple ways to enter this mode described here:
+https://linux-sunxi.org/FEL#Entering_FEL_mode
+
+One way is to write one file from sunxi-tools to a SD card with:
+
+  $ sudo dd if=./output/build/host-sunxi-tools-*/bin/fel-sdboot.sunxi of=/dev/sdX bs=1024 seek=8
+
+Once the SD card is burned, insert it into your LicheePi Nano board,
+and plug the USB cable. A new USB device should be visible with
+lsusb:
+
+  1f3a:efe8 Allwinner Technology sunxi SoC OTG connector in FEL/flashing mode
+
+The image can be flashed with:
+
+  $ sudo ./output/host/bin/sunxi-fel -p spiflash-write 0 output/images/flash.bin
+
+Once this completes, remove the SD card and power the board. Your
+new system should come up now and start a console on the UART0
+serial port.
+
+Note
+====
+
+Some standard kernel features are disabled using the fragment in
+order to reduce the size. They can be enabled again if other
+features are disabled instead.
+
+For U-Boot, the upstream repository is preferred and the system
+boots, but loading the image from the flash takes a long time. It
+is much faster when using the branch "licheepi-nano-v2020.01" of
+this fork:
+https://github.com/florpor/u-boot
diff --git a/board/sipeed/licheepi_nano/uboot.fragment b/board/sipeed/licheepi_nano/uboot.fragment
new file mode 100644
index 0000000000..39f2bfe742
--- /dev/null
+++ b/board/sipeed/licheepi_nano/uboot.fragment
@@ -0,0 +1,3 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=tty0 console=ttyS0,115200 panic=5 rootwait root=/dev/mtdblock3 rw rootfstype=jffs2 mtdparts=spi0.0:512k(uboot)ro,64k(dtb),5M(kernel)ro,-(rootfs)"
+CONFIG_BOOTCOMMAND="sf probe 0 50000000; sf read 0x80C00000 0x80000 0x4000; sf read 0x80008000 0x90000 0x500000; bootz 0x80008000 - 0x80C00000"
diff --git a/configs/sipeed_licheepi_nano_defconfig b/configs/sipeed_licheepi_nano_defconfig
new file mode 100644
index 0000000000..8be26165d9
--- /dev/null
+++ b/configs/sipeed_licheepi_nano_defconfig
@@ -0,0 +1,45 @@
+# Target options
+BR2_arm=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="licheepi-nano"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Nano"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/licheepi_nano/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.5.9"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/licheepi_nano/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/suniv-f1c100s-licheepi-nano"
+
+# Filesystem images
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_FLASH_64=y
+BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
+BR2_TARGET_ROOTFS_JFFS2_PAD=y
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="licheepi_nano"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/sipeed/licheepi_nano/uboot.fragment"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required host utilities
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_SUNXI_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
