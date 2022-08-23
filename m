Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D62ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5512140B9F;
	Sun, 11 Sep 2022 09:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5512140B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9gPZtMcY57o; Sun, 11 Sep 2022 09:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A43F40629;
	Sun, 11 Sep 2022 09:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A43F40629
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2533C1BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37305813DB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37305813DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRKrwZ4ca7GD for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F3583EF2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F3583EF2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0CF383518; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:18:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a340349bccf74ff402ae5487fcd1d7d4af5db1b
X-Git-Newrev: 75cb88ae667002454aa3a3ec2b927cd171f3bfff
X-Patchwork-Hint: ignore
Message-Id: <20220911084826.C0CF383518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1028ardb: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=75cb88ae667002454aa3a3ec2b927cd171f3bfff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the reference design board for the NXP LS1028a SoC.

see https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/freescale/ls1028ardb/genimage.cfg            | 23 +++++++++
 board/freescale/ls1028ardb/readme.txt              | 60 ++++++++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 ++
 .../etc/udev/rules.d/73-fsl-enetc-networking.rules | 16 ++++++
 configs/ls1028ardb_defconfig                       | 56 ++++++++++++++++++++
 6 files changed, 161 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 34cce542bd..55b23ebef2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1020,9 +1020,11 @@ N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
 N:	Francois Perrad <francois.perrad@gadz.org>
+F:	board/freescale/ls1028ardb/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
+F:	configs/ls1028ardb_defconfig
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
 F:	configs/olimex_stmp157_olinuxino_lime_defconfig
diff --git a/board/freescale/ls1028ardb/genimage.cfg b/board/freescale/ls1028ardb/genimage.cfg
new file mode 100644
index 0000000000..3efef0bffc
--- /dev/null
+++ b/board/freescale/ls1028ardb/genimage.cfg
@@ -0,0 +1,23 @@
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
+	partition rootfs {
+		offset = 8M
+		partition-type = 0x83
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
new file mode 100644
index 0000000000..93396a4199
--- /dev/null
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -0,0 +1,60 @@
+**************
+NXP LS1028ARDB
+**************
+
+This file documents the Buildroot support for the LS1028A Reference Design Board.
+
+for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+  - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
+  - https://www.nxp.com/LS1028A
+
+Build
+=====
+
+First, configure Buildroot for the LS1028ARDB board:
+
+  make ls1028ardb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl
+  - fip.bin
+  - fsl-ls1028a-rdb.dtb
+  - Image
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4 -> rootfs.ext2
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
+board/freescale/ls1028ardb/genimage.cfg.
+
+Boot the LS1028ARDB board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW2[1:4] = 1000 (select SD Card boot option)
+- put a DB9F cable into the UART1 Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
diff --git a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..c08ddde10d
--- /dev/null
+++ b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label ls1028ardb-buildroot
+  kernel /boot/Image
+  devicetree /boot/fsl-ls1028a-rdb.dtb
+  append root=/dev/mmcblk0p1 rootwait
diff --git a/board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules b/board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
new file mode 100644
index 0000000000..19f41634bd
--- /dev/null
+++ b/board/freescale/ls1028ardb/rootfs_overlay/etc/udev/rules.d/73-fsl-enetc-networking.rules
@@ -0,0 +1,16 @@
+# ENETC rules
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", NAME:="eno0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", NAME:="eno1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.2", DRIVERS=="fsl_enetc", NAME:="eno2"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.6", DRIVERS=="fsl_enetc", NAME:="eno3"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.0", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.1", DRIVERS=="fsl_enetc_vf", NAME:="eno0vf1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.2", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.3", DRIVERS=="fsl_enetc_vf", NAME:="eno1vf1"
+# LS1028 switch rules
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p0", NAME="swp0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p1", NAME="swp1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p2", NAME="swp2"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p3", NAME="swp3"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p4", NAME="swp4"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p5", NAME="swp5"
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
new file mode 100644
index 0000000000..b6a5a04672
--- /dev/null
+++ b/configs/ls1028ardb_defconfig
@@ -0,0 +1,56 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# Toolchain
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_OVERLAY="board/freescale/ls1028ardb/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+
+# Host utilities
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
