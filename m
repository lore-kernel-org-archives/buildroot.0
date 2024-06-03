Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5DCC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AFCC40010;
	Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LJh39R6ga1t; Mon,  3 Jun 2024 07:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9504043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB9504043A;
	Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 119461BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0956884287
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ft_MIJthDnJA for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C30DE8420E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30DE8420E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C30DE8420E
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A044C000C;
 Mon,  3 Jun 2024 07:17:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wg-002EaG-0J;
 Mon, 03 Jun 2024 09:17:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:08 +0200
Message-Id: <20240603071726.532652-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 05/23] package/freeradius-server: use https://
 _SITE
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
Cc: David GOUARIN <dgouarin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The tarballs are also available at
https://freeradius.org/ftp/pub/freeradius/, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeradius-server/freeradius-server.hash | 2 +-
 package/freeradius-server/freeradius-server.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index a267bd6f8c..6ee8f7786c 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.2.3.tar.bz2.sig
+# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.3.tar.bz2.sig
 sha256  4a16aeffbfa1424e1f317fdf71d17e5523a4fd9564d87c747a60595ef93c5d1f  freeradius-server-3.2.3.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index c64ae79918..1ec77a1cc4 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -7,7 +7,7 @@
 FREERADIUS_SERVER_VERSION = 3.2.3
 FREERADIUS_SERVER_SOURCE = \
 	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
-FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
+FREERADIUS_SERVER_SITE = https://freeradius.org/ftp/pub/freeradius
 FREERADIUS_SERVER_LICENSE = GPL-2.0
 FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
 FREERADIUS_SERVER_CPE_ID_VENDOR = freeradius
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
