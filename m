Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB11FC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66BF6414EA;
	Mon, 11 Sep 2023 19:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66BF6414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrQDe_KLZzUB; Mon, 11 Sep 2023 19:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF8A4031C;
	Mon, 11 Sep 2023 19:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF8A4031C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD22E1BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94DB641873
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94DB641873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQjsLWRTk6oo for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:27:06 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2ADE4185A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2ADE4185A
Received: from localhost.localdomain ([146.241.108.254])
 by Aruba Outgoing Smtp  with ESMTPSA
 id fmYoqfP8vQSEzfmYoqqjH3; Mon, 11 Sep 2023 21:27:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:27:01 +0200
Message-Id: <20230911192701.1423805-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJpIPMN0cX+Ut6TTc3YQxpARBd2I8A6IBwmq5NRo/UtK0HQzLO8IC8qz5MqyHEQlVxuswXMHpG3F9YU2hqZMWN3HsXxUEmXs0snJe0BYDymQlzFSMxAQ
 moMZuSaVA/KwO96x8k87y72YLMFc+EGcr8FXhIq2SWtpcN4U9fYY7wF0xLMqvd4slNzuOGIJzJ9X1U8BfF6LoKsnUqMxgsZazMKXCAmlR/VdiwX3P94e9Fdp
 +cHMtL3hRAjEF3TWPkmF0kXfZOOvfdtzi6fVbi6UL7Xoek4h+DEL029JtO3yb9HD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694460422; bh=yiNl7EyeLUQhiAg7XxqngGWbumbE50flvyQmMHINUws=;
 h=From:To:Subject:Date:MIME-Version;
 b=HaEwfgwOK0PuyaPP420flDAceIgvq9AFz8XsmpC2sHrxMZrH2xQbchwz1wbAp1HfU
 r0d0mQdK4ddcwYFwnOs/Lnr/5myxL+AV1lF+r5az0Oi+JJwo+BMRVXlQOk8AvT6b4y
 Gcr8NF5QboR+BXNDs/O3l4XetLTx4mZXpyldnJjPGxW2icdGP+HEEpJOlQjucuU/3R
 ik/n3nRPbovS3A6zZKtpBvR3nCyBbQTptkXFhWKiqYpZtJMQ6HdezuppcJ6xIAEQaH
 McbTYmG08KQwsCMuEngPJ0zEPejGDKtVv6wFvuUl/eyKilD6SUaCeUYxIWZ5vX/8X4
 K195YdbN/cwZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HaEwfgwO
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.2.0
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

Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1f0d9befa1..8791899a4a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0305ad702e11906a5fc0c1ba11c270b7f64a8f5390d676aacfd71db129d6565f  harfbuzz-8.1.1.tar.xz
+sha256  8cb7117a62f42d5ad25d4a697e1bbfc65933b3eed2ee7f247203c79c9f1b514c  harfbuzz-8.2.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 6d52c52a85..43c559ed1b 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.1.1
+HARFBUZZ_VERSION = 8.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
