Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3BAC54E76
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 11:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DD541B94;
	Sat, 18 Nov 2023 11:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48DD541B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMdMMsz7fV_Q; Sat, 18 Nov 2023 11:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1C56417A8;
	Sat, 18 Nov 2023 11:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C56417A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24DD41BF2E3
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 11:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0533860B2C
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 11:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0533860B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpMJ6sp1ahMK for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 11:53:26 +0000 (UTC)
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2DE760B09
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 11:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DE760B09
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 4Jt3rTuB8eWP24Jt3r8gd2; Sat, 18 Nov 2023 12:53:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 12:53:14 +0100
Message-Id: <20231118115314.3210726-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfB9k0hBXRruMz/R+4qWFLzDQCzBqwxxWHXIw44n/AR2ofBLykod7mg9nlPNch9gioge+/ka1IF1YYPQQSwUAMeGKJ7i9T4umQZna7Jbh/o5e9N38Mmyv
 sGZ2T374J6eOcqif8n1wLJEW2IFvzRJSp5zuKrPPfoYuruEL6QLlYNAZIxHPt/RqvbMffW8GAI+5Xw+4FlntEZGCn3XUYdJqokdM8K/oCBlj6JsmSuRy1EL2
 zFen048hrJogeaM/TF7BezaiZ8m5KUTswOkb/rCtKOJXTVvSGg34MFut0d/NmIVQtYYo/vFjgvO5To6tog+qUA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700308402; bh=Ju9jZCtUKB9wW4tQcUdBQd9ualnt033aSSaLY53VYo8=;
 h=From:To:Subject:Date:MIME-Version;
 b=dNtTuf+p59WJbvrEgvlw8APQJGcGJ8b+j+O57kPjTSEJL150IXgfp3YC7rRHi5Awd
 0W3bAZL40l8g5FJSwJSy2rAIl5XsvdkmmtYg4cICIpmESfeOf8jEVlHTXXH5jPPOKK
 v4CNMeCgjtRxWjwz5saGeeJM1UB7RlAsporiqu3mvtSkuVx+OME0NUve6e53Xwzc1t
 MDYPI3Ps9EzfB5bo2VQpfPT8m81JIVbqf7EvilZB9iqmrBu3ea7uvxE06SKF2msaGa
 kNcFNvv8rEmSBcbqjJrhb41c05Sz2B773DY3mYS6Cs3pFuw+kwBUIvLRlLLQAprXkG
 cae4bAjiLv+cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dNtTuf+p
Subject: [Buildroot] [PATCH] configs/rockpro64_defconfig: fix build failure
 due to missing uboot dependencies and rootfs size
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
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot requires pylibfdt, pyelftools and openssl so let's enable U-Boot
corresponding BR2_TARGET_UBOOT_NEEDS_*. Rootfs instead is not big enough
because of Linux modules size so let's extend it to 120MB.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322041

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/rockpro64_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index 4704ac7206..472b9aded2 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -22,6 +22,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
@@ -43,6 +46,7 @@ BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPRO64"
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
