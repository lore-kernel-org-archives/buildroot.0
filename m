Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFEDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:05:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1321E60F12
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1321E60F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7EF540251;
	Sun, 24 Oct 2021 14:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tM1LHHM5xhMO; Sun, 24 Oct 2021 14:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29E4B401E3;
	Sun, 24 Oct 2021 14:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 203071BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D06B6082A
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3v_FjBzpr8I for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 568F66081C
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:05:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9F7A6885FC; Sun, 24 Oct 2021 14:02:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:05:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5dc5f47f567ff3cfc0e782503d659d462b3d212
X-Git-Newrev: cb3b484505d6e12766980aa7d83454460682c1e2
X-Patchwork-Hint: ignore
Message-Id: <20211024140202.9F7A6885FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker_rk3288: bump to Linux
 kernel 5.14.13 and u-boot 2021.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb3b484505d6e12766980aa7d83454460682c1e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps to linux 5.14.13, linux-headers 5.14 and u-boot version
2021.10 and drop local uboot patch where CONFIG_SYS_BOOTM_LEN was set to
16MB because on u-boot 2021.10 it's now set to 64MB as default to make
room for Linux images.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...figs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch | 35 ----------------------
 configs/asus_tinker_rk3288_defconfig               |  9 +++---
 2 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
deleted file mode 100644
index 64a147c09e..0000000000
--- a/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8ee2b03039cccf64402a72dea2185d7fe1972729 Mon Sep 17 00:00:00 2001
-From: Shyam Saini <shyam.saini@amarulasolutions.com>
-Date: Mon, 15 Apr 2019 16:16:16 +0530
-Subject: [PATCH] include: configs: Increase CONFIG_SYS_BOOTM_LEN to 16MB
-
-The default value of CONFIG_SYS_BOOTM_LEN is 0x800000 i.e, 8MB which
-causes board reset because of larger uImage size.
-
-Error log snippet:
-   Booting using the fdt blob at 0x1f00000
-   Loading Kernel Image ... Image too large: increase CONFIG_SYS_BOOTM_LEN
-Must RESET board to recover
-resetting ...
-
-Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
----
- include/configs/rk3288_common.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/configs/rk3288_common.h b/include/configs/rk3288_common.h
-index 72a54bc0ab..eab7cf4d86 100644
---- a/include/configs/rk3288_common.h
-+++ b/include/configs/rk3288_common.h
-@@ -9,6 +9,8 @@
- #include <asm/arch/hardware.h>
- #include "rockchip-common.h"
- 
-+#define CONFIG_SYS_BOOTM_LEN (16 << 20) /* 16MB */
-+
- #define CONFIG_SKIP_LOWLEVEL_INIT_ONLY
- #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
- #define CONFIG_SYS_CBSIZE		1024
--- 
-2.11.0
-
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index e95a19a757..609d061b61 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
@@ -43,4 +43,3 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
-BR2_GLOBAL_PATCH_DIR="board/asus/tinker/patches/"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
