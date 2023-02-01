Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF8C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B6881E76;
	Wed,  1 Feb 2023 22:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79B6881E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tx0WHhJUjJT; Wed,  1 Feb 2023 22:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3E4181E7E;
	Wed,  1 Feb 2023 22:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E4181E7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2401BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3268281E53
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3268281E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ls2TRaQmjed for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CDE981E76
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CDE981E76
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:47 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLempwuwb; Wed, 01 Feb 2023 23:32:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:41 +0100
Message-Id: <20230201223241.3867678-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC9pAqe1IQOnoDIUk1Xr8UQ27Q4UjzH4N3UOFasJlkRMu5yfxI1k1hDl4SM7B5rVp5tpBeTpeUDJ17Wk8weFBvFqr+MLZQtD7ekEw37Pue7XzsKpFIP2
 3/e4PQSDbgk76tOnkDUeBkF/271bKMwbAp0X8LMfbPa8NsPFc8X7ea4WG1y+G28lly0oRR1RSTvgz6hGcDIOOxSzFZ90LmBd2z3VZbyWI60nmrtvcBmH0V8B
 gi3YsGqwu2H044E4VTz2fEojW6fA4TkD2UK8SQepozvwddKcJnLtokFfhjVPKeDCAe64iUyQm6XwoX7UGcsQipc6MlN6HECjD+QvHRDNaKB6W0sDWGu+OMvl
 hNieGZhtg5ijMQ3Vc/S4mY/FpwZ8dBIDQ5qzQP9tY+OrgHbNl9A0sY/j0GKCaqiXHcbp5jpZamPRQbWsxuNnNWccMjGJbA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675290765; bh=o5w5VLp6XakHPRbYGJzm7hk10WvClkP8W0Cm+4Szdi8=;
 h=From:To:Subject:Date:MIME-Version;
 b=YGhLxr2+H3nkEMxJrBh8HVWnANuQg73T6w14UJ5M/FvHtmlsXyYtJLMCz7ZOsCkY5
 96pZT4lpesWqOG0aXfEweLXcKFPVecWqPixFJB16gXQgGaqOfZGQtPlNG45uxm6W/Y
 gpbwIUEVE7Jm/vY5PdUGTWWub3o4hKLZCfUno5WEpPtZCk4mKdMaW7hTrwczd7Du5n
 /nLGif0z3gsFitTOWmH3lhNWlcj3lvqvqe+qkHpBUEAvp9KXtSV6wkqKve9JtGkmqq
 VQzt2nVclDKtB9+bt7inDAYNB3ylZZKm8V2/8rmUXI+S1GGj0Mdq2AfoMTHnQ9+Luz
 01/LPkiBNToAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YGhLxr2+
Subject: [Buildroot] [PATCH 7/7] configs/olimex_a64_olinuxino_defconfig:
 bump Linux to 6.1.9, U-Boot to 2023.01 and ATF to v2.8
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
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux 6.1.9 installs more modules and this makes rootfs size to increase
and the default 60M size is not enough. So let's expand rootfs size to
120M.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a64_olinuxino_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index 53e8c2ece5..dd445e8ce0 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -2,13 +2,13 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
@@ -16,7 +16,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -33,7 +33,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
@@ -43,6 +43,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Olimex A64-OLinuXino"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
