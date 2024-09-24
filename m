Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC1DCF9C6F
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 12:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 630A340F86;
	Tue, 24 Sep 2024 12:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHEWNOWGP4p3; Tue, 24 Sep 2024 12:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6802F40F96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6802F40F96;
	Tue, 24 Sep 2024 12:25:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ABBD1BF378
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19FFD40BE1
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZ3pkRlp2CNr for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 12:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAB9740C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB9740C56
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB9740C56
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:24:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 018BA6000A;
 Tue, 24 Sep 2024 12:24:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1st4aX-004isl-1X;
 Tue, 24 Sep 2024 14:24:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 14:24:04 +0200
Message-Id: <20240924122406.1125261-21-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240924122406.1125261-1-peter@korsgaard.com>
References: <20240924122406.1125261-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 21/22] package/sysklogd: fix 'structured' typo
 in help text
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index c9b9fe8c35..1dffacb08e 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_SYSKLOGD_LOGGER
 
 	  This version of logger is receommended for use with sysklogd.
 	  It makes use of the new syslogp() API for RFC5424 style logs,
-	  e.g. MSGID, strucutred data (SD), etc.
+	  e.g. MSGID, structured data (SD), etc.
 
 	  The BusyBox, or util-linux, logger tools can also be used, but
 	  are limited to RFC3164 style messages.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
