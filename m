Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CDBEF584C
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC4D60E0B;
	Sat, 14 Feb 2026 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9GB5JvFTugw; Sat, 14 Feb 2026 19:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9DD160862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098583;
	bh=FXBGitunnXGxhFOXzXST4633CEVOzUrZF0Q/iByGl+c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iZDf1Vz19SZgCACrE2bQu9+h5uFtWuyYnHXNe6qNDvYH05l1JyhO7z60KRHGI+o7B
	 5bzteiUB31sSZyH2Kb1uFnB/OZj6682SXSFTtK6dsqGJ/c+m/5rU+rRlaxbY5hJXps
	 wWe3hujeHQH7wwCFV0ICiohIVSzZm/A559D1OBRKw3ZOK0yjkNOCYszYs3P0bQuNo/
	 708RwTMTEU3VqZdLJtwRM1gBAM2Mgqlqx5i0tnw5CuxY6A4UDtZiErG2vpfxCehMnK
	 wyvdDd3B9uVX0dFEBFu7eWo8eMLISgcNZ9RN1Fwh52NlBJ5++6sLzruS9MRjty/XIU
	 hV2wVqLziYipA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9DD160862;
	Sat, 14 Feb 2026 19:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06036353
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E80BD608BB
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgjU3f6Fxglz for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22916606ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22916606ED
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06DC586D60; Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 19:17:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a442287cc21ac8408172975d5b82b587d3f457e
X-Git-Newrev: 2459821be6855cdc9e8aa6202dbd9db75f22012f
X-Patchwork-Hint: ignore
Message-Id: <20260214194940.06DC586D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mangopi_mq1rdw2: bump Linux to
 6.18.8 and U-Boot to 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2459821be6855cdc9e8aa6202dbd9db75f22012f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: change linux.hash comment to use hash from upstream]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                            | 1 -
 board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash | 1 +
 board/mangopi/mq1rdw2/patches/linux/linux.hash                 | 2 ++
 board/mangopi/mq1rdw2/patches/uboot/uboot.hash                 | 2 ++
 configs/mangopi_mq1rdw2_defconfig                              | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2aa2f8ff2b..85658c778a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -113,7 +113,6 @@ configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash b/board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/mangopi/mq1rdw2/patches/linux/linux.hash b/board/mangopi/mq1rdw2/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/mangopi/mq1rdw2/patches/uboot/uboot.hash b/board/mangopi/mq1rdw2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/mangopi/mq1rdw2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
index 2249fa4be5..469a45b967 100644
--- a/configs/mangopi_mq1rdw2_defconfig
+++ b/configs/mangopi_mq1rdw2_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/mangopi/mq1rdw2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="mangopi-mq1rdw2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to MangoPI MQ1RDW2"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -12,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi/mq1rdw2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-t113s-mangopi-mq-r-t113"
@@ -31,11 +33,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01-rc4"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mangopi_mq_r"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
