Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB489103E168
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A0C834DE;
	Wed, 18 Mar 2026 12:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UfsZcfzLDi6; Wed, 18 Mar 2026 12:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165FD83BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773835780;
	bh=98J3zziNNgvAsl1964N/PTDW+gJHvtdg795o17BjJSQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GIZvdU77CSUqteZ19mb3gXpcTMkau+iBauu4Yk3oC64opS6v4ulZmPOW6xlGKab9I
	 2m+FipWIXpwya8VoOMXY9yD0voFITELuUlZOxkVDdXDv3cygL0ew9WYlBm2RxyxZBx
	 Tb6T/heH5xY/b5ckpJ3tjzg9fRkS3u14XLY1+Gm3PdixyXisTWnvDKI6xNo/N/6G4I
	 pEJkkCCwTag7k24YCMfZsDnhExX2Qy0l7xHNPj9kYQ5Q7LuOTDot7daddvD+jCbpOR
	 Vo64VPExMMVkAHVAv4HkJEtAhFJSAM9TopmCZnoyIKdJPIUfJx2FpDm8vByozZR+Du
	 J3C5kj2vGu/dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165FD83BB1;
	Wed, 18 Mar 2026 12:09:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB0C1AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2100281318
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlYuj8drrBc6 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B9E81222
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3B9E81222
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:09:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24BFE841FF; Wed, 18 Mar 2026 12:09:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 13:01:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 916331b9172a9aca28edf8492f323bbcf1996c30
X-Git-Newrev: 367e9bb04bc301fced2846f0f81b0440cc10b317
X-Patchwork-Hint: ignore
Message-Id: <20260318120933.24BFE841FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_r2s: bump to
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/367e9bb04bc301fced2846f0f81b0440cc10b317
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit:
- bumps the Linux kernel to 6.18.18
- bumps the U-Boot to 2026.01
- switches to a stable glibc Bootlin external toolchain
- enables force hashes check
- enlarge the rootfs size to 256M

The updated U-Boot should also fix the CI build of the board.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392713

Run-tested on the board.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
[Julien:
 - remove .checkpackageignore entry to fix check-package error
 - move uboot.hash in its correct directory
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                   |  1 -
 board/friendlyarm/nanopi-r2s/patches/linux/linux.hash |  2 ++
 board/friendlyarm/nanopi-r2s/patches/uboot/uboot.hash |  2 ++
 configs/friendlyarm_nanopi_r2s_defconfig              | 12 ++++++++----
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a9e9d21da9..0b1f71d8c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -94,7 +94,6 @@ configs/ci20_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
-configs/friendlyarm_nanopi_r2s_defconfig lib_defconfig.ForceCheckHash
 configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/friendlyarm/nanopi-r2s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r2s/patches/linux/linux.hash
new file mode 100644
index 0000000000..020dc72386
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/friendlyarm/nanopi-r2s/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-r2s/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index 547d9d5f59..6250237707 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -1,6 +1,10 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r2s/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
@@ -8,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r2s/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-nanopi-r2s"
@@ -16,7 +20,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
@@ -26,7 +30,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
