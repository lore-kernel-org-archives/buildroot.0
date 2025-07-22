Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C8DC83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 22:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6942E8097E;
	Tue, 22 Jul 2025 22:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTx0EpcpunNo; Tue, 22 Jul 2025 22:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B603980983
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B603980983;
	Tue, 22 Jul 2025 22:08:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 924E9E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8452D403F6
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9JUBGCmFgnl for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 22:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5409D40993
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5409D40993
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5409D40993
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 22:08:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id eL9yuYLxgD5sdeL9yuqBe3; Wed, 23 Jul 2025 00:08:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 23 Jul 2025 00:08:28 +0200
Message-Id: <20250722220829.3428015-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAPkQrjeOok0iiBpCFJa9//tFtruE4JlrS8NJC91+U4in+gtFmNGybTfbtGUWo2DnJbHAnBFpengD6u6CM7zGigvNpMh/uexDMQg035jLpUqUhoUl1PF
 p/RsciyhLypw+XDXeomrV+CQ0K6TgA164AwowhLChT7dcWSR80XEvtArpxARb5Uej7gWP8sMM9MtPtNy1s0xO/BtPJebK0gbs/Z2POuzjyCG0V+FrW55sVtx
 WbJM3fzAuHaEYt+jiqJlK0Ld6LQehBs9M8iJfKOgRVgk/w/j31RZymHMgxLymyNpkrRIP6U9qtn3o23jFKgnuw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753222110; bh=+8yNM2aS0IPpva1AZJ7yhVtNnTN8TM4KJb161jre7Vg=;
 h=From:To:Subject:Date:MIME-Version;
 b=JP0QwOBBbttYO2KSx6UP9pYvaJ8rq4mMpZtJqe3epCQcEY2cZhz+XBUyLwhEcZt4t
 wVqXozGNHvlDFL3H0kO2Mc020IcCuK3Fpdf3SvbybblzZ2HEq3v8pcDOvEV2pabKDF
 ljp0J/2ODtSYaHIk0LPjNh1cHF7pS2GLm6YFQ8PTdJtfqbOoMLxMEap+h+HCyN5UCF
 hf5g20/o3E4FVBG25SZ7u+q1ryJH+jGTbUAKgXWxSGNngu0FucB6ww2UVT2BTFwq+b
 dfcTk5Tqzrzskgd+nJrLuIx0QBLEV0t0lH1XX6awHyXJKKTMm+3zg8w+gaQyKPoRR9
 w5AnPBy9CsuVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JP0QwOBB
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.37
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 521447e051..172778540e 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.36/src/SHA256SUMS
-sha256  55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f1c6895  nspr-4.36.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.37/src/SHA256SUMS
+sha256  5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa  nspr-4.37.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 62a2b92db6..a045140743 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.36
+LIBNSPR_VERSION = 4.37
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
