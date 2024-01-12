Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D27C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB88A60BBE;
	Fri, 12 Jan 2024 19:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB88A60BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mEKle9eOVJD; Fri, 12 Jan 2024 19:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2201B60B49;
	Fri, 12 Jan 2024 19:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2201B60B49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA6B71BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C02F8843EB
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C02F8843EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2d8Cnc7A39A for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 19:40:25 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B92FA843EA
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 19:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92FA843EA
X-Virus-Scanned: by amavisd-new using ClamAV (26)
Received: from zm.lan (pub-47.182.29.194.multiplay.pl [194.29.182.47])
 by server220076.nazwa.pl (Postfix) with ESMTP id 8CFB81BD650;
 Fri, 12 Jan 2024 20:40:23 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 20:39:59 +0100
Message-ID: <20240112194000.925982-2-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112194000.925982-1-m.niestroj@grinn-global.com>
References: <20240112194000.925982-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/orangepi_zero3: use upstream U-Boot
 and Linux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is now support in both upstream U-Boot and upstream Linux.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 board/orangepi/orangepi-zero3/linux.config |  1 -
 configs/orangepi_zero3_defconfig           | 17 ++++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)
 delete mode 100644 board/orangepi/orangepi-zero3/linux.config

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
