Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFCFC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2BC0605B7;
	Mon, 26 Aug 2024 16:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t_wt2dsrioM; Mon, 26 Aug 2024 16:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D10B660748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D10B660748;
	Mon, 26 Aug 2024 16:39:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCE5B1BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B707C60748
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0owhqQ_7Xxcq for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C039B605B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C039B605B7
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:39:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B97278643F; Mon, 26 Aug 2024 16:39:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:38:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f0243567d74323082e53c46e777b326476f5c2d
X-Git-Newrev: 42d95c00a9257b1bcd0d559fa5e8e5b35abde08e
X-Patchwork-Hint: ignore
Message-Id: <20240826163925.B97278643F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx25pdk: remove defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=42d95c00a9257b1bcd0d559fa5e8e5b35abde08e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The imx25pdk board has been removed from U-Boot and I no
longer have access to the board.

Remove its support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                 |  1 -
 DEVELOPERS                          |  1 -
 board/freescale/imx25pdk/readme.txt | 54 -------------------------------------
 configs/mx25pdk_defconfig           | 35 ------------------------
 4 files changed, 91 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 81e48bf859..4cfc202153 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -191,7 +191,6 @@ configs/microchip_sama5d2_icp_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
-configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
 configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
 configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 426590d5c5..0b590f0ec2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -980,7 +980,6 @@ F:	configs/imx6ulpico_defconfig
 F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
 F:	configs/imx8mqevk_defconfig
-F:	configs/mx25pdk_defconfig
 F:	configs/mx51evk_defconfig
 F:	configs/mx53loco_defconfig
 F:	configs/mx6cubox_defconfig
diff --git a/board/freescale/imx25pdk/readme.txt b/board/freescale/imx25pdk/readme.txt
deleted file mode 100644
index 1aece6c9b3..0000000000
--- a/board/freescale/imx25pdk/readme.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-**************************
-Freescale i.MX25 PDK board
-**************************
-
-This file documents the Buildroot support for the Freescale i.MX25 PDK board.
-
-Build
-=====
-
-First, configure Buildroot for the i.MX25 PDK board:
-
-  make mx25pdk_defconfig
-
-Build all components:
-
-  make
-
-You will find in output/images/ the following files:
-  - imx25-pdk.dtb
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - u-boot.imx
-  - zImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-For details about the medium image layout, see the definition in
-board/freescale/common/imx/genimage.cfg.template.
-
-Boot the i.MX25 PDK board
-=========================
-
-To boot your newly created system:
-- insert the SD card in the SD slot of the board;
-- put a USB cable into the Debug USB Port and connect using a terminal
-  emulator at 115200 bps, 8n1;
-- power on the board.
-
-Enjoy!
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
deleted file mode 100644
index ec4f8b8289..0000000000
--- a/configs/mx25pdk_defconfig
+++ /dev/null
@@ -1,35 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
-
-# System
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# required tools to create the SD card image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx25pdk"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx25-pdk"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
