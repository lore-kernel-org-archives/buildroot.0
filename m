Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AE4EF5854
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87CEC81270;
	Sat, 14 Feb 2026 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fvz_63Ky8yHl; Sat, 14 Feb 2026 19:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8823D81271
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098589;
	bh=zxMyhXxSq03kv2BipRhHgRq+pFcD+72eDHu+4visF68=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fi4LeWY2D6T2OYWdb2Kx8G8ygB7OuAV1/whJ0bsXf71MM9N+xfASzgb6K27Ny6qia
	 MM6XCGO3JGH7da4GjM2cqodJOcFGfKuDLdEPMkkSkyXXbTFGfXukiDT25soZvq8VNp
	 Ew0TYRlqSsU5QJzx9Xzq1md97otd2Q8gbz0yme/hQxdD5ulgXppVHRjB84z2zvM2hm
	 SDfnUmiFeQpttvlxi/of5kxUUFWaH7/ULG+FXmrKyNBIwiDJpHby04YxMuEpzPwqPl
	 9Wl7PsZg32Cbivd3REQx3nCwCKFz3hETd5xOWOnNxZay1VC00jHDG6S50NApBHHLR3
	 HNICXpf/ZoV/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8823D81271;
	Sat, 14 Feb 2026 19:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A7B531F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18759606ED
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1l0JQc4QT1W for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C4B60640
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C4B60640
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:49:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C376C86D60; Sat, 14 Feb 2026 19:49:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 19:17:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a50717bcfcd3b703016626372916ae03183a283
X-Git-Newrev: c11fb84b0c74f8037585b1b19b42687addbae37c
X-Patchwork-Hint: ignore
Message-Id: <20260214194939.C376C86D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker_rk3288: bump Linux to
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c11fb84b0c74f8037585b1b19b42687addbae37c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: change linux.hash comment to use hash from upstream]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                        |  1 -
 board/asus/tinker/patches/linux-headers/linux-headers.hash |  1 +
 board/asus/tinker/patches/linux/linux.hash                 |  2 ++
 board/asus/tinker/patches/uboot/uboot.hash                 |  2 ++
 configs/asus_tinker_rk3288_defconfig                       | 11 +++++++----
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c7a02caf06..62e3998a66 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -77,7 +77,6 @@ configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
-configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/asus/tinker/patches/linux-headers/linux-headers.hash b/board/asus/tinker/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/asus/tinker/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/asus/tinker/patches/linux/linux.hash b/board/asus/tinker/patches/linux/linux.hash
new file mode 100644
index 0000000000..f83883b936
--- /dev/null
+++ b/board/asus/tinker/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/asus/tinker/patches/uboot/uboot.hash b/board/asus/tinker/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..60971ee74f
--- /dev/null
+++ b/board/asus/tinker/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index f3a2c4d71d..8326405536 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/asus/tinker/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="tinker-rk3288"
 BR2_TARGET_GENERIC_ISSUE="Welcome to TINKER RK3288!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
@@ -9,10 +11,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3288-tinker"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -20,11 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
