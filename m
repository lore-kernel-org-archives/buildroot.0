Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6299BECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E5140B36;
	Tue, 10 Sep 2024 07:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WoQFyg7GkPV; Tue, 10 Sep 2024 07:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00C9240BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C9240BA7;
	Tue, 10 Sep 2024 07:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8351BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615D440570
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id br4eQjQsuSyw for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CACE44050B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CACE44050B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CACE44050B
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DC7D1C0004;
 Tue, 10 Sep 2024 07:08:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzT-00HS2J-1i;
 Tue, 10 Sep 2024 09:08:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:07:59 +0200
Message-Id: <20240910070823.4158894-20-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 19/42] package/collectd: fix typos in help text
 / comment
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 6 +++---
 package/collectd/collectd.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5f39507cff..39c0d352e5 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -288,7 +288,7 @@ config BR2_PACKAGE_COLLECTD_GPS
 	bool "gps"
 	select BR2_PACKAGE_GPSD
 	help
-	  Reports the number of sattelites seen by and precision
+	  Reports the number of satellites seen by and precision
 	  of a GPS receiver.
 
 config BR2_PACKAGE_COLLECTD_HUGEPAGES
@@ -471,7 +471,7 @@ config BR2_PACKAGE_COLLECTD_PING
 	bool "ping"
 	select BR2_PACKAGE_LIBOPING
 	help
-	  Mesures network latency using ICMP "echo requests".
+	  Measures network latency using ICMP "echo requests".
 
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
@@ -493,7 +493,7 @@ comment "postgresql support can't be built with Optimize for fast"
 config BR2_PACKAGE_COLLECTD_PROCESSES
 	bool "processes"
 	help
-	  Collects the number of processes gruped by state.
+	  Collects the number of processes grouped by state.
 
 config BR2_PACKAGE_COLLECTD_PROTOCOLS
 	bool "protocols"
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index b47b2efaba..7bfe556e90 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -38,7 +38,7 @@ endif
 COLLECTD_CONF_ENV += CFLAGS="$(COLLECTD_CFLAGS)"
 
 #
-# NOTE: There's also a third availible setting "intswap", which might
+# NOTE: There's also a third available setting "intswap", which might
 # be needed on some old ARM hardware (see [2]), but is not being
 # accounted for as per discussion [1]
 #
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
