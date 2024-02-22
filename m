Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC0DC54788
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 13:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A55D341D62;
	Thu, 22 Feb 2024 13:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cfo_AeqA3W3; Thu, 22 Feb 2024 13:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A388841D63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A388841D63;
	Thu, 22 Feb 2024 13:16:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAE9C1BF40B
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E589382695
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWErfa-Ut_GL for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 13:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7E9882681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E9882681
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7E9882681
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 13:16:31 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 12F062C83940;
 Thu, 22 Feb 2024 14:16:29 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 14:16:27 +0100
Message-Id: <20240222131628.3479059-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708607789; bh=FDjYNpn+9qqqY2bvRE68e9DcbrVgv2eDz7/TdiUm1gI=;
 h=From:To:Cc:Subject:Date;
 b=LnLeoYbzdkre3NF8Wy0OSjAQ08RFLCNHpAsS2suICNNWrvabKsWt7PbfVkyiLHinD
 bRlgzRowDSXA2e6J6zJ67llmSxNRbp1qMIYPn8V4D3Y6MyqYCr9TJfJtYgASpFJ64p
 9xuMlDxQMi9oBsajOLWrMWBBeMJE9X5mhVqAdV2sxvNHnosCYnmWnU4sYmYq7Yxidw
 TnzOlN+4t4Fv26O9DJ5tw7jEb8yQnG6R/JGykVXJ+VdbmMIE6TqFdu87uJMklW0BIm
 y7T+kqrcR5snPZ7mLByTUr+VqV+oOyjNeHB7MUvnqkefA2uUcvfCCO0DEUeBQSJzNq
 ts4MLqCSY917w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=LnLeoYbz
Subject: [Buildroot] [PATCH] package/libuv: security bump to version 1.48
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: CVE-2024-24806 / GHSA-f74f-cvh7-c6q6 [1]

Release Notes: https://github.com/libuv/libuv/releases/tag/v1.48.0
Full Changelog: https://github.com/libuv/libuv/blob/v1.48.0/ChangeLog

[1]: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c6q6

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 1fd286d9e9..2ca8f64a80 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  94f101111ef3209340d7f09c2aa150ddb4feabd2f9d87d47d9f5bded835b8094  libuv-v1.46.0-dist.tar.gz
+sha256  c593139feb9061699fdd2f7fde47bb6c1ca77761ae9ec04f052083f1ef46c13b  libuv-v1.48.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 76316484e4..5f96e98a98 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.46.0
+LIBUV_VERSION = 1.48.0
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
