Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9450AEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 11:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA93040988;
	Sun, 16 Jul 2023 11:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA93040988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bq9ctLMqrNaB; Sun, 16 Jul 2023 11:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7BB34098F;
	Sun, 16 Jul 2023 11:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BB34098F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAC441BF3A0
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 11:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84FB481339
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 11:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FB481339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evo7son06cUg for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 11:00:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5578132C
Received: from cvsmtppost29.nm.naver.com (cvsmtppost29.nm.naver.com
 [114.111.35.38])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5578132C
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 11:00:48 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo019.nm ([10.112.22.34])
 by cvsmtppost29.nm.naver.com with ESMTP id 82Nk49U-TmmqPta-9x7zuw
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 11:00:46 -0000
X-Session-ID: MhA2gxynToCv081i5oReAQ
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: AqYXFAv/FoJZ+Hm9FA2Z+6E=
Received: from linux.. ([125.132.232.68])
 by cvnsmtp009.nm.naver.com with ESMTP id MhA2gxynToCv081i5oReAQ
 for <multiple recipients>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 16 Jul 2023 11:00:45 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 20:00:38 +0900
Message-Id: <20230716110038.16200-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1689505246; bh=idP2m5CgNuIK2V2zeGViqHcNAX1bZgXb5ZOE9WK//tU=;
 h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
 X-Works-Security;
 b=EpPSKCeQWSYGVh+3MTYvAA5lV56NGEK762/aqGy3KCansbSESNNuXe2fL+3QJO3m6
 zXFyGjvRAeSXgecZAzPBJuqNylJuWH5AaVdtxz860D+aMw0W6cf6X0BMKZJqV3QxWN
 YL/Uusc2mXol40hDKKs5VJH5XxKArBA/Yt6X8dLpgSlcmPBPrC4Ng/OpHLBbpNuwjP
 aCPrY3NGOkD3UwK4avfnI4cW/tHoUO0Dnkgakrim1uaI3jEPW5O9r6xnORM7lPunWl
 2aty2yCd4uc00PfydNuRulP31vBTfrqu02n31XC6JJ4+go/+ulUO7kKqsC2KXnZgOb
 DF+YA+ShRAnPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com
 header.a=rsa-sha256 header.s=s20171208 header.b=EpPSKCeQ
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add MMX instruction set
 capability for Geode CPU
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
Cc: AndreiCherniaev <dungeonlords789@naver.com>, bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: AndreiCherniaev <dungeonlords789@naver.com>

Currently, there is no MMX support for modern GEODE processors in Buildroot.
Yet, some packages like ffmpeg can leverage it when the package is built.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 arch/Config.in.x86 | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index c770ae3ffe..595db48d91 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -521,11 +521,10 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
-	bool "geode"
-	# Don't include MMX support because there several variant of geode
-	# processor, some with MMX support, some without.
-	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
-	depends on !BR2_x86_64
+        bool "geode"
+        depends on !BR2_x86_64
+        help
+          see also BR2_x86_geode_with_MMX
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
@@ -633,5 +632,16 @@ config BR2_READELF_ARCH_NAME
 	default "Intel 80386"			if BR2_i386
 	default "Advanced Micro Devices X86-64" if BR2_x86_64
 
+config BR2_x86_geode_with_MMX
+        bool "GEODE with MMX"
+        depends on BR2_x86_geode
+        default n
+        select BR2_X86_CPU_HAS_MMX
+        help
+          there several variant of geode processor,
+          some with MMX support, some without.
+          See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+          And decide can you use MMX or not
+
 # vim: ft=kconfig
 # -*- mode:kconfig; -*-
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
