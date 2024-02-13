Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02DEC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 13:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FD53400DD;
	Tue, 13 Feb 2024 13:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ft3saN8YRyz2; Tue, 13 Feb 2024 13:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF9340189
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF9340189;
	Tue, 13 Feb 2024 13:13:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C57C21BF406
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3151820EF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 13:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnLzWWHCRghq for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 13:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C46C820EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C46C820EE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C46C820EE
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:13:30 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id F32CD2C80CDA;
 Tue, 13 Feb 2024 14:13:27 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:13:26 +0100
Message-Id: <20240213131327.2823205-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707830008; bh=hlOHESkb5QZtNW/QCuQ738suZ9BGkjhlV7YR+n3EfUQ=;
 h=From:To:Cc:Subject:Date;
 b=qK6hQiRoZ6wxFonxaTwLApDowFPzw31OnEYNfXdCX88LeOWod/KT7M1vvbTyNbHq/
 hZaNvNa/xQ1dLZfcJ0a4zI4vR2A5NVfYV4c7Ky/QCRmmciCohq3mf9YJqtc35wApX5
 e2Zq8ARWJ4STXBKjlIsZo6x4DSVKVGkACg3RTy+5cwI50iYQm1EqBPUCrKxZiHMpsE
 jrbv/bboB3A+v0oOYImqf/P+9MVHVajgzJzpNfgUe5MNwB11YyYvuKj2YrExij0m4q
 biqWf3lgOkuPt+X6ZoGOPW7ke4QJw2YS+AVVKcfbypWmZCE3m2jPIncSZwoqnnsn8E
 iZzjgib2LRxPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=qK6hQiRo
Subject: [Buildroot] [PATCH] package/nodejs: bump to version v20.11.0
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE hash changed due to two things:

* c-ares vendored dependency license got updated [1]. This is unused by
  buildroot though anyway
* base64 vendored library license updated copyright years and sorted
  contributor names [2], [3]

[1] https://github.com/c-ares/c-ares/pull/556
[2] https://github.com/aklomp/base64/commit/2e8ad2aec2065f258dc1aec9402aedd3604cfbcd
[3] https://github.com/aklomp/base64/commit/d7bca2bb2928de6c4fe496e6defe8b3affa35d1b

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nodejs/nodejs.hash | 12 ++++++------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 2d60437a7c..86bc86e73a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
 # From https://nodejs.org/dist/v20.9.0/SHASUMS256.txt.asc
-sha256  ced3ecece4b7c3a664bca3d9e34a0e3b9a31078525283a6fdb7ea2de8ca5683b  node-v20.9.0-linux-arm64.tar.xz
-sha256  64099d7e62bdbb8efd52c216a6759b3cdd77c38aa993096fdee9f875d95b2d8e  node-v20.9.0-linux-armv7l.tar.xz
-sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v20.9.0-linux-ppc64le.tar.xz
-sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
-sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
+sha256  f6df68c6793244071f69023a9b43a0cf0b13d65cbe86d55925c28e4134d9aafb  node-v20.11.0-linux-arm64.tar.xz
+sha256  f943abd348d2b8ff8754ca912c118a20301eb6a0014cc4cdea86cff021fde8e6  node-v20.11.0-linux-armv7l.tar.xz
+sha256  6a0e1fa23d7bc707711bbc36159b4220eca123e13435d266d690c6b6c443dc67  node-v20.11.0-linux-ppc64le.tar.xz
+sha256  822780369d0ea309e7d218e41debbd1a03f8cdf354ebf8a4420e89f39cc2e612  node-v20.11.0-linux-x64.tar.xz
+sha256  31807ebeeeb049c53f1765e4a95aed69476a4b696dd100cb539ab668d7950b40  node-v20.11.0.tar.xz
 # Locally calculated
-sha256  93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e  LICENSE
+sha256  7b0bbdca72f925bd78b764914651244a4432a753c7325d061a565cd7eac1193d  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9806a64d38..e70c39f803 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.9.0
+NODEJS_COMMON_VERSION = 20.11.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
