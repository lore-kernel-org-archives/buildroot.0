Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F2BC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 19:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEDAD409F5;
	Mon, 24 Feb 2025 19:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2dSOOOTEBRU; Mon, 24 Feb 2025 19:51:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19731409E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19731409E8;
	Mon, 24 Feb 2025 19:51:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46F8C1531
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2B540294
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srubjab00w03 for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 19:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E88400E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98E88400E0
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:51:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F0DA87A4D; Mon, 24 Feb 2025 19:51:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Feb 2025 20:47:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63f047971f994a92a89c94aa4c96e33afcad9592
X-Git-Newrev: 5a74a007ab9d06167ac32e813cec29415d8e756c
X-Patchwork-Hint: ignore
Message-Id: <20250224195104.7F0DA87A4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mn-ddr4-evk_defconfig: new
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a74a007ab9d06167ac32e813cec29415d8e756c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new defconfig for the imx8mn-ddr4-evk board that uses upstream
components, such as:

- Linux Kernel: Upstream version 6.12.16
- U-boot: Upstream version 2025.01
- ATF: Upstream version 2.12

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: Tested on board 700-31407 REV A5]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imx8mn-evk/extlinux.conf.in        |  4 ++
 board/freescale/imx8mn-evk/genimage.cfg.in         | 17 ++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../freescale/imx8mn-evk/patches/linux/linux.hash  |  2 +
 .../freescale/imx8mn-evk/patches/uboot/uboot.hash  |  2 +
 board/freescale/imx8mn-evk/post-build.sh           |  7 ++++
 board/freescale/imx8mn-evk/readme.txt              | 31 ++++++++++++++
 configs/imx8mn-ddr4-evk_defconfig                  | 48 ++++++++++++++++++++++
 9 files changed, 114 insertions(+)

diff --git a/board/freescale/imx8mn-evk/extlinux.conf.in b/board/freescale/imx8mn-evk/extlinux.conf.in
new file mode 100644
index 0000000000..fa9ad09813
--- /dev/null
+++ b/board/freescale/imx8mn-evk/extlinux.conf.in
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mn-ddr4-evk.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/freescale/imx8mn-evk/genimage.cfg.in b/board/freescale/imx8mn-evk/genimage.cfg.in
new file mode 100644
index 0000000000..10c52548cd
--- /dev/null
+++ b/board/freescale/imx8mn-evk/genimage.cfg.in
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = 32K
+	}
+
+	partition rootfs {
+		offset = 8M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..b5898cba3f
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx8mn-evk/patches/linux/linux.hash b/board/freescale/imx8mn-evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..5e0df51126
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.16.tar.xz
diff --git a/board/freescale/imx8mn-evk/patches/uboot/uboot.hash b/board/freescale/imx8mn-evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..50674352d7
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/freescale/imx8mn-evk/post-build.sh b/board/freescale/imx8mn-evk/post-build.sh
new file mode 100755
index 0000000000..604f387768
--- /dev/null
+++ b/board/freescale/imx8mn-evk/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/imx8mn-evk/readme.txt b/board/freescale/imx8mn-evk/readme.txt
new file mode 100644
index 0000000000..c5b4c05c48
--- /dev/null
+++ b/board/freescale/imx8mn-evk/readme.txt
@@ -0,0 +1,31 @@
+NXP i.MX8MN DDR4 EVK
+====================
+
+This is a Buildroot target for building an image for the imx8mn-ddr4-evk
+board using upstream components: TF-A, U-Boot and kernel.
+
+How to build it
+===============
+
+Configure Buildroot and build it:
+
+  $ make imx8mn-ddr4-evk_defconfig
+  $ make
+
+Flashing the SD card image
+==========================
+
+Copy the sdcard.img file into the SD card:
+
+  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>; sync
+
+
+Booting the board
+=================
+
+To boot your newly created system:
+
+- Insert the SD card in the MicroSD slot of the board.
+- Connect a serial to USB cable to the DEBUG port.
+- Open a terminal on ttyUSB2 port. For example: sudo picocom -b 115200 /dev/ttyUSB1
+- Power on the board.
diff --git a/configs/imx8mn-ddr4-evk_defconfig b/configs/imx8mn-ddr4-evk_defconfig
new file mode 100644
index 0000000000..66c95315f0
--- /dev/null
+++ b/configs/imx8mn-ddr4-evk_defconfig
@@ -0,0 +1,48 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mn-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mn-evk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-ddr4-evk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX_DDR4=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_ddr4_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
