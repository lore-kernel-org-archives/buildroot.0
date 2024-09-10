Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC15ECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 599BE4197F;
	Tue, 10 Sep 2024 07:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIxH2UFqYG-2; Tue, 10 Sep 2024 07:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7F84135A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7F84135A;
	Tue, 10 Sep 2024 07:10:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC791BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BABEC4099B
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQaEa1Auzt6e for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8593B40976
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8593B40976
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8593B40976
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:09:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 390024000F;
 Tue, 10 Sep 2024 07:08:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzg-00HS5b-2M;
 Tue, 10 Sep 2024 09:08:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:21 +0200
Message-Id: <20240910070823.4158894-42-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 41/42] package/heirloom-mailx: fix attachments
 typo in help text
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heirloom-mailx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index c5b0bcbea7..ed2a519436 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
 	  importantly on embedded systems, as a mail composition
 	  program and SMTP client, in order to send e-mail from shell
 	  scripts. It supports SMTP authentication (login, plain,
-	  cram-md5), SMTPS, MIME encoding of attachements, and more.
+	  cram-md5), SMTPS, MIME encoding of attachments, and more.
 
 	  http://heirloom.sourceforge.net/mailx.html
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
