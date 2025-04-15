Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38414C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38BE40DCA;
	Tue, 15 Apr 2025 20:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUAwVViCcGVF; Tue, 15 Apr 2025 20:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE7240E4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE7240E4D;
	Tue, 15 Apr 2025 20:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 541AC108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45CF34027F
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orsQ7JfmXNbM for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6407940A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6407940A6E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6407940A6E
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:01:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6A00943185;
 Tue, 15 Apr 2025 20:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Apr 2025 22:01:16 +0200
Message-ID: <20250415200117.2207610-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744747278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4b0kKGS1QqVPjzElDCCp8WaAGSv+73bcFMJnBKef3go=;
 b=U8q7JKpFP8MiGYYVoS+7ku9a2hN4AkOlJ31M/ZqKSsv9yewpXE3JiG+GJszATKW1qQtEKP
 SicqkDFVptZbnWvkjsqawW+kKCqvMkFsysfWdyIrgl0VB3vyOs599WzliqhgWO0tq8AnU/
 Ag3cXmkv3D8PLCFjXcLlE+cW+0CiJCGv5leXA4fjUly5cViQM8LJugk5mRe2/DrQf3WURg
 AtU92zZbx5YdlFGK7fO6/d79UJgwyYxGwwaRqzJ5HCNZ3CkiKRPtHF17oI1JXuj9vaMjol
 xhs6PHNjdBnjazz+MTv+zjn9AA4qZ50yyCXMpXQBvJXZAsb4HPKDuOZOZVOkPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U8q7JKpF
Subject: [Buildroot] [PATCH] package/c-periphery: bump to version 2.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

* v2.4.3 - 02/28/2025
    * Fix memory safety with some older `strerror_r()` implementations in error
      formatters for all modules.
    * Build
        * Fix character device GPIO support tests in Makefile for alternate
          shells and older versions of make.
        * Fix cross-compilation in Makefile from Windows.
        * Fix CMake minimum required version.
        * Add CMake package generation.
    * Contributors
        * Ryan Barnett, @rjbarnet - ec31b39
        * javalikescript, @javalikescript - 024a25d
        * HopeCollector, @HopeCollector - aca6815, b5e53e6

The hash of the license file has changed due to a copyright year
change:

- Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
+ Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-periphery/c-periphery.hash | 4 ++--
 package/c-periphery/c-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index f8f0654b4f..1914ad2255 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  24327bc2a22588444b2576fa1c9560619f6faad986c236c54f4b3f36b20dad56  c-periphery-2.4.2.tar.gz
-sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  LICENSE
+sha256  367b263a14f80eac19c738de56b4a730a4b5e40e05586479a9515612eaabaff3  c-periphery-2.4.3.tar.gz
+sha256  fd3377c82df42bd00d8ac9c25d22dc63f80b7a491b84f2ba82d2a7621432c511  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index e3745c4af6..38f1fa9fc6 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.4.2
+C_PERIPHERY_VERSION = 2.4.3
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
