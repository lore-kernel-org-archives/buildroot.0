Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DF9C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 16:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90ACD419E2;
	Mon,  9 Jun 2025 16:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRmd6b7YKow3; Mon,  9 Jun 2025 16:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DF941A10
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DF941A10;
	Mon,  9 Jun 2025 16:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C43BA1F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 16:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B66924196B
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 16:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrB60rkDfDhd for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 16:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE3984033D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE3984033D
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 16:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC15681F76; Mon,  9 Jun 2025 16:53:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 18:06:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e9227311d9a63c9a829316e2ffb91cb70ed127f1
X-Git-Newrev: 51fc2f3846c81051d9743a02469128dd51fa0ff0
X-Patchwork-Hint: ignore
Message-Id: <20250609165307.BC15681F76@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/coolpi_4b: new
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
Content-Type: multipart/mixed; boundary="===============3199083266608202046=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3199083266608202046==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51fc2f3846c81051d9743a02469128dd51fa0ff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CoolPi 4B is a rk3588s based SBC[0].
Specification:
- Rockchip RK3588S
- LPDDR4 2/4/8/16 GB
- TF scard slot
- eMMC 8/32/64/128 GB module
- Gigabit ethernet drived by PCIE with RTL8111HS
- HDMI Type D out
- Mini DP out
- USB 2.0 Host x 2
- USB 3.0 OTG x 1
- USB 3.0 Host x 1
- WIFI/BT module AIC8800
- 40 pin header

[0] https://www.cool-pi.com/product/cp4b/

Signed-off-by: Andy Yan <andyshrk@163.com>
[Julien:
 - add missing BR2_GLOBAL_PATCH_DIR and hash files
 - add missing BR2_TARGET_UBOOT_NEEDS_GNUTLS
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/coolpi/coolpi-4b/extlinux.conf               |  4 ++
 board/coolpi/coolpi-4b/genimage.cfg                | 35 +++++++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/coolpi/coolpi-4b/patches/linux/linux.hash    |  2 +
 board/coolpi/coolpi-4b/patches/uboot/uboot.hash    |  2 +
 board/coolpi/coolpi-4b/post-image.sh               |  7 +++
 board/coolpi/coolpi-4b/readme.txt                  | 57 ++++++++++++++++++++++
 configs/coolpi_4b_defconfig                        | 41 ++++++++++++++++
 8 files changed, 149 insertions(+)

diff --git a/board/coolpi/coolpi-4b/extlinux.conf b/board/coolpi/coolpi-4b/extlinux.conf
new file mode 100644
index 0000000000..466ab1eed6
--- /dev/null
+++ b/board/coolpi/coolpi-4b/extlinux.conf
@@ -0,0 +1,4 @@
+label coolpi-4b-buildroot
+  kernel /Image.gz
+  devicetree /rk3588s-coolpi-4b.dtb
+  append root=/dev/mmcblk1p2 rw rootfstype=ext4 earlycon earlyprintk console=ttyS2,1500000n8 rootwait
diff --git a/board/coolpi/coolpi-4b/genimage.cfg b/board/coolpi/coolpi-4b/genimage.cfg
new file mode 100644
index 0000000000..826d899c95
--- /dev/null
+++ b/board/coolpi/coolpi-4b/genimage.cfg
@@ -0,0 +1,35 @@
+# SD card image for Cool PI 4b
+
+image boot.vfat {
+	vfat {
+		files = {
+			"Image.gz",
+			"rk3588s-coolpi-4b.dtb",
+			"extlinux"
+		}
+	}
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+		partition-table-type = "hybrid"
+	}
+
+	partition uboot {
+		in-partition-table = "false"
+		image = "u-boot-rockchip.bin"
+		offset = 32K
+	}
+
+	partition boot {
+		partition-type = "0xC"
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/coolpi/coolpi-4b/patches/linux-headers/linux-headers.hash b/board/coolpi/coolpi-4b/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/coolpi/coolpi-4b/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/coolpi/coolpi-4b/patches/linux/linux.hash b/board/coolpi/coolpi-4b/patches/linux/linux.hash
new file mode 100644
index 0000000000..ae11c54bfd
--- /dev/null
+++ b/board/coolpi/coolpi-4b/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  de8b97cfeae74c22f832ee4ca2333c157cc978d98baa122f0ee9c01796a2fe43  linux-6.14.10.tar.xz
diff --git a/board/coolpi/coolpi-4b/patches/uboot/uboot.hash b/board/coolpi/coolpi-4b/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..80ea21b7cb
--- /dev/null
+++ b/board/coolpi/coolpi-4b/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/board/coolpi/coolpi-4b/post-image.sh b/board/coolpi/coolpi-4b/post-image.sh
new file mode 100755
index 0000000000..65b79e81c8
--- /dev/null
+++ b/board/coolpi/coolpi-4b/post-image.sh
@@ -0,0 +1,7 @@
+#!/usr/bin/env bash
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+gzip -fk "${BINARIES_DIR}/Image"
+install -m 0644 -D "$BOARD_DIR/extlinux.conf" "$BINARIES_DIR/extlinux/extlinux.conf"
+support/scripts/genimage.sh -c board/coolpi/coolpi-4b/genimage.cfg
diff --git a/board/coolpi/coolpi-4b/readme.txt b/board/coolpi/coolpi-4b/readme.txt
new file mode 100644
index 0000000000..7213ab3bae
--- /dev/null
+++ b/board/coolpi/coolpi-4b/readme.txt
@@ -0,0 +1,57 @@
+Cool Pi 4B
+==============
+https://www.cool-pi.com/product/cp4b/
+
+Build:
+======
+  $ make coolpi_4b_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+.
+output/images/
+├── boot.vfat
+├── extlinux
+│   └── extlinux.conf
+├── Image
+├── Image.gz
+├── rk3588_bl31_v1.40.elf
+├── rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
+├── rk3588s-coolpi-4b.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── u-boot.bin
+└── u-boot-rockchip.bin
+
+Creating bootable SD card:
+==========================
+
+Simply invoke (as root)
+
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device.
+
+Booting:
+========
+
+Serial console:
+---------------
+The Cool Pi 4B has a 40-pin GPIO header.
+
+The Uart pins are as follows:
+
+pin 6:  gnd
+pin 8:  tx
+pin 10: rx
+
+Baudrate for this board is 1500000.
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
diff --git a/configs/coolpi_4b_defconfig b/configs/coolpi_4b_defconfig
new file mode 100644
index 0000000000..c9b5a86758
--- /dev/null
+++ b/configs/coolpi_4b_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14=y
+BR2_GLOBAL_PATCH_DIR="board/coolpi/coolpi-4b/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="coolpi"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the CoolPi 4B"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/coolpi/coolpi-4b/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.14.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588s-coolpi-4b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.48.elf"
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_OPENSSH=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="coolpi-4b-rk3588s"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============3199083266608202046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3199083266608202046==--
