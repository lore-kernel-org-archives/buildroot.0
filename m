Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623CAECE58B
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28964405CD;
	Tue, 10 Sep 2024 07:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtDeU3e5UjFe; Tue, 10 Sep 2024 07:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E5740947
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E5740947;
	Tue, 10 Sep 2024 07:09:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4879A1BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36167405C6
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpP10yrqR4Ho for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 258DD40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 258DD40399
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 258DD40399
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9B258C3761
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5902BFF809;
 Tue, 10 Sep 2024 07:08:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzQ-00HRyq-2z;
 Tue, 10 Sep 2024 09:08:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:07:55 +0200
Message-Id: <20240910070823.4158894-16-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 15/42] package/bcusdk: fix definition typo
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
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...002-eibd-fix-endless-recursion-when-using-USB-backends.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
index 3b90289c88..c31f0c0c8c 100644
--- a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
+++ b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] eibd: drop local clock_gettime in USB backends
 clock_gettime is defined locally, and calls pth_int_time, which
 in turn calls clock_gettime.
 The USB backend shouldn't overrule clock_gettime in the first place.
-This patch fixes this endless recursion by removing the local defition.
+This patch fixes this endless recursion by removing the local definition.
 
 Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 ---
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
