Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4A0C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 20:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B136C41347;
	Mon, 10 Feb 2025 20:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIwFqUkob-G7; Mon, 10 Feb 2025 20:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A24864135B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24864135B;
	Mon, 10 Feb 2025 20:05:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E38986C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C731B80D93
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFE_Ks6fEis0 for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 20:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF97F80D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF97F80D86
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF97F80D86
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:05:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A8772B0056A;
 Mon, 10 Feb 2025 21:05:21 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 10 Feb 2025 21:05:16 +0100
Message-ID: <20250210200516.25615-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739217922;
 bh=CsUZfZJaNesugys7ot4YuWCaIgN7U1N1HWoB8n/hXN0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZD+M/xeEMVvH8KG90Bs7D9UyRNybW072e9QV+AJBoLZFiHgBGPOxSnhFNp4RphJuG
 p6QxBW/bf7fZaWdve3W0nmNNKN2XLJ//axis5m66HyENXwrGifsjFt5eoiwgsjQIfy
 /AHhMImcUtypt56xDoUXyL0ipX3GPahks5kRYglLZmWVRHaVXz6iWnkLUmu92XGFPM
 nJLjmvT9GfYzPxKwjw4CSj5HVicBGom35pygoflZ/h9ndnJGFYpo8eoC1Rm666ifaz
 lhQpfQUJp7GcTwBI+zk65zRr7Vd3hoOFoH4fTP22fFbnn7hy9DWT8m03EqQs6XSN1t
 cCrbJ0GdrfX1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZD+M/xeE
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.01.00
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

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2025-January/013954.html

This commit also updates the license hash, due to year update in:
https://github.com/fwts/fwts/commit/b6bd85fc8da14c1279de186eb12b7e58ecf7812d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9085579766
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 0e913b3ae8..97b13b3db0 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  09dde69c6cd8e33177c37e06a9763f7d78271ad40e92f266157b739cfac8d185  fwts-V24.11.00.tar.gz
+sha256  c8bbf62f4bd80f17bb768bab3863ee93e195b2047d10637a3d03fe2086291bd7  fwts-V25.01.00.tar.gz
 
 # Hash for license file
-sha256  3cd2c5d12f024ff2aa203e37d7e972c4d5ab7bf1a65e3e09aebccf71e64b525b  debian/copyright
+sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index fded1e696b..410ce063aa 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 24.11.00
+FWTS_VERSION = 25.01.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
