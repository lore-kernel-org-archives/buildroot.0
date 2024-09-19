Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1079CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF91F41502;
	Thu, 19 Sep 2024 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCdKlFYTRtZl; Thu, 19 Sep 2024 09:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2469E414E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2469E414E9;
	Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4507F1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B4184185
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4QpZkRLjQFm for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCB38477E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BCB38477E
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 690D283C39; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:20 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2cc170a99e30b0f42ea895f9235cdec64df483d2
X-Git-Newrev: 1e6d3f7babbf2975cac2749aa245dfe00576da16
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.690D283C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/collectd: fix
 typos in help text / comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e6d3f7babbf2975cac2749aa245dfe00576da16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a11cb9bdd92da964ce1d5141c21558e6df02808)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
