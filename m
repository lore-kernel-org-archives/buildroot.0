Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A21C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 22:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D172581AF4;
	Wed, 31 Jul 2024 22:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YBvFvOD1FXf; Wed, 31 Jul 2024 22:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C95F381AC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95F381AC1;
	Wed, 31 Jul 2024 22:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE40D1BF400
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA83481AC1
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gECxuNb9oMi5 for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 22:03:33 +0000 (UTC)
X-Greylist: delayed 455 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jul 2024 22:03:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC0E381A15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC0E381A15
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC0E381A15
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 22:03:32 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 67CA2240E7A
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 23:55:55 +0200 (CEST)
Received: from smtp01.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id 4E22B8016E;
 Wed, 31 Jul 2024 23:55:55 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id EF475240A6D;
 Wed, 31 Jul 2024 23:55:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 23:55:46 +0200
Message-Id: <20240731215546.758381-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 861
X-purgate-ID: 154282::1722462955-CEE5DE5A-F0C48B6B/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1722462955;
 bh=/H/rN0XAhW3578nk8JIw5ipni/AKXviVEFpGsf6ppck=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=dJMkELunoAE7ZD11r8A6T0WoJMIrB8CsFDgW8VBtmEHRkpDQWvmPdAV2lneMRazAe
 Xjz8/x8tLh49Ji2PtKC58IwsDvOPQenOEeaIMhcKJi2w8vLMEX+1jXNXu2UkswPZ+u
 qE5UGLBhHodLzGlWBYHv8jkEwHBbnu7Lg8WNG0H1xvOFdsJCx4BMf7CewOx4VGjxiN
 fGBC7GtQotjM/ljFiuj0zgZbwvZJszWr1YuZVQjoyUw2dt6yve1JZUVea9OxFMudtI
 bHa47+j/NLNfG2MokIDvzRMGSF7s8vJcRq2dqkUdzSYhepn7rHyH05Dtte+vd2j2fK
 asxfLPS6pvEOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=dJMkELun
Subject: [Buildroot] [PATCH] configs/rock5b: Remove futile uboot tools param
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While switching from a custom to mainline kernel, the uboot tools
became unneeded and were removed from the rock5b_defconfig.
However, the FIT support configuration parameter was accidentally
left inside the defconfig. This patch removes it.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 configs/rock5b_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 2765b5fbd8..0778e8afdf 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
