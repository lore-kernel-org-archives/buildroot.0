Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD72EF5856
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF0860789;
	Sat, 14 Feb 2026 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPqSRz0e8IP1; Sat, 14 Feb 2026 19:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED9C60EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098590;
	bh=1J2CHiZ8NP42BA7LCZ9+azxxK7myeh0LIZxskk4j1JE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OSp7yTI7h+4oP7bWgmHNGyMhUH3qpF9q9QfKfFv7weV76124lDD3sRQVsZgKApwKq
	 dZkDoADiTmhBdaMfpxvwrkMOqL5/YaWxMGppi3mxgvyB7EE6KNeq0Mvc+cvrmSvW6I
	 JWAGhd86mKw5vZoS7cXeJqwGw3Mowj2/RDIMQG/YoQJEXK8HxjFnGXiwkkGJHFotWf
	 51PsKPmc3aIFgXkGXIGJcoM32WN6Enf24E+LJD3mxHxOVdX79fIoACan8hhQz0Q8jH
	 XeReTe7Hxe+cWskrEJfIH3FzMDD0G4gPDY+FxRfUS70OEdNfx6T2tuphrY19sDlNwe
	 QuxbL3AXRcUtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED9C60EA9;
	Sat, 14 Feb 2026 19:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 621DC31F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D49810FE
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPg2lBMY3WOQ for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506F7811BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 506F7811BE
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4576086D60; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 20:39:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df76f536bbc90c208fac81f6993f1eb5d895aa9b
X-Git-Newrev: c303dc3d0d4e3654b96b2662a3b0d5eb687fa9a5
X-Patchwork-Hint: ignore
Message-Id: <20260214194940.4576086D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a33_olinuxino: bump Linux
 to 6.18.8 and U-Boot to 2026.01
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c303dc3d0d4e3654b96b2662a3b0d5eb687fa9a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: change linux.hash comment to use hash from upstream]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                      |  2 --
 board/olimex/a33_olinuxino/boot.cmd                      |  5 -----
 .../patches/linux-headers/linux-headers.hash             |  1 +
 board/olimex/a33_olinuxino/patches/linux/linux.hash      |  2 ++
 board/olimex/a33_olinuxino/patches/uboot/uboot.hash      |  2 ++
 board/olimex/a33_olinuxino/post-build.sh                 |  2 --
 .../rootfs_overlay/boot/extlinux/extlinux.conf           |  4 ++++
 configs/olimex_a33_olinuxino_defconfig                   | 16 ++++++++--------
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 94b1688b5d..93d1809330 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -32,7 +32,6 @@ board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-suppor
 board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch lib_patch.NumberedSubject lib_patch.Upstream
-board/olimex/a33_olinuxino/post-build.sh Shellcheck
 board/olpc/post-build.sh Shellcheck
 board/orangepi/common/post-build.sh Shellcheck
 board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch lib_patch.Upstream
@@ -132,7 +131,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a33_olinuxino/boot.cmd b/board/olimex/a33_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a33_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/olimex/a33_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a33_olinuxino/patches/linux/linux.hash b/board/olimex/a33_olinuxino/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/olimex/a33_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a33_olinuxino/patches/uboot/uboot.hash b/board/olimex/a33_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/olimex/a33_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/olimex/a33_olinuxino/post-build.sh b/board/olimex/a33_olinuxino/post-build.sh
deleted file mode 100755
index b418120652..0000000000
--- a/board/olimex/a33_olinuxino/post-build.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f852b75a44
--- /dev/null
+++ b/board/olimex/a33_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A13-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index 8c053ef3d6..3606d49a41 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -1,34 +1,34 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a33_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="A33-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to A33 OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a33_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a33_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a33_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-a33-olinuxino"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-a33-olinuxino"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
