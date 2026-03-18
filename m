Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABFB103E169
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0789B40AAD;
	Wed, 18 Mar 2026 12:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ls9W5zN0Z_dl; Wed, 18 Mar 2026 12:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2030540BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773835778;
	bh=EWK5p7YOD7Q5XfkkaZ8/gXhjklnilX4fIi20lgCWd7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cwSVtsucjC5NNIE++BdCTNT3rt5IREptzCnujIrnA5NwEqgOHamN7q8wZ2e76Fd5z
	 ntyRVCocFOtZ52C3nEsIxFohAUp1o03IXmpQKSQvBC1iO4UfnI5Cq37atB1qKA6WC9
	 1kM9EyL/PhEbesIAVWS5aB91e/GX/ZvggUBlclz5U3uWrkcg91RH0SlukbyZ11nPln
	 N6Mbo2znfacSEHA1NoBHnxof41o1H0mOMBhM2neEqX/gMhYXzty8m9/mxLEz9efEAU
	 LlUGkwMr1TOESbO9E+cLFHJm+y3bbcX4j9xE2egZOzh4BpeRYB7cyNgsnEgZwsJIkI
	 l1/5PKohmPE6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2030540BA8;
	Wed, 18 Mar 2026 12:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6173BE
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09D3F40BA8
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tC5Ijh-lNnuu for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0526B40AAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0526B40AAD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B06C84180; Wed, 18 Mar 2026 12:09:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 13:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c89743874276426f6542f5b98cae5e3ee4564749
X-Git-Newrev: 916331b9172a9aca28edf8492f323bbcf1996c30
X-Patchwork-Hint: ignore
Message-Id: <20260318120933.1B06C84180@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_neo: bump to
 kernel 6.18.18 and U-Boot 2026.01
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/916331b9172a9aca28edf8492f323bbcf1996c30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit:
- bumps the Linux kernel to 6.18.18
- bumps the U-Boot to 2026.01
- switches to a stable glibc Bootlin external toolchain

The updated U-Boot should also fix the CI build of the board.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392712

Run-tested on the board.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
[Julien: add missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../nanopi-neo/patches/linux-headers/linux-headers.hash          | 1 -
 board/friendlyarm/nanopi-neo/patches/linux/linux.hash            | 4 ++--
 board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash            | 2 +-
 configs/friendlyarm_nanopi_neo_defconfig                         | 9 ++++++---
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash b/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/friendlyarm/nanopi-neo/patches/linux/linux.hash b/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
index ecff37638a..020dc72386 100644
--- a/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
+++ b/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
index fe9b4f53dc..b6a925ea4e 100644
--- a/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
+++ b/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
index 9aed25b30c..07be41cbf1 100644
--- a/configs/friendlyarm_nanopi_neo_defconfig
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
@@ -11,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.44"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
@@ -21,11 +23,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
