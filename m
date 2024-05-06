Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2DCC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D660E80B43;
	Mon,  6 May 2024 19:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fcvmmdt42sA3; Mon,  6 May 2024 19:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B219B80B47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B219B80B47;
	Mon,  6 May 2024 19:58:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDA561BF3CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB03280B41
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmsJkQxTdyEw for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C355B808A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C355B808A7
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:58:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA73B86805; Mon,  6 May 2024 19:58:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 21:58:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5272c6bea1247e87a32947bd960757a19fdf8b90
X-Git-Newrev: 837d2a7ef257bfe0c091ab8ed3416ccc94b188b0
X-Patchwork-Hint: ignore
Message-Id: <20240506195843.AA73B86805@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_zero2w: new board
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=837d2a7ef257bfe0c091ab8ed3416ccc94b188b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds basic support for the new OrangePi Zero2W board:
- http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html

Brief summary of the board features:
- H618 Allwinner SoC
  - Quad-Core ARM Cortex-A53 Processor 1.5GHz
  - Mali G31 MP2 GPU
- LPDDR4: 1GB/2GB/4GB
- Wi-Fi5.0+BT 5.0
- 2x Type-C USB 2.0
- 1x Mini HDMI
- Wi-Fi 5.0 + BT 5.0
- 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM)
- 24-pin expansion interface (2x USB 2.0 / ETH / IR / audio)

BSP includes the following components:
- mainline ATF v2.10
- mainline U-Boot v2024.04
- mainline Linux kernel v6.8

No custom scripts required: all is covered by common orangepi scripts.
However new option BR2_DOWNLOAD_FORCE_CHECK_HASHES requires checksums
for all the BSP components. They are added as board specific patches.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../orangepi-zero2w/patches/linux/linux.hash       |  2 +
 .../orangepi-zero2w/patches/uboot/uboot.hash       |  2 +
 board/orangepi/orangepi-zero2w/readme.txt          | 32 ++++++++++++
 configs/orangepi_zero2w_defconfig                  | 58 ++++++++++++++++++++++
 7 files changed, 99 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c2d3f52a59..3b19665a84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2800,11 +2800,13 @@ F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/orangepi/orangepi-pc-plus/
 F:	board/orangepi/orangepi-zero-plus2/
+F:	board/orangepi/orangepi-zero2w/
 F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
+F:	configs/orangepi_zero2w_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..c9d043c46f
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero2w/patches/linux/linux.hash b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
new file mode 100644
index 0000000000..5a6f308c7b
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
diff --git a/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/orangepi/orangepi-zero2w/readme.txt b/board/orangepi/orangepi-zero2w/readme.txt
new file mode 100644
index 0000000000..84796579da
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/readme.txt
@@ -0,0 +1,32 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi Zero2W. Current configuration will
+bring-up the board and allow access through the serial console.
+
+Orangepi Zero 2W links:
+- http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html
+- https://linux-sunxi.org/Xunlong_Orange_Pi_Zero2W
+
+How to build
+============
+
+    $ make orangepi_zero2w_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Orangepi Zero2W and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
new file mode 100644
index 0000000000..4d8f25f451
--- /dev/null
+++ b/configs/orangepi_zero2w_defconfig
@@ -0,0 +1,58 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero2w"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero2w"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero2W"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# host tools
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# image scripts
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
