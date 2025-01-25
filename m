Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4E2C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67B570922;
	Fri, 28 Feb 2025 17:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHl36bw5pmAy; Fri, 28 Feb 2025 17:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8C07092D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8C07092D;
	Fri, 28 Feb 2025 17:05:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AAEB68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6154242E95
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKUIuCzX7fNS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FECA42EB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FECA42EB1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CC56867B4; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 22:07:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 821ce21fcf3dd5b4ccdfa7bacc96b396a9ca55f8
X-Git-Newrev: 057012eb2c2c2f2de6d739b051406e8ab560e26b
X-Patchwork-Hint: ignore
Message-Id: <20250228163020.7CC56867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_5_plus: new
 board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=057012eb2c2c2f2de6d739b051406e8ab560e26b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds basic support for the new OrangePi 5 Plus board:
- http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-plus-32GB.html

Brief summary of the board features:
- RK3588 Rockchip SoC
  - Quad-Core ARM Cortex-A76 Processor 2.4GHz
  - Quad-Core ARM Cortex-A55 Processor 1.8GHz
  - Mali G610 GPU
  - NPU 6 Tops INT4/INT8/INT16/FP16
- LPDDR4x: 8GB/16GB/32GB
- 2x USB 2.0
- 2x USB 3.0
- 2x HDMI out
- PCIe M.2 M-key socket (e.g. for NVMe)
- PCIe M.2 E-key socket (e.g. for WiFi/BT)
- 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM / CAN / I2S)
- and much much more ...

BSP includes the following components:
- mainline ATF v2.12
- mainline U-Boot v2024.10
- mainline Linux kernel v6.12.x

Unlike all the other boards from board/orangepi directory, this board
is not based on an Allwinner SoC. It is based on Rockchip RK3588 SoC.
So custom scripts and configs are used instead of common options from
the board/orangepi/common directory. Suggested scripts and configs are
based on those of Radxa Rock5B board.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Julien:
 - switch to human readable genimage.cfg partition type uuid
 - add ATF hash in custom hash patches
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 board/orangepi/orangepi-5-plus/extlinux.conf       |  4 ++
 board/orangepi/orangepi-5-plus/genimage.cfg        | 23 +++++++++
 board/orangepi/orangepi-5-plus/linux.fragment      |  9 ++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../orangepi-5-plus/patches/linux/linux.hash       |  2 +
 .../orangepi-5-plus/patches/uboot/uboot.hash       |  2 +
 board/orangepi/orangepi-5-plus/post-build.sh       |  5 ++
 board/orangepi/orangepi-5-plus/readme.txt          | 46 ++++++++++++++++++
 board/orangepi/orangepi-5-plus/u-boot.fragment     |  5 ++
 configs/orangepi_5_plus_defconfig                  | 55 ++++++++++++++++++++++
 12 files changed, 156 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5ca66b2f28..ff069b9c40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2949,12 +2949,14 @@ F:	package/sdbus-cpp/
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	boot/arm-trusted-firmware/
 F:	board/linksprite/pcduino
+F:	board/orangepi/orangepi-5-plus
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/orangepi/orangepi-pc-plus/
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/orangepi/orangepi-zero2w/
 F:	configs/linksprite_pcduino_defconfig
