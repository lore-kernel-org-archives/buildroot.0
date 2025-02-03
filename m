Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00424C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D96E8813CE;
	Fri, 28 Feb 2025 17:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2Ly9dTQJHCP; Fri, 28 Feb 2025 17:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55FA280BED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55FA280BED;
	Fri, 28 Feb 2025 17:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1109D711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79BC8400B0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyOB5dZkx4ST for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D292942F27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D292942F27
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEFC085E25; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 18:50:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 774035189fc211fccedb856b1718c8836be94387
X-Git-Newrev: 34b047a442b1b3c64713972fc54d98c05a672c7c
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.CEFC085E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/ls1043a-rdb: new
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
Content-Type: multipart/mixed; boundary="===============7933416280608848645=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7933416280608848645==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=34b047a442b1b3c64713972fc54d98c05a672c7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a reference design board for the NXP LS1043A SoC.

The config is heavily based on the ls1046a-frwy_defconfig.

see https://www.nxp.com/design/design-center/development-boards-and-designs/LS1043A-RDB

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: remove extra white space in readme.txt]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 board/freescale/ls1043a-rdb/genimage.cfg           | 29 ++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../freescale/ls1043a-rdb/patches/linux/linux.hash |  2 +
 .../freescale/ls1043a-rdb/patches/uboot/uboot.hash |  2 +
 board/freescale/ls1043a-rdb/readme.txt             | 85 ++++++++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 +
 configs/ls1043a-rdb_defconfig                      | 43 +++++++++++
 9 files changed, 170 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f8b24e7602..a82cb17156 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,8 @@ F:	package/glorytun/
 N:	Akhilesh Nema <nemaakhilesh@gmail.com>
 F:	board/freescale/ls1046a-rdb/
 F:	configs/ls1046a-rdb_defconfig
+F:	board/freescale/ls1043a-rdb/
+F:	configs/ls1043a-rdb_defconfig
 
 N:	Alejandro González <alejandro.gonzalez.correo@gmail.com>
 F:	package/qprint/
diff --git a/board/freescale/ls1043a-rdb/genimage.cfg b/board/freescale/ls1043a-rdb/genimage.cfg
new file mode 100644
index 0000000000..b0ccec0a72
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/genimage.cfg
@@ -0,0 +1,29 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition fsbl {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition ssbl {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition fman {
+		offset = 9M
+		in-partition-table = "no"
+		image = "fsl_fman_ucode_ls1043_r1.1_108_4_9.bin"
+	}
+
+	partition rootfs {
+		offset = 16M
+		partition-type = 0x83
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..344a6299d8
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f03dad74e5c3df8059554def03e9298b6fbd4ffdd3e940a18b7e84a60b12a37a  atf-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/linux-headers/linux-headers.hash b/board/freescale/ls1043a-rdb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/ls1043a-rdb/patches/linux/linux.hash b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..fa38fb1f75
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  5665b927616a7e27e69f3f8fface6dd693b01f35d42ae4f9a0f0a10be3621487  linux-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..a1e3b69376
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  00fc7bd053de19d02c990b3aa214a27c6103f4306e756f3f6d4afb12314556e4  u-boot-lf-6.6.52-2.2.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/readme.txt b/board/freescale/ls1043a-rdb/readme.txt
new file mode 100644
index 0000000000..2770cc5573
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/readme.txt
@@ -0,0 +1,85 @@
+***************
+NXP LS1043A-RDB
+***************
+
+This file documents the Buildroot support for the LS1043A Reference Design Board.
+
+for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+  - https://www.nxp.com/design/design-center/development-boards-and-designs/LS1043A-RDB
+  - https://www.nxp.com/products/LS1043A
+
+for the NXP LDP (Linux Distribution POC), see
+  - https://www.nxp.com/design/design-center/software/embedded-software/linux-software-and-development-tools/layerscape-linux-distribution-poc:LAYERSCAPE-SDK
+
+the components provided by NXP are:
+  - rcw, lf-6.6.52-2.2.0
+  - atf (fork), lf-6.6.52-2.2.0
+  - uboot (fork), lf-6.6.52-2.2.0
+  - qoriq-fm-ucode (blob), lf-6.6.52-2.2.0
+  - linux (fork), lf-6.6.52-2.2.0
+
+Build
+=====
+
+First, configure Buildroot for the LS1043A-RDB board:
+
+  make ls1043a-rdb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl
+  - fip.bin
+  - fsl_fman_ucode_ls1043_r1.1_106_4_18.bin
+  - fsl_fman_ucode_ls1043_r1.1_108_4_9.bin
+  - fsl-ls1043a-rdb.dtb
+  - fsl-ls1043a-rdb-sdk.dtb
+  - Image
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/sdX
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/ls1043a-rdb/genimage.cfg.
+
+Boot the LS1043A-ARDB board
+===========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the DIP switches
+  SW3[1:8] = 10110011
+  SW4[1:8] = 00100000
+  SW5[1:8] = 00100010
+  (SW5[1:8] and SW4[1] should be set to 001000000_0 for the SD card boot)
+- put a Micro-USB cable into the console port and connect using a terminal emulator
+  at 115200 bps, 8n1.
+- power on the board.
+
+Alternatively, SD card boot can also be selected from the uboot command prompt:
+- insert the SD card in the SD slot of the board;
+- put a Micro-USB cable into console Port and connect using a terminal emulator
+- power on the board.
+- press any key to stop at the uboot command prompt.
+- run the following uboot command
+  => cpld reset sd
diff --git a/board/freescale/ls1043a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1043a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..b521b335df
--- /dev/null
+++ b/board/freescale/ls1043a-rdb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label ls1043ardb-buildroot
+  kernel /boot/Image
+  devicetree /boot/fsl-ls1043a-rdb-sdk.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 earlycon=uart8250,mmio,0x21c0500 rootwait
diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
new file mode 100644
index 0000000000..d70e8692ab
--- /dev/null
+++ b/configs/ls1043a-rdb_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1043a-rdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="ls1043ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/freescale/ls1043a-rdb/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1043a-rdb/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.52-2.2.0)/linux-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1043a-rdb freescale/fsl-ls1043a-rdb-sdk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_QORIQ_FM_UCODE=y
+BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM="ls1043"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.52-2.2.0)/atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1043ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.52-2.2.0)/u-boot-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1043ardb_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1043ardb/RR_FQPP_1455/rcw_1600_sdboot.bin"

--===============7933416280608848645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7933416280608848645==--
