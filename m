Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E19ECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FFE540A7A;
	Tue, 10 Sep 2024 07:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bKKJN8wz2yP; Tue, 10 Sep 2024 07:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8540406BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8540406BF;
	Tue, 10 Sep 2024 07:09:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16CC51BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F2B40577
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdWEAO8ANMAt for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62CA440553
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62CA440553
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62CA440553
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FB081C0008;
 Tue, 10 Sep 2024 07:08:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzU-00HS2T-0M;
 Tue, 10 Sep 2024 09:08:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:00 +0200
Message-Id: <20240910070823.4158894-21-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 20/42] package/dcron: fix opening typo
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
Cc: "Alvaro G. M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-main.c-add-newline-to-logfile-openning-error-message.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
index 6abc3105e4..fe0a33d1af 100644
--- a/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
+++ b/package/dcron/0001-main.c-add-newline-to-logfile-openning-error-message.patch
@@ -1,7 +1,7 @@
 From 2710bc67cd920323da9b23a3d60193577bd43d71 Mon Sep 17 00:00:00 2001
 From: Carlos Santos <unixmania@gmail.com>
 Date: Sat, 20 Jul 2019 00:27:31 -0300
-Subject: [PATCH] main.c: add newline to logfile openning error message
+Subject: [PATCH] main.c: add newline to logfile opening error message
 
 Signed-off-by: Carlos Santos <unixmania@gmail.com>
 [Upstream status: https://github.com/dubiousjim/dcron/pull/22]
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
