Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC909C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 647BF42AE1;
	Mon, 20 Feb 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 647BF42AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x81pLlqlkLgT; Mon, 20 Feb 2023 21:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E304642AA6;
	Mon, 20 Feb 2023 21:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E304642AA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3A31BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8460A610B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8460A610B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Lgpd5M6PmIH for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB1ED61099
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1ED61099
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9573186494; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 22:17:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 24bb61071269f5446b6a1a5aaa89e5439e51940a
X-Git-Newrev: 5f7a517f5c156666cef58dec429bfffd4ae41e81
X-Patchwork-Hint: ignore
Message-Id: <20230220205148.9573186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/friendlyarm_nanopi_neo4: remove defconfig
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
Content-Type: multipart/mixed; boundary="===============5760456185341348156=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5760456185341348156==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5f7a517f5c156666cef58dec429bfffd4ae41e81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499054

Cc: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                  |  2 --
 board/friendlyarm/nanopi-neo4/extlinux.conf |  4 ---
 board/friendlyarm/nanopi-neo4/genimage.cfg  | 22 ------------
 board/friendlyarm/nanopi-neo4/post-build.sh |  5 ---
 board/friendlyarm/nanopi-neo4/readme.txt    | 53 ---------------------------
 configs/friendlyarm_nanopi_neo4_defconfig   | 55 -----------------------------
 6 files changed, 141 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7442d3a6ee..27482d095a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1896,8 +1896,6 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
-F:	board/friendlyarm/nanopi-neo4/
-F:	configs/friendlyarm_nanopi_neo4_defconfig
 F:	package/libatasmart/
 F:	package/polkit/
 F:	package/sg3_utils/
diff --git a/board/friendlyarm/nanopi-neo4/extlinux.conf b/board/friendlyarm/nanopi-neo4/extlinux.conf
deleted file mode 100644
index 91eef67fb9..0000000000
--- a/board/friendlyarm/nanopi-neo4/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label NanoPi Neo4 linux
-  kernel /boot/Image
-  devicetree /boot/rk3399-nanopi-neo4.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/friendlyarm/nanopi-neo4/genimage.cfg b/board/friendlyarm/nanopi-neo4/genimage.cfg
deleted file mode 100644
index 966c869273..0000000000
--- a/board/friendlyarm/nanopi-neo4/genimage.cfg
+++ /dev/null
@@ -1,22 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot-tpl-spl-dtb {
-		in-partition-table = "no"
-		image = "idbloader.img"
-		offset = 32K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 8M
-		size = 30M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/friendlyarm/nanopi-neo4/post-build.sh b/board/friendlyarm/nanopi-neo4/post-build.sh
deleted file mode 100755
index 1f5ff6a611..0000000000
--- a/board/friendlyarm/nanopi-neo4/post-build.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-neo4/readme.txt b/board/friendlyarm/nanopi-neo4/readme.txt
deleted file mode 100644
index 7c04a52806..0000000000
--- a/board/friendlyarm/nanopi-neo4/readme.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Intro
-=====
-
-NanoPi Neo4 is a RK3399 SoC based ARM64 board.
-
-
-Official wiki: http://wiki.friendlyarm.com/wiki/index.php/NanoPi_NEO4
-Mainline wiki: https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/neo4.html
-
-Build
-=====
-
-Run NanoPi Neo4 configuration
-
-  $ make friendlyarm_nanopi_neo4_defconfig
-
-To build, run make comamnd.
-
-  $ make
-
-Files created in output directory
-=================================
-
-output/images
-
-├── bl31.bin
-├── bl31.elf
-├── Image
-├── rk3399-nanopi-neo4.dtb
-├── rootfs.ext2
-├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-├── u-boot.bin
-├── u-boot.itb
-├── u-boot-spl-dtb.bin
-├── u-boot-tpl-dtb.bin
-├── u-boot-tpl-dtb.img
-└── u-boot-tpl-spl-dtb.img
-
-Creating bootable SD card:
-=========================
-
-Simply invoke (as root)
-
-  # dd if=output/images/sdcard.img of=/dev/sdX && sync
-
-Where X is your SD card device
-
-Serial console
---------------
-
-Baudrate for this board is 1500000
diff --git a/configs/friendlyarm_nanopi_neo4_defconfig b/configs/friendlyarm_nanopi_neo4_defconfig
deleted file mode 100644
index a11872ef2a..0000000000
--- a/configs/friendlyarm_nanopi_neo4_defconfig
+++ /dev/null
@@ -1,55 +0,0 @@
-# Architecture
-BR2_aarch64=y
-BR2_cortex_a72_a53=y
-
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
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
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-neo4-rk3399"
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
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.18"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopi-neo4"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_HOSTNAME="NanoPi Neo4"
-BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPi Neo4!"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="70M"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo4/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo4/post-build.sh"

--===============5760456185341348156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5760456185341348156==--
