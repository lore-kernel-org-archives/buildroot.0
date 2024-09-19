Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB85CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A045412F1;
	Thu, 19 Sep 2024 09:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YkKWHAkx7gu; Thu, 19 Sep 2024 09:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B937843339
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B937843339;
	Thu, 19 Sep 2024 09:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18A761BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 994BF849C7
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAzr6Zg5cURI for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F369D849DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F369D849DC
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0E9C83C66; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:44 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e5287283a092c6984a740e643d1ee7ef64ae4671
X-Git-Newrev: 12cb99c950dc53d13739eba47088892532b08077
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.F0E9C83C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/collectd: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=12cb99c950dc53d13739eba47088892532b08077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a11cb9bdd92da964ce1d5141c21558e6df02808)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 6 +++---
 package/collectd/collectd.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index e6d549f81f..f03d5c2777 100644
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
@@ -470,7 +470,7 @@ config BR2_PACKAGE_COLLECTD_PING
 	bool "ping"
 	select BR2_PACKAGE_LIBOPING
 	help
-	  Mesures network latency using ICMP "echo requests".
+	  Measures network latency using ICMP "echo requests".
 
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
@@ -492,7 +492,7 @@ comment "postgresql support can't be built with Optimize for fast"
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
