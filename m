Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B133EF5854
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAAF60E4E;
	Sat, 14 Feb 2026 19:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hkkpejWF6x4; Sat, 14 Feb 2026 19:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F268860F68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098594;
	bh=itiwrfy9Y+htYag4si58AbjqFoQ6BHGrpGtBx6A0BmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gQ/tEAnFt+wQRyYTflSxqrJM3fXMu98/txkGigzbuWwvOKfCTahPqilRXIF1NQFFw
	 qi1qBryZJDOqLNWATxTj4e/hd7Zun3BdtIcBACQNNQWQkPFTVdmKZYwklTN2sUTNV3
	 q0A2sjCgBmmwK4tHLYDo6+MiaUPkbj410HVM0My3KKw2cPazb3GwaUEAfZ8rPpe909
	 b13BsSPIKh+dGRsYR8MyllECIUPjI3zU4afxWByBWKljME6XZKuBQnMhZwzynLtyp5
	 Gbx8cfDCLWsXRYg8j34eFS3RoVTgTn480Kmdkk7uKFhf6FHYlZcOf9HmG5fc6ciOEt
	 aQC29dja/qAlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F268860F68;
	Sat, 14 Feb 2026 19:49:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A65631F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B80960640
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UIJlw7TCMoB for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4412C60789
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4412C60789
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 390D986D5A; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 20:39:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0800b0f1efa4f1cdaea1512cc4dde7b6e4a1296a
X-Git-Newrev: df76f536bbc90c208fac81f6993f1eb5d895aa9b
X-Patchwork-Hint: ignore
Message-Id: <20260214194940.390D986D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_micro: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df76f536bbc90c208fac81f6993f1eb5d895aa9b
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
 board/olimex/a20_olinuxino/boot.cmd                      |  5 -----
 board/olimex/a20_olinuxino/patches/linux/linux.hash      |  3 ++-
 board/olimex/a20_olinuxino/post-build.sh                 |  3 ---
 .../rootfs_overlay/boot/extlinux/extlinux.conf           |  4 ++++
 configs/olimex_a20_olinuxino_micro_defconfig             | 16 ++++++++--------
 6 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 66a8b217d0..94b1688b5d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -32,7 +32,6 @@ board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-suppor
 board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch lib_patch.NumberedSubject lib_patch.Upstream
-board/olimex/a20_olinuxino/post-build.sh Shellcheck
 board/olimex/a33_olinuxino/post-build.sh Shellcheck
 board/olpc/post-build.sh Shellcheck
 board/orangepi/common/post-build.sh Shellcheck
@@ -133,7 +132,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a20_olinuxino/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a20_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 9dd49776b0..8d8499b329 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,3 @@
-# Locally computed
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
deleted file mode 100755
index d3f612f811..0000000000
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..d74fcb0a75
--- /dev/null
+++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label A20-Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index a1d23952d7..cf1c23ef35 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -1,20 +1,22 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-olinuxino-micro"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -22,14 +24,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
