Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C922C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 17:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B903284367;
	Thu, 20 Oct 2022 17:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B903284367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94kufsX2hWyv; Thu, 20 Oct 2022 17:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDD58434C;
	Thu, 20 Oct 2022 17:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDD58434C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D93211BF346
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 17:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0EE884328
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 17:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EE884328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zz5tWV8cIGcf for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 17:40:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1388434C
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1388434C
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 17:40:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lZWyol7Rsae4mlZWyoLAho; Thu, 20 Oct 2022 19:40:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 19:40:31 +0200
Message-Id: <20221020174031.335520-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI7RhAqYUgSSnccr3MY3kCdYl7IXOXTargPh3nBVDuC/hxjpmBhiRxT1TPhOassuu03YszmDc4OrEXKdlbbeFLgjR0zDUA2f00QCxToNIQqjez1ceslU
 E30PLjV2IqDG4egjLYCvzzGat8sQUWmP4yfqepDewStpvpiKYkSGdhQoYMdLiIRM/7wfAr25/cfIyX5V5qKfw5VnRj3593ekUZAHYNfvp9XK2OijwNVyWAw4
 AEoc1lfXjXOWxcdtLeNEmV9JdmXAHWt3HvFGyW58IpEqlM1N5fCdZSnmVsZUqLfV
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666287632; bh=EeFQ0ZkwibjZaOiSGCAgwADilit4GkyNeOhu1gzLsvk=;
 h=From:To:Subject:Date:MIME-Version;
 b=eAf1qY3s+nhoQUUrk3+KgBamAzrgmk6SJts8MLBJAdeRzeVdn7KOeRq7N79Kkw+Jt
 jbQ6I8QiOxLfRW2KskEleQjoOGSDYVr5D0jWCY1h2a1gbbdIyfEbOJ4wWoXjghZwck
 bFVppWXOPAs+Dk3DB2O5uS3PuSzGZPFDTuJf+5WmdgqMQGstv/zVCqVH535oz7mugK
 qWo6xg+8FK0a1rRGZ2FMJrSB5I9hKaN/yobjs3RBuktxJxnYcIetKbSaXU6qZAuUdj
 iUeLazrclWRSvaieC+Aapk+P9/wBVhpdOfbsg5+XyDk8Fotg3RbrskpLCZVYFmFlnw
 Jn8s3zB2aNexQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eAf1qY3s
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.3.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 9ec5c63f55..9489f25c6a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05  harfbuzz-5.1.0.tar.xz
+sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 75d55106ea..b0112168e1 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 5.1.0
+HARFBUZZ_VERSION = 5.3.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
