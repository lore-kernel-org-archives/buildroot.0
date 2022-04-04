Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CE1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 06:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E40EC829DC;
	Mon,  4 Apr 2022 06:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rElK2BS3SKgY; Mon,  4 Apr 2022 06:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE8E8254A;
	Mon,  4 Apr 2022 06:29:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 029051BF406
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 06:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3AD54067F
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 06:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7WuazZtstlm for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 06:29:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com
 [IPv6:2a0c:5a00:149::25])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8343F40178
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 06:29:10 +0000 (UTC)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
 by mailtransmit04.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <scritchlow@bioshall.co.uk>) id 1nbGD5-00DR3U-7c
 for buildroot@buildroot.org; Mon, 04 Apr 2022 08:29:07 +0200
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <scritchlow@bioshall.co.uk>)
 id 1nbGD4-0005bT-KK; Mon, 04 Apr 2022 08:29:06 +0200
Received: by submission01.runbox with esmtpsa [Authenticated ID (886419)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1nbGCm-0000Bn-VM; Mon, 04 Apr 2022 08:28:49 +0200
From: scritchlow@bioshall.co.uk
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 07:27:42 +0100
Message-Id: <20220404062743.9199-1-scritchlow@bioshall.co.uk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/licheepi_zero: bump uboot custom
 version to 2022.01
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>,
 Steve Critchlow <scritchlow@bioshall.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Steve Critchlow <scritchlow@bioshall.co.uk>

This also removes the dependency to have Python2 installed.

Signed-off-by: Steve Critchlow <scritchlow@bioshall.co.uk>
---
 configs/licheepi_zero_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 2e1a413988..d7a281a0a0 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -36,7 +36,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
