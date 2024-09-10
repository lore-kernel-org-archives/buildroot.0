Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53386EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D2B60B4F;
	Tue, 10 Sep 2024 20:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QRPuqxPzLQo; Tue, 10 Sep 2024 20:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 413E760B54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 413E760B54;
	Tue, 10 Sep 2024 20:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB0C1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D39540926
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ypE5F8LYnF6 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29A8F40947
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29A8F40947
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2609286F5F; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e6d5e49fe49192777f90116fbc8d0a125165eaa
X-Git-Newrev: 9a11cb9bdd92da964ce1d5141c21558e6df02808
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.2609286F5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectd: fix typos in help text /
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a11cb9bdd92da964ce1d5141c21558e6df02808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
