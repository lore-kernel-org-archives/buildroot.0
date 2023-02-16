Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34729C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 21:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543354199C;
	Thu, 16 Feb 2023 21:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 543354199C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7oxB6zOBR5F; Thu, 16 Feb 2023 21:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ABFF419DD;
	Thu, 16 Feb 2023 21:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ABFF419DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E721BF96B
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C3C24045C
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 21:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3C24045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b417xBjilQ4v for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 21:25:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421F3403E2
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 421F3403E2
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 21:25:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SllKppmOEySOSSllKpIolm; Thu, 16 Feb 2023 22:25:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 22:25:51 +0100
Message-Id: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHperI59WzQ736Ve4Z1rZvJp12pHe+ezBYv4Su6mG/j7V5S2bcMgeD4lH0w/71dplylf+GSHeIGMtWPCdMd4RHfdMa5A5Qd+rHGgHPBDOcoU72CUTlik
 A2m4f0rwBJshgM66+4uwArJFu01V5vIaBCk7upk7uIUBrOJvQN6e71u2sWXqB56rqqcSJ/gaVbT8JM5AzraAyjbQBD0QlQGS+0uf9OhkzzjhA9PCgJOVBBN6
 DG3i7TGYRay7jLsBWHK8ieO0beVP6OuJZO6D+fE3P2ABrjeL+plbnHB+q8lie5Ccrt5wa8bZcYvrj1IF6rOk5YJO8NpDtlokudgYrgHb1eccdvsY5zbNSC+o
 995l6Yfa
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676582755; bh=ejJKwVxTAlQPnl1Nzn687Rq6E2krqMIwJxEjKGWY7FU=;
 h=From:To:Subject:Date:MIME-Version;
 b=giGbSeBFIsHJPjUb7wPyAGSBfVhhK12qal4Uaf5Df8FIUYd9bYa9dTw0xb9oqNqCP
 emyJt/2jJcMXXn4CGcR2/nf37znkBt5zD0PsJFRpV+BWT4rZE91rtND5LYjxGdKby1
 +ML+zbljlnohvCA3/2YzrkywTxoVZhryqYa74emQZkcyYJup+kBtNJEFPGiTPGTASk
 xKG0N+4UiSuPfXgV6AE4zYT8o1v6prHgD821AFUBZVxYfNAZNfjWktDTWuc+dRtgG3
 ou1YDsPT7zH5MtyECVquKxM6CdRV/1gnpV0lRCEfxx9s6f3YOPhwWiLw3pdO5q4ViV
 +r6tjyzwTyjPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=giGbSeBF
Subject: [Buildroot] [PATCH 1/3] configs/imx6ullevk_defconfig: bump Linux to
 6.1.12 and U-Boot to 2023.01
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's also reorder BR2_UBOOT_ options by moving
BR2_TARGET_UBOOT_FORMAT_DTB_IMX after BR2_TARGET_UBOOT_NEEDS_OPENSSL since
this reflects the order in boot/uboot/Config.in file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/imx6ullevk_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index c6e2981697..b507d1c0d6 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
@@ -22,10 +22,10 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
-BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
