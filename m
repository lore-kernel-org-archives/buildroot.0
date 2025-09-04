Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8F0CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D653807A6;
	Thu,  4 Sep 2025 16:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5FCco1zUVj8; Thu,  4 Sep 2025 16:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD628807EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD628807EB;
	Thu,  4 Sep 2025 16:14:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B28106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B43CF80762
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ0JbcGTa-MP for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A48A8077E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A48A8077E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6855487F44; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fe80c626d43df3182c907e05874639a2df6d5494
X-Git-Newrev: fd7720562bb6b32bd0f039ad28ca3b933fa4d961
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.6855487F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/rock_pi_n8:
 remove defconfig, broken
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7386112294795374816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7386112294795374816==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd7720562bb6b32bd0f039ad28ca3b933fa4d961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769867

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Drock_pi_n8&kind=BUILD

This defconfig was maintained by Suniel Mahesh, but his e-mail at
Amarula is bouncing, so basically this defconfig is unmaintained.

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769867

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 883ef369e41dbce1d16b3403950c5be1d9841bd9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                 |  2 --
 board/radxa/rockpi-n8/extlinux.conf |  4 ---
 board/radxa/rockpi-n8/genimage.cfg  | 39 ------------------------
 board/radxa/rockpi-n8/post-build.sh |  5 ---
 board/radxa/rockpi-n8/readme.txt    | 61 -------------------------------------
 configs/rock_pi_n8_defconfig        | 35 ---------------------
 6 files changed, 146 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 02d0ddb9f0..6b87803dca 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -52,7 +52,6 @@ board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-ua
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
-board/radxa/rockpi-n8/post-build.sh Shellcheck
 board/raspberrypi/post-build.sh Shellcheck
 board/raspberrypi/post-image.sh Shellcheck
 board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch lib_patch.Upstream
@@ -180,7 +179,6 @@ configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
-configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
 configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/radxa/rockpi-n8/extlinux.conf b/board/radxa/rockpi-n8/extlinux.conf
deleted file mode 100644
index c323fe10ef..0000000000
--- a/board/radxa/rockpi-n8/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label RK3288_ROCKPI_N8 linux
-  kernel /zImage
-  devicetree /rk3288-rock-pi-n8.dtb
-  append console=ttyS2,115200n8 root=/dev/mmcblk0p4 rw rootwait
diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
deleted file mode 100644
index bfcd92f590..0000000000
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"rk3288-rock-pi-n8.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 16M
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
-		image = "u-boot-dtb.img"
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
-		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/radxa/rockpi-n8/post-build.sh b/board/radxa/rockpi-n8/post-build.sh
deleted file mode 100755
index ba29375c05..0000000000
--- a/board/radxa/rockpi-n8/post-build.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/radxa/rockpi-n8/readme.txt b/board/radxa/rockpi-n8/readme.txt
deleted file mode 100644
index ac83d5c8c6..0000000000
--- a/board/radxa/rockpi-n8/readme.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-RADXA ROCKPI-N8
-================
-https://wiki.radxa.com/RockpiN8
-
-Build:
-======
-  $ make rock_pi_n8_defconfig
-  $ make
-
-Files created in output directory
-=================================
-
-output/images
-.
-├── boot.vfat
-├── extlinux
-├── idbloader.img
-├── rk3288-rock-pi-n8.dtb
-├── rootfs.ext2
-├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-├── u-boot.bin
-├── u-boot-dtb.bin
-├── u-boot-dtb.img
-└── zImage
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
-RockPi-N8 has a 40-pin GPIO header. The pin layout is as follows:
-
-pin 6:  gnd
-pin 8:  tx
-pin 10: rx
-
-Baudrate for this board is 115200.
-
-The boot order on rockpi-n8 is emmc, sd. If emmc contains a valid Image, the board
-always boots from emmc. To boot from SD, erase emmc as per the guide:
-
-https://wiki.amarulasolutions.com/bsp/setup/rockchip/rk3399_emmc.html
-
-Login:
-------
-Enter 'root' as login user, and the prompt is ready.
-
-wiki link:
-----------
-https://wiki.amarulasolutions.com/bsp/rockchip/rk3288/rock-pi-n8.html
diff --git a/configs/rock_pi_n8_defconfig b/configs/rock_pi_n8_defconfig
deleted file mode 100644
index 3689d18e45..0000000000
--- a/configs/rock_pi_n8_defconfig
+++ /dev/null
@@ -1,35 +0,0 @@
-BR2_arm=y
-BR2_cortex_a17=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
-BR2_TARGET_GENERIC_HOSTNAME="rockpi-n8"
-BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPI-N8"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rockpi-n8/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rockpi-n8/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/amarula/linux-amarula.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5dcb0132685b07beb82065c5d7521e6c555c55b6"
-BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-rock-pi-n8"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ba120841bf40ebaed049d64bb4f980083a1cf6b7"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-n8-rk3288"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y

--===============7386112294795374816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7386112294795374816==--
