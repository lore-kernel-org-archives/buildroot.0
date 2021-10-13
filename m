Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AD2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:32:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C6D61139
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1C6D61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C22A403FF;
	Wed, 13 Oct 2021 20:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZOrOTLtEUV5; Wed, 13 Oct 2021 20:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A58640212;
	Wed, 13 Oct 2021 20:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1563A1BF361
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0301E40212
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kO6YrltQZ-IX for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:32:34 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5CC40003
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:32:33 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id akocm0tTv4n4rakocmA2Jj; Wed, 13 Oct 2021 22:25:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634156730; bh=75TC/DRX2fxfKSK9P9oP4HsWGKHMDwSxZip7DjJ9s8s=;
 h=From:To:Subject:Date:MIME-Version;
 b=C1HutnqVK3HW8jvSA33iqzGsrGcTOhW7mnXPY3yoCQH/lmweBfsMOQUBlZAJT++YC
 rIQqXNCpt5UfDHYRdq+zFvc+N2L8L54llbRIP7khARYV2E6XQBGZrr2d4kKhn+T3tS
 v4rZJ3OTlQWsW6TYn7WIa6/6hZavF0F3ipFwBBpZZwLTR9d5m0vcNsdwnJxklLwuWa
 0wPFPAs6XCGKTKl4X5+KImIshpIZjPIRomlPBP0/Kpkcw5TFQUgi0Ra8fROlsVL29o
 WYfL7Hm0L+GSJ7uLeHwWrtqr8WxE1OzNi04q6ljWTEU5wEehpmM8gxkZg7sAVQZ7OI
 hnN5H0maI7NZA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 22:25:29 +0200
Message-Id: <20211013202529.2113239-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAAObgEZJ9fJiykVpomx9XAcm+oskH6edgtQgV6YQzqGeOvIJ3H+jGFYD8F2jJPI6raBdxd5bio66g9RzRLODBG9KknE9AMN8b6nliJ5zpFqC6uVdlYM
 HFlHsxDMVXxYUyAUSSn8Hw2+O+c05Xc0gifIAjC4JEssqtL626Us1Je+wxT63KuE47Igf4qwN8md0oxjEfBUG6RnZ01BJUSqxjpFT9QEOCe5GhuskyWalTA9
 w7BQ2Kzz7ROsnc0NGsSG3fDL6uCmVZc7QcktB3wGV2/mdci64qJ3LzI5YwMmRUMklgJzwAMzcA7YpNrmDQ7Nyg==
Subject: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288: bump to Linux
 kernel 5.14 and u-boot 2021.10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bumps to linux/linux-headers 5.14 and u-boot version 2021.10 and drop
local uboot patch where CONFIG_SYS_BOOTM_LEN was set to 16MB because on
u-boot 2021.10 it's now set to 64MB as default to make room for Linux
images.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch | 35 -------------------
 configs/amarula_vyasa_rk3288_defconfig        |  9 +++--
 2 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch

diff --git a/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
deleted file mode 100644
index 64a147c09e..0000000000
--- a/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
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
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 3b12da077c..934348e1bd 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -22,7 +22,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
@@ -44,4 +44,3 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
-BR2_GLOBAL_PATCH_DIR="board/amarula/vyasa/patches/"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
