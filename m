Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C9CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD9D608A1;
	Thu,  4 Sep 2025 16:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcIPn2Qz_mnA; Thu,  4 Sep 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3435C60877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3435C60877;
	Thu,  4 Sep 2025 16:35:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC7B2106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6282240085
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GficZq6OcmLi for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3326A40086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3326A40086
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3140D87E99; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:04:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c891569a02ccfd5f6d87e86c2484b723b57ccaff
X-Git-Newrev: 143c25fdb9036e63950bf84885565bd21a21e4db
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.3140D87E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/rock64: remove
 defconfig, broken
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
Content-Type: multipart/mixed; boundary="===============8677914008221243945=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8677914008221243945==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=143c25fdb9036e63950bf84885565bd21a21e4db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769723

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Drock64&kind=BUILD

The old u-boot-2020.07-rc4 no longer builds.

Unless a fix is provided, this defconfig will be removed.

Fixes:

    https://gitlab.com/buildroot.org/buildroot/-/jobs/11026769723

Cc: Michał Łyszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 83af501540b8a3f48fca1bacdc3ec11bd7abb9fe)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |  3 -
 DEVELOPERS                                         |  2 -
 board/pine64/rock64/extlinux.conf                  |  4 -
 board/pine64/rock64/genimage.cfg                   | 23 ------
 ...e-rk3328-needs-itb-image-to-boot-properly.patch | 34 --------
 board/pine64/rock64/post-build.sh                  |  9 --
 board/pine64/rock64/readme.txt                     | 95 ----------------------
 configs/rock64_defconfig                           | 39 ---------
 8 files changed, 209 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d436c2f3eb..29ab4afadb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -49,8 +49,6 @@ board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt
 board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch lib_patch.Upstream
-board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch lib_patch.Upstream
-board/pine64/rock64/post-build.sh Shellcheck
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
@@ -180,7 +178,6 @@ configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
-configs/rock64_defconfig lib_defconfig.ForceCheckHash
 configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
 configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index bfdabec686..bea986961a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2441,8 +2441,6 @@ F:	package/rcw-smarc-sal28/
 
 N:	Michał Łyszczek <michal.lyszczek@bofc.pl>
 F:	board/altera/socrates_cyclone5/
-F:	board/pine64/rock64
-F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
 F:	package/netifrc/
 F:	package/openrc/
