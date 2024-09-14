Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C2AC02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 083DF41276;
	Sat, 14 Sep 2024 12:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiLMNjtnxpVb; Sat, 14 Sep 2024 12:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 517D04126B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 517D04126B;
	Sat, 14 Sep 2024 12:44:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 989C61BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8662B405DE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rChkrKT6RxEV for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97800405CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97800405CC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97800405CC
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:43:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E156F40002;
 Sat, 14 Sep 2024 12:43:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spS7v-0052Ln-1m;
 Sat, 14 Sep 2024 14:43:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:43:34 +0200
Message-Id: <20240914124337.1200461-17-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914124337.1200461-1-peter@korsgaard.com>
References: <20240914124337.1200461-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 17/20] package/nginx: fix symmetric typo
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index d3b042c59b..7a5455def7 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -93,7 +93,7 @@ endif
 # - pcre-jit          (want to rebuild pcre)
 
 # Notes:
-# * Feature/module option are *not* symetric.
+# * Feature/module option are *not* symmetric.
 #   If a feature is on by default, only its --without-xxx option exists;
 #   if a feature is off by default, only its --with-xxx option exists.
 # * The configure script fails if unknown options are passed on the command
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
