Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23BDCF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 12:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE29B40CA6;
	Tue, 24 Sep 2024 12:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVqgv81eJlua; Tue, 24 Sep 2024 12:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66ABD40DF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66ABD40DF8;
	Tue, 24 Sep 2024 12:24:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9F01BF378
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BB7860676
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 12:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5BZqukyl8xW for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 12:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 364356067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 364356067C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 364356067C
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:24:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4427F1C0007;
 Tue, 24 Sep 2024 12:24:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1st4aT-004inK-2d;
 Tue, 24 Sep 2024 14:24:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 14:23:57 +0200
Message-Id: <20240924122406.1125261-14-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240924122406.1125261-1-peter@korsgaard.com>
References: <20240924122406.1125261-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 14/22] package/slirp: fix typos in help text
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slirp/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp/Config.in b/package/slirp/Config.in
index 38fd5277af..57058dcd3b 100644
--- a/package/slirp/Config.in
+++ b/package/slirp/Config.in
@@ -12,8 +12,8 @@ config BR2_PACKAGE_SLIRP
 
 	  NOTE:
 	  This package has some history of a unique kind:
-	    - originally developped as 'slirp' by Danny Gasparovski, and
-	      seemingly abandonned (developper /disapeared/)
+	    - originally developed as 'slirp' by Danny Gasparovski, and
+	      seemingly abandoned (developer /disappeared/)
 	    - then re-maintained at sourceforge by "Kelly", up to some
 	      time around 2009: http://slirp.sourceforge.net/
 	    - during that period, QEMU (Fabrice BELLARD) forked the code
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
