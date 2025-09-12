Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697BFCA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2950C6061E;
	Fri, 12 Sep 2025 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ltrb-W3jX7WQ; Fri, 12 Sep 2025 21:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DCB61373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DCB61373;
	Fri, 12 Sep 2025 21:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C81CE25B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEFB76061E
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzAtZoPsiWF6 for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 21:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 998B561377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998B561377
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 998B561377
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id xBEVutAGSqg4pxBEVuHfcH; Fri, 12 Sep 2025 23:23:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 12 Sep 2025 23:22:55 +0200
Message-ID: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLLMhbc87dZB6/xbehw1HvUDEPmRTgewQdCTqBaJGr+MG1OChnx/cTAuLZYAttglhpzOAJmBixpJ05LFrXGKeebhJ+bBF3fjBYY11w1z7Ckrefns2RPE
 0Nq3EyMtqe4WJYHvXdILXoIVGZBhBj/POcLXfEOUVFGIeToI3B+73qf3sDP/KvOVUVPxDR3f8ql4qsLYu3czGp6rU4j+oKXZMgI46E0IbYzOw9s0TROHG+dM
 s4WKNrURJLobKFTHmJjT9G0yYzmqteRV0XvQe6cFyTtiLCiHFhLkg0JnkPqqrTWFZkqpHKBKohl4T2S/KldMLVh6RpAkB6SX+H23EOFgE2FxdHwc/dFdV/iB
 JDFtJi9J
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757712184; bh=FEUVoFEi7EFePqDJ0ZrKNqrrxgJOqx5iPobZk57pK/0=;
 h=From:To:Subject:Date:MIME-Version;
 b=I/p4mWjbqlTNB10bj5Of7dMKbzK7xWtXn0L/r+083ZCqN6ykkihKwLECjKpq2FpKR
 Dw2xvmIdQdbJAQ4A1X5eTZS2bOszfWi2Zaijlm9UGS/UTdeS2tzo5SU2cKKfNmVeXg
 vk4MOSegaAFbUeprL0AzKk7XSjTzFTLB81SjOUqdVgOSOmkBqMYpbT72oopwiHoQ4V
 qR9zfU6mtgzl8PdRlBZmF6G+1hX7XGF1RoXYXu3/Ze8e+UtDCzaQt0i5yYswClLt2c
 xLBbWQGPmYtYlrHgE3UXVAPzmdL0gYQ1xt60V/kDYi5Iq7mLkPLwsnzMmkOah8MD3R
 5zMOwwd/LRAlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=I/p4mWjb
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.5.0
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a4978ca134..ccf96ec6d0 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa  harfbuzz-11.4.5.tar.xz
+sha256  2d30ba45c4c8ec4de661a1002b4f88d0841ff1a3087f34629275f5436d722109  harfbuzz-11.5.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index b1bec26ccb..4ec3165e57 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.4.5
+HARFBUZZ_VERSION = 11.5.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
