Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04277C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B321D60AC2;
	Sat, 13 Jan 2024 21:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B321D60AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNx4jfRRBoCN; Sat, 13 Jan 2024 21:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08E4460E09;
	Sat, 13 Jan 2024 21:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E4460E09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50A421BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2AF041E0D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2AF041E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqtd1sDdUjFP for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECC4041E0F
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC4041E0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EABCB86062; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:50:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 329672f94a8807dc8e35bcfd4cc411eb21f22144
X-Git-Newrev: 8e75e40f7a499e4c7b1f608bddc83a2c9e4ab2b3
X-Patchwork-Hint: ignore
Message-Id: <20240113211501.EABCB86062@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_zero3: use upstream
 U-Boot and Linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e75e40f7a499e4c7b1f608bddc83a2c9e4ab2b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is now support in both upstream U-Boot and upstream Linux.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-zero3/linux.config |  1 -
 configs/orangepi_zero3_defconfig           | 17 ++++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/board/orangepi/orangepi-zero3/linux.config b/board/orangepi/orangepi-zero3/linux.config
deleted file mode 100644
index 09b7a93a5a..0000000000
--- a/board/orangepi/orangepi-zero3/linux.config
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_MFD_AC200=y
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index f4fbf86812..93d53dc301 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 
@@ -16,8 +16,8 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,orangepi-xunlong,u-boot-orangepi,6fe17fac388aad17490cf386578b7532975e567f)/u-boot-orangepi-6fe17fac388aad17490cf386578b7532975e567f.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero3"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -30,21 +30,20 @@ BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,orangepi-xunlong,linux-orangepi,3495b5ee0594566c9fed930b96b1cae90600412e)/linux-orangepi-3495b5ee0594566c9fed930b96b1cae90600412e.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="linux_sunxi64"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h616-orangepi-zero3"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero3"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero3/linux.config"
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero3"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="180M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # host tools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