+F:	configs/orangepi_5_plus_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
diff --git a/board/orangepi/orangepi-5-plus/extlinux.conf b/board/orangepi/orangepi-5-plus/extlinux.conf
new file mode 100644
index 0000000000..c6421c3bf4
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/extlinux.conf
@@ -0,0 +1,4 @@
+label OrangePi 5 Plus Linux
+  kernel /boot/Image
+  devicetreedir /boot
+  append root=PARTLABEL=rootfs earlycon rootwait panic=10
diff --git a/board/orangepi/orangepi-5-plus/genimage.cfg b/board/orangepi/orangepi-5-plus/genimage.cfg
new file mode 100644
index 0000000000..5da0b4a2cf
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition uboot {
+		in-partition-table = "false"
+		image = "u-boot-rockchip.bin"
+		offset = 32K
+	}
+
+	partition uboot-env {
+		partition-type-uuid = u-boot-env
+		offset = 16M
+		size = 64K
+	}
+
+	partition rootfs {
+		partition-type-uuid = L
+		image = "rootfs.ext2"
+		bootable = true
+	}
+}
diff --git a/board/orangepi/orangepi-5-plus/linux.fragment b/board/orangepi/orangepi-5-plus/linux.fragment
new file mode 100644
index 0000000000..d5a4a6f24f
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/linux.fragment
@@ -0,0 +1,9 @@
+# net
+CONFIG_R8169=y
+CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
+
+# usbcam
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_UVC_COMMON=y
diff --git a/board/orangepi/orangepi-5-plus/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-5-plus/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..b5898cba3f
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/orangepi/orangepi-5-plus/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-5-plus/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-5-plus/patches/linux/linux.hash b/board/orangepi/orangepi-5-plus/patches/linux/linux.hash
new file mode 100644
index 0000000000..d00eed9a49
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  6f35f821433d8421be7167990747c7c4a0c451958fb96883446301af13d71152  linux-6.12.4.tar.xz
diff --git a/board/orangepi/orangepi-5-plus/patches/uboot/uboot.hash b/board/orangepi/orangepi-5-plus/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/board/orangepi/orangepi-5-plus/post-build.sh b/board/orangepi/orangepi-5-plus/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/orangepi/orangepi-5-plus/readme.txt b/board/orangepi/orangepi-5-plus/readme.txt
new file mode 100644
index 0000000000..83f84a0efe
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/readme.txt
@@ -0,0 +1,46 @@
+Intro
+=====
+
+This default configuration allows to start experimenting with the Buildroot
+environment for the OrangePi 5 Plus board. Default configuration brings up
+the board and allows access through the serial console.
+
+Orangepi 5 Plus links:
+- http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-plus-32GB.html
+
+Upstream support
+================
+
+Linux v6.12.x provides a good starting point for experiments with this board.
+All the basic features are already enabled including all the basic low-speed
+I2C/SPI/PWM peripherals, ethernet networking, USB 2.0, PCIe, eMMC, Audio.
+However advanced features such as graphics, display controllers, multimedia
+codecs, camera and image processing units are still in work. For details and
+updates check RK3588 hardware enablement status at Collabora gitlab, see:
+
+- https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md
+
+Also keep an eye on RK3588 updates in kernel release announcements, e.g.
+- https://kernelnewbies.org/Linux_6.12
+
+How to Build
+============
+  $ make orangepi_5_plus_defconfig
+  $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished there will be an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX status=progress
+  $ sudo sync
+
+Insert the micro SDcard into the Orangepi 5 Plus board and power it up.
+The console is on the TTL Debug UART 3-pin connector which is located
+near RTC connector and Type-C Power port.
+
+Note that baudrate for this board is 1500000 8N1.
diff --git a/board/orangepi/orangepi-5-plus/u-boot.fragment b/board/orangepi/orangepi-5-plus/u-boot.fragment
new file mode 100644
index 0000000000..ceba8d609a
--- /dev/null
+++ b/board/orangepi/orangepi-5-plus/u-boot.fragment
@@ -0,0 +1,5 @@
+CONFIG_ENV_SIZE=0x10000
+CONFIG_PARTITION_TYPE_GUID=y
+# CONFIG_ENV_IS_NOWHERE is not set
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_MMC_ENV_DEV=1
diff --git a/configs/orangepi_5_plus_defconfig b/configs/orangepi_5_plus_defconfig
new file mode 100644
index 0000000000..f283cbff7e
--- /dev/null
+++ b/configs/orangepi_5_plus_defconfig
@@ -0,0 +1,55 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-5-plus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="orangepi5plus"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the OrangePi 5 Plus board"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-5-plus/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-5-plus/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-5-plus/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-orangepi-5-plus"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3588"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi-5-plus-rk3588"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-5-plus/u-boot.fragment"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
