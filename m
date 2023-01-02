Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC725C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 22:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8322681295;
	Mon,  2 Jan 2023 22:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8322681295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJ-i0qXz0h2G; Mon,  2 Jan 2023 22:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1FF08128A;
	Mon,  2 Jan 2023 22:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1FF08128A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3E981BF2CF
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 22:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF2038128A
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 22:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF2038128A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8GJIszN_7Uh for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 22:49:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A948126E
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21A948126E
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 22:49:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CTckpU2fytMLwCTckp6Jfu; Mon, 02 Jan 2023 23:49:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 23:49:41 +0100
Message-Id: <20230102224941.1398423-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPf/OzJIRhsmn7DevY94GyDA48ZS49sQRghvqQI3P5iUENQMHkHRM6623Ff4fu9My54AhDNIzb5HYHSVmPsedBjiMdSh56ciy9xFY5+4rds7QswpWwsO
 kjrjpa5Z3THQFdYAWkTX0TSdEjfypKo1WzXkXAUOoIBGhiXD1ewCSh81qXvJtidCLtihZ0UoyVBrBoWkhdQure3XVQQp5EcU1xjF4YSvw8OnQWCE79Atfhu7
 hIMgY5QQ4MeV1eNyXLw+GF4rri76YkYw/FxXiokklfkWuSZLyyT0BwvlWF+dGyHSytvuYVzvaUlcuZzkf1MTtg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672699783; bh=BqyZPbrZsYqmQLvRlMJ6WHjCH78vID/DW0C74Yyh0ds=;
 h=From:To:Subject:Date:MIME-Version;
 b=DsB/kSf0pwHVa5BpNU2bjGraTVgqMVarhr2J2eEIPIVYhffYR85fi8n7Bp1w1kPWg
 v1FxNtJGe+DJgS/bcSJFTVlewoDtedEvdwEhAm2ORhBgYzJhwEuxdfP99tt8B+4GfL
 v1EX6f1ntbDCyF7TZbnzzCNQmttbm9U8mOuvw/ynPZ6QXXcJNv4W343/R2eJdvZcDO
 Q3dO5KeUhwYKwmjmPkg45YgttKZfUhqZFTDp/PZBGAUX9L29RAL713SEYl5K7NVsYs
 qbvTQI0FO3uGospJD1px77/UEO948hJvjA0L2jWhZbXuT++WrqvmUxLDs+DQrodvqx
 +LDgGDwIgU/LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DsB/kSf0
Subject: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig: bump to
 Linux version 6.1.2 and U-Boot 2022.10
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index ff96019e1e..7976537225 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -3,14 +3,14 @@ BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.2"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
