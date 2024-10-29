Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A309D2AB3C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 12:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C3EA80A83;
	Tue, 29 Oct 2024 12:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wq5cZ0VtIGsY; Tue, 29 Oct 2024 12:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A3980E04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A3980E04;
	Tue, 29 Oct 2024 12:58:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 742F94EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 12:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5446660847
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 12:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYeJKgBPCcWM for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 12:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.34;
 helo=cvsmtppost21.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 069586081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069586081F
Received: from cvsmtppost21.nm.naver.com (cvsmtppost21.nm.naver.com
 [114.111.35.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 069586081F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 12:58:51 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo033.nm ([10.112.18.61])
 by cvsmtppost21.nm.naver.com with ESMTP id XIl9OO0QQQm0Ymw9aAb0og
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 12:58:49 -0000
X-Session-ID: 8Gfl71EAR3aDqhX3utKNTw
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: keYdjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: qqnXKxgqFqJZ+HmlKoKd+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp001.nm.naver.com with ESMTP id 8Gfl71EAR3aDqhX3utKNTw
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Oct 2024 12:58:49 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: vfazio@gmail.com, dungeonlords789@naver.com,
 AndreiCherniaev <dungeonlords789@yandex.ru>,
 Cherniaev Andrei <27889022+AndreiCherniaev@users.noreply.github.com>
Date: Tue, 29 Oct 2024 21:58:47 +0900
Message-ID: <20241029125847.1300382-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730206729; bh=/kv3OjuqD7Vp4wuhhsqnRBJBnWiVPUzi1MGGShm2jYk=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=c8Au23oY9k7zQUKKkkA4W/tFvfShBVmPeH21o+BUgo4JlcMdbKvZO/Xr9X9OBlEsL
 S15lH7bEuxOCiMWTDfSN193Lcq8KrVI+6AqFqla/SJTR2FD1bzcjIp2Z29I4ZX7qyq
 KyZFvh6C7jn0fbIWwySX0UQUVbIMvSLCBhUluB9hGfF8Hl/Vs/BOLkUxCbDPSqRDVK
 16HMfLP8f2EKkeKLg8dWT6IzxcCceiMvbfGAQL1bm05XmmfInrKDyaRTYKP6gIqeI4
 7WpX8liKURFG+VUpfqN7WJV7Vt18YOLxxIx0cm4wTCXStORRck7BOf+sAICEdZyefL
 VDBupGlaIEQOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=c8Au23oY
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.x86: sync prompt and help
 with Linux for Geode CPU
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: AndreiCherniaev <dungeonlords789@yandex.ru>

Linux kernel for AMD Geode CPU https://github.com/torvalds/linux/blob/e42b1a9a2557aa94fee47f078633677198386a52/arch/x86/Kconfig.cpu#L232

Signed-off-by: Cherniaev Andrei <27889022+AndreiCherniaev@users.noreply.github.com>
---
 arch/Config.in.x86 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f9b32130b2..4f2682eb74 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -682,10 +682,12 @@ config BR2_x86_zen4
 	select BR2_X86_CPU_HAS_AVX512
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 config BR2_x86_geode
-	bool "AMD Geode"
+        bool "Geode GX/LX"
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_3DNOW
+        help
+          Select this for AMD Geode GX and LX processors.
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
