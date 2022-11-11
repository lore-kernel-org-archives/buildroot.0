Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8542EC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F9942B42;
	Mon, 20 Feb 2023 21:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F9942B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbB4H-64uMB6; Mon, 20 Feb 2023 21:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9535942C87;
	Mon, 20 Feb 2023 21:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9535942C87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06F631BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1202961020
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1202961020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHb3Wz2Pggiv for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24036108D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A24036108D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DCD0828C8; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 14:34:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5370ec74516495a4ac6c0bc9780b8e92a2f1e6b1
X-Git-Newrev: 707938d6848ce945e07ca779748b49b27bdaf222
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.9DCD0828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/rock_pi_4: remove
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5614100127612707326=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5614100127612707326==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=707938d6848ce945e07ca779748b49b27bdaf222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3259671395

Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  2 --
 board/radxa/rockpi-4/extlinux.conf |  4 ---
 board/radxa/rockpi-4/genimage.cfg  | 39 ------------------------
 board/radxa/rockpi-4/post-build.sh |  5 ----
 board/radxa/rockpi-4/readme.txt    | 61 --------------------------------------
 configs/rock_pi_4_defconfig        | 55 ----------------------------------
 6 files changed, 166 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c282a867ce..ae20554f91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2730,10 +2730,8 @@ F:	package/powertop/
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
 F:	board/friendlyarm/nanopi-m4
 F:	board/pine64/rockpro64
-F:	board/radxa/rockpi-4
 F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
-F:	configs/rock_pi_4_defconfig
 F:	configs/rock_pi_n8_defconfig
 F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
diff --git a/board/radxa/rockpi-4/extlinux.conf b/board/radxa/rockpi-4/extlinux.conf
deleted file mode 100644
index 83374f174a..0000000000
--- a/board/radxa/rockpi-4/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label RK3399_ROCK_PI_4 linux
-  kernel /Image
-  devicetree /rk3399-rock-pi-4.dtb
-  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw rootwait
diff --git a/board/radxa/rockpi-4/genimage.cfg b/board/radxa/rockpi-4/genimage.cfg
deleted file mode 100644
index 9f64e96970..0000000000
--- a/board/radxa/rockpi-4/genimage.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"rk3399-rock-pi-4.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 112M
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
diff --git a/board/radxa/rockpi-4/post-build.sh b/board/radxa/rockpi-4/post-build.sh
deleted file mode 100755
index ba29375c05..0000000000
--- a/board/radxa/rockpi-4/post-build.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/radxa/rockpi-4/readme.txt b/board/radxa/rockpi-4/readme.txt
deleted file mode 100644
index 1db7569ed9..0000000000
--- a/board/radxa/rockpi-4/readme.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-RADXA ROCK_PI_4
-================
-https://rockpi.org/rockpi4
-
-ROCK Pi 4 is a Single Board Computer (SBC) from radxa. This guide is valid
-for the below models:
-- ROCK PI 4 Model A
-- ROCK PI 4 Model B
-- ROCK PI 4 Model C
-
-Build:
-======
-  $ make rock_pi_4_defconfig
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
-├── rk3399-rock-pi-4.dtb
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
-Where X is your SD card device.
-
-Booting:
-========
-
-Serial console:
----------------
-RockPi4 has a 40-pin GPIO header. The pin layout is as follows:
-
-pin 6:  gnd
-pin 8:  tx
-pin 10: rx
-
-Baudrate for this board is 1500000.
-
-Login:
-------
-Enter 'root' as login user, and the prompt is ready.
-
-Wiki link:
-https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/rock-pi-4.html
diff --git a/configs/rock_pi_4_defconfig b/configs/rock_pi_4_defconfig
deleted file mode 100644
index 401a59bac4..0000000000
--- a/configs/rock_pi_4_defconfig
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
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cf2747360fdd1eb0d51dd01a984c7c62c7f714fe"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-4-rk3399"
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
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.46"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-pi-4"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_HOSTNAME="rockpi4"
-BR2_TARGET_GENERIC_ISSUE="Welcome to ROCK_PI_4"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="96M"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rockpi-4/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rockpi-4/post-build.sh"

--===============5614100127612707326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5614100127612707326==--
