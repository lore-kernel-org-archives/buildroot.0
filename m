Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FACD5E377
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3998459F;
	Sat,  9 Nov 2024 17:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNWj7LZab1PC; Sat,  9 Nov 2024 17:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6443845A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6443845A9;
	Sat,  9 Nov 2024 17:09:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C09CD8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 071B5845A9
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBaFs6_AHqtE for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.235;
 helo=cvsmtppost20.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B6498459F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6498459F
Received: from cvsmtppost20.nm.naver.com (cvsmtppost20.nm.naver.com
 [114.111.35.235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B6498459F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:09:18 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo029.nm ([10.112.18.60])
 by cvsmtppost20.nm.naver.com with ESMTP id dV8bEFZDQUOV0-rfeknXSA
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 17:09:17 -0000
X-Session-ID: Gc2EprWNRPuNebaejFAw8Q
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: m9YqKxuqFqJZ+HmrFxbl+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp002.nm.naver.com with ESMTP id Gc2EprWNRPuNebaejFAw8Q
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 09 Nov 2024 17:09:16 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>,
 Cherniaev Andrei <dungeonlords789@naver.com>
Date: Sun, 10 Nov 2024 02:09:00 +0900
Message-ID: <20241109170900.1766890-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1731172157; bh=na9dskwDzE5KVWHF4KHWm44NsiUHFVoA7FRernLvWzw=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=a4p9NkoKWIIcFE6rMNy8+CI60waIxnlceYBj3btVwL2lDT2wgblRMZoyIHpZphcr9
 cmli/NH1qylV7MCRQrrv/lzTNsQMSQoQAPJvFHmeQ3MfbwmdlCsP/JqdKFHft0dufX
 Vs46LLY0L5YPubSstiQV1ECVdM96eOMafKGkIgyaQuiezLxoO5+xPhMqH0tFuOMo6Z
 8Ij24RDcSF8d7YLWvka8u6MiUAbjhHfB1Q26VmwdpOUqSicYCI+oUm4DsXwEUTnOL5
 tcOh7SQpNjfbC3GhQWAw2pvf3+fIa3Ht3J/3TOPsMa0IlxWygTgvYefZnVV6qz4O6O
 g8KTgeYFX8c7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=a4p9NkoK
Subject: [Buildroot] [PATCH 1/1] package/picotool: fix help
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

before this you will every-time see "*** picotool needs a toolchain w/ C++, threads, gcc >= 4.9 ***" even if all features are enabled

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 package/picotool/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/picotool/Config.in b/package/picotool/Config.in
index bbbcef405d..51c7c71188 100644
--- a/package/picotool/Config.in
+++ b/package/picotool/Config.in
@@ -1,6 +1,6 @@
 comment "picotool needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_PICOTOOL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
