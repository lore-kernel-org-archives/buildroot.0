Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AB2EDF142
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 10:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C384607AD;
	Fri, 13 Feb 2026 10:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoPKQdLD7wqv; Fri, 13 Feb 2026 10:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65C20607C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770976945;
	bh=XvW4HQqzBI4ngz2t1iMsgGXSuvIffueqm3DBPTTtemk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AzUxH4ruUl36cdrKRFZ0XyR5JcnILUCzIkWRx8AgRgNxQi0/svBPN4Cf/bOI0lTDY
	 HE8KmzowNNP4l6LlKw8N4Ef7dTRb4Is8Dm8o6yA7Vltb5ZrEpe8XgWAq+gSXC9eg5L
	 H3UW45yo3hocZRAIvMN/J/jC92w6kkzZ+smSXtYLO2PQpsGB+KssGgJf1cyJt+/SS6
	 8vI+1Fdj5tZpFb0TJyDK08EIcooy4IvleW/9PxAqBI5kfsZmU29X15OwIsdCIuv1fG
	 MDdRk1ZjwaZHveyCvXLbdNLh1btHP34wwOrMZW6JlzbOIjH/G7n3yYUut9P4veqeby
	 V+3xQaHjzFhwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C20607C5;
	Fri, 13 Feb 2026 10:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AF1E69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C2F3607C5
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKQIUsZ8ct6m for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 10:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A00607AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78A00607AD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 10:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65B4786D2E; Fri, 13 Feb 2026 10:02:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 10:23:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e728d3506b0bb0c3169b5beccdf6eb523bdda3f7
X-Git-Newrev: 4abb8a98b26922796b41bc913e72be487337640e
X-Patchwork-Hint: ignore
Message-Id: <20260213100222.65B4786D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai64_defconfig: bump
 Linux to 6.12.70 and U-Boot to 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4abb8a98b26922796b41bc913e72be487337640e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit:
- updates the Kernel from LTS 6.6.30 to 6.12.70
- updates U-Boot from 2024.04 to 2026.01
- updates arm-trusted-firmware from v2.10 to v2.12 LTS
- switches to Bootlin external glibc stable toolchain

Note: Using the kernel 6.18.9, the SD card fail at boot:

  mmc1: SDHCI controller on 4fb0000.mmc [4fb0000.mmc] using ADMA 64-bit
  Waiting for root device /dev/mmcblk1p2...
  mmc1: error -110 whilst initialising SD card

So let's use stable kernel 6.12.y for the time being.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: update linux.hash comment to use upstream hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/beagleboard/beagleboneai64/patches/linux/linux.hash   |  4 ++--
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash            |  2 +-
 board/beagleboard/beagleboneai64/patches/uboot/uboot.hash   |  2 +-
 configs/beagleboneai64_defconfig                            | 13 +++++++------
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/board/beagleboard/beagleboneai64/patches/linux/linux.hash b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
index 4b20a009a7..7fbb81d7e3 100644
--- a/board/beagleboard/beagleboneai64/patches/linux/linux.hash
+++ b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9b4ccec7d8ceff4824f149e476ec06e83c86546ae8af82582871647809a62ef0  linux-6.12.70.tar.xz
diff --git a/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 97a2b4eaf9..b6a925ea4e 100644
--- a/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
index 97a2b4eaf9..b6a925ea4e 100644
--- a/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index 0429dd63e1..db5837fe36 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai64/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -9,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.70"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-beagleboneai64"
@@ -18,8 +20,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="generic"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -27,12 +28,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_beagleboneai64_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_beagleboneai64_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
