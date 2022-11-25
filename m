Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B433C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 18:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDE5408E3;
	Fri, 25 Nov 2022 18:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDDE5408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01uToLoWpZxr; Fri, 25 Nov 2022 18:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E0D2408F6;
	Fri, 25 Nov 2022 18:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E0D2408F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB3B11BF5B5
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 18:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFD1A817AD
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 18:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD1A817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQGImqOt_to5 for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 18:03:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE47781772
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 18:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE47781772
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C64EB84683; Fri, 25 Nov 2022 18:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 19:03:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fc5c1ccdb11af5185471272ef5eeece81b5e866
X-Git-Newrev: 6ade5915c1d65b7653125d1cf6952efdd6113806
X-Patchwork-Hint: ignore
Message-Id: <20221125180351.C64EB84683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roc_pc_rk3399: remove defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ade5915c1d65b7653125d1cf6952efdd6113806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5370ec74516495a4ac6c0bc9780b8e92a2f1e6b1 was supposed to remove
the roc_pc_rk3399 defconfig. It actually removed everything related to
this defconfig, but not the defconfig itself.

The build failure this commit was supposed to fix is therefore still
happening. We fix it up by finally removing the defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859807

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/roc_pc_rk3399_defconfig | 55 -----------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
deleted file mode 100644
index ae7cf19a80..0000000000
--- a/configs/roc_pc_rk3399_defconfig
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
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
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
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
-BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
