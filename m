Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E2C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 21:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA04080D7E;
	Mon,  7 Nov 2022 21:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA04080D7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3KRVZ--IbytJ; Mon,  7 Nov 2022 21:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E6EC80C2E;
	Mon,  7 Nov 2022 21:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E6EC80C2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BA8C1BF27A
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D24581412
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D24581412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gJLQ7B1C7kv for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 21:19:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4CFE817AF
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 21:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4CFE817AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94E00880C1; Mon,  7 Nov 2022 21:19:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 22:17:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daf3c6661f823e566b6310042884c36c1d73f1de
X-Git-Newrev: fa274e01e335c75684425a682b3dd8823d284da9
X-Patchwork-Hint: ignore
Message-Id: <20221107211910.94E00880C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopc_t4: remove
 defconfig
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
Content-Type: multipart/mixed; boundary="===============8661608819225935547=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8661608819225935547==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fa274e01e335c75684425a682b3dd8823d284da9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499048

Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |  2 --
 board/friendlyarm/nanopc-t4/extlinux.conf |  4 ---
 board/friendlyarm/nanopc-t4/genimage.cfg  | 39 -----------------------
 board/friendlyarm/nanopc-t4/post-build.sh |  5 ---
 board/friendlyarm/nanopc-t4/readme.txt    | 45 --------------------------
 configs/friendlyarm_nanopc_t4_defconfig   | 53 -------------------------------
 6 files changed, 148 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 37d2e3854f..427fce235d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2745,14 +2745,12 @@ F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
 F:	board/firefly/
-F:	board/friendlyarm/nanopc-t4
 F:	board/friendlyarm/nanopi-m4
 F:	board/orangepi/orangepi-rk3399
 F:	board/pine64/rockpro64
 F:	board/radxa/rockpi-4
 F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
-F:	configs/friendlyarm_nanopc_t4_defconfig
 F:	configs/friendlyarm_nanopi_m4_defconfig
 F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
diff --git a/board/friendlyarm/nanopc-t4/extlinux.conf b/board/friendlyarm/nanopc-t4/extlinux.conf
deleted file mode 100644
index 31c6b30d32..0000000000
--- a/board/friendlyarm/nanopc-t4/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label RK3399_NanoPC_T4 linux
-  kernel /Image
-  devicetree /rk3399-nanopc-t4.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rootwait
diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
deleted file mode 100644
index 1787322260..0000000000
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"rk3399-nanopc-t4.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-		partition-table-type = "gpt"
-	}
-
-	partition loader1 {
-		image = "idbloader.img"
-		offset = 32K
-	}
-
-	partition loader2 {
-		image = "u-boot.itb"
-		offset = 8M
-	}
-
-	partition boot {
-		partition-type-uuid = F
-		bootable = "true"
-		image = "boot.vfat"
-		offset = 16M
-	}
-
-	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/friendlyarm/nanopc-t4/post-build.sh b/board/friendlyarm/nanopc-t4/post-build.sh
deleted file mode 100755
index ba29375c05..0000000000
--- a/board/friendlyarm/nanopc-t4/post-build.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopc-t4/readme.txt b/board/friendlyarm/nanopc-t4/readme.txt
deleted file mode 100644
index 0989c6cc1e..0000000000
--- a/board/friendlyarm/nanopc-t4/readme.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-FriendlyARM NANOPC-T4
-=====================
-
-Build:
-
-  $ make friendlyarm_nanopc_t4_defconfig
-  $ make
-
-Files created in output directory
-=================================
-
-output/images
-
-├── bl31.elf
-├── boot.vfat
-├── extlinux
-├── idbloader.img
-├── Image
-├── rk3399-nanopc-t4.dtb
-├── rootfs.ext2
-├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-├── u-boot.bin
-└── u-boot.itb
-
-Creating bootable SD card:
-==========================
-
-Simply invoke (as root)
-
-sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
-
-Where X is your SD card device
-
-Serial console
---------------
-
-Baudrate for this board is 1500000
-
-Login:
-------
-Apply power and press the PWR button for 3 sec. Enter 'root' as login user, and the prompt is ready.
-
-https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/npc_t4.html
diff --git a/configs/friendlyarm_nanopc_t4_defconfig b/configs/friendlyarm_nanopc_t4_defconfig
deleted file mode 100644
index 2f7c53904e..0000000000
--- a/configs/friendlyarm_nanopc_t4_defconfig
+++ /dev/null
@@ -1,53 +0,0 @@
-# Architecture
-BR2_aarch64=y
-BR2_cortex_a72_a53=y
-
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
-
-# Firmware
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopc-t4-rk3399"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.2"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopc-t4"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_HOSTNAME="nanopc-t4"
-BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPC-T4"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopc-t4/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopc-t4/post-build.sh"

--===============8661608819225935547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8661608819225935547==--