diff --git a/board/pine64/rock64/extlinux.conf b/board/pine64/rock64/extlinux.conf
deleted file mode 100644
index bf71982a9f..0000000000
--- a/board/pine64/rock64/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label rock64-buildroot
-  kernel /boot/Image
-  devicetree /boot/rk3328-rock64.dtb
-  append console=ttyS2,1500000n8 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/pine64/rock64/genimage.cfg b/board/pine64/rock64/genimage.cfg
deleted file mode 100644
index 7b749d1dd6..0000000000
--- a/board/pine64/rock64/genimage.cfg
+++ /dev/null
@@ -1,23 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition uboot-spl {
-		in-partition-table = "no"
-		image = "u-boot-tpl-spl.img"
-		offset = 32K # 512 * 0x40 from start of sd card
-	}
-
-	partition uboot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 256K # 512 * 0x200 from start of sd card
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		bootable = "yes"
-		image = "rootfs.ext2"
-		size = 500M
-	}
-}
diff --git a/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch b/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
deleted file mode 100644
index 7c84736034..0000000000
--- a/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d312c4e40bf816823bdcfd066dd2511b23e83c9c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
-Date: Tue, 5 Feb 2019 22:08:54 +0100
-Subject: [PATCH] Makefile: rk3328 needs itb image to boot properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Michał Łyszczek <michal.lyszczek@bofc.pl>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 149f83994814..ebbdf2596b9b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -923,6 +923,11 @@ ifeq ($(CONFIG_SYS_COREBOOT)$(CONFIG_SPL),yy)
- ALL-$(CONFIG_BINMAN) += u-boot-x86-with-spl.bin
- endif
- 
-+# rk3328 needs itb image to boot properly
-+ifeq ($(CONFIG_ROCKCHIP_RK3328),y)
-+ALL-y += u-boot.itb
-+endif
-+
- # Build a combined spl + u-boot image for sunxi
- ifeq ($(CONFIG_ARCH_SUNXI)$(CONFIG_SPL),yy)
- ALL-y += u-boot-sunxi-with-spl.bin
--- 
-2.43.0
-
diff --git a/board/pine64/rock64/post-build.sh b/board/pine64/rock64/post-build.sh
deleted file mode 100755
index 26b53cba8e..0000000000
--- a/board/pine64/rock64/post-build.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOARD_DIR="$(dirname $0)"
-
-$MKIMAGE -n rk3328 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
-cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl.bin > $BINARIES_DIR/u-boot-tpl-spl.img
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/pine64/rock64/readme.txt b/board/pine64/rock64/readme.txt
deleted file mode 100644
index 029c67641e..0000000000
--- a/board/pine64/rock64/readme.txt
+++ /dev/null
@@ -1,95 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Rock64. With this default configuration you
-can log in into board via uart and look around.
-
-Board homepage: https://www.pine64.org/?page_id=7147
-
-Build
-=====
-
-First, load rock64 config for buildroot
-
-  $ make rock64_defconfig
-
-Optionally make changes to buildroot config (to install more programs)
-
-  $ make menuconfig
-
-And then build everything
-
-  $ make
-
-When completed, following files will be generated in output/images directory:
-
-  .
-  ├── Image
-  ├── bl31.bin
-  ├── bl31.elf
-  ├── rk3328-rock64.dtb
-  ├── rootfs.ext2
-  ├── rootfs.ext4 -> rootfs.ext2
-  ├── rootfs.tar
-  ├── sdcard.img
-  ├── u-boot-spl.bin
-  ├── u-boot-tpl-spl.img
-  ├── u-boot-tpl.bin
-  ├── u-boot-tpl.img
-  ├── u-boot.bin
-  └── u-boot.itb
-
-Creating bootable SD card
-=========================
-
-!!! THIS COMMAND MAY WIPE YOUR DISK!
-!!! MAKE SURE YOU PASSED CORRECT DEVICE!
-!!! OR IT THIS WILL WIPE YOUR DISK!
-
-Simply invoke (as root)
-
-  # dd if=output/images/sdcard.img of=/dev/sdX && sync
-
-Where X is your SD card device (not partition), of= argument may also be
-/dev/mmcblk0 if you are using built-in sd card reader.
-
-Runtime
-=======
-
-Login
------
-
-By default, buildroot has no password, just type 'root' as login user, and
-you will be logged in.
-
-Serial console
---------------
-
-Serial console needs to be connected to pins (into 40pin rpi compatible part)
-
-pin 6:  gnd
-pin 8:  tx
-pin 10: rx
-
-Pin numbers are printed on board.
-
-Uart configuration is not standard. Rock64 uses 1500000 (1,5M) baudrate
-with standard 8n1.
-
-Ethernet
---------
-
-To enable ethernet you need to load modules for it:
-
-# modprobe stmmac
-# modprobe dwmac-rk
-
-and since by default there is no dhcp installed, you need to configure ip
-address, remember to change address to fit your network.
-
-# ifconfig eth0 up
-# ip addr add 10.1.1.180/24 dev eth0
-# ping 10.1.1.1
-PING 10.1.1.1 (10.1.1.1): 56 data bytes
-64 bytes from 10.1.1.1: seq=0 ttl=64 time=0.695 ms
diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
deleted file mode 100644
index 744d3a7159..0000000000
--- a/configs/rock64_defconfig
+++ /dev/null
@@ -1,39 +0,0 @@
-BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/pine64/rock64/patches"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rock64/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rock64/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-rock64"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/*.elf"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-mainline-u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="release-2020-07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin tpl/u-boot-tpl.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============8677914008221243945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8677914008221243945==--
