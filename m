Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB4BE8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A5280CCA;
	Fri, 26 Dec 2025 12:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNuKZ8kpqcqk; Fri, 26 Dec 2025 12:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDCDC80BA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766753148;
	bh=/kN0Y+dxT/qMB1JOPq8bteRURMD/jwzuITnxhVnAeVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kPjLVoRWQl370d5LSnHvC1aXfoXfm83h9HlXt+TY1ZpIjXu65Mvi4Fgj1BZEz6mGC
	 RjIwauhkl5EtHQ0qIjvI99JVRia4+DVA6/vAyXGSpnWlDSZVrFdaYMm8VY2fuThBXJ
	 /Syd+DlgE7px58trs7bSeDHIV7UZ8zkoaAOmNUEVkIKvvn86mjj6DUVioP/ypnsRf+
	 qwE7bKiDjn1ymvzd/MQo7tPK06zDba/BAnKjHT7pvsePEReDSOJElKQROeV5QaSuc5
	 Fia90YOQEgA0zPWxD8/zf0ImutcnDmjGluZXBNmz3flH2wwx/cUScH6+OpnTxywglM
	 tWp8O0NtIhTzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDCDC80BA2;
	Fri, 26 Dec 2025 12:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E584EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1621C40512
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3DL3263lp3U for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 606154025E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 606154025E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D167876E0; Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 13:28:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37c2152ec0676fed293ce9e10bd3071fff6c9df8
X-Git-Newrev: 996613364a3548df27b1446794fc526168df4800
X-Patchwork-Hint: ignore
Message-Id: <20251226124546.5D167876E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dump1090: bump version to 10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=996613364a3548df27b1446794fc526168df4800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now upstreamed patch 0001:
https://github.com/flightaware/dump1090/commit/84d68c628508360c47aa47691ec9d98dc6026ed5

And rename remaining patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...patch => 0001-Fix-compilation-with-GCC15.patch} |  0
 .../0001-swap-size-arguments-to-calloc.patch       | 43 ----------------------
 package/dump1090/dump1090.hash                     |  2 +-
 package/dump1090/dump1090.mk                       |  2 +-
 4 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/dump1090/0002-Fix-compilation-with-GCC15.patch b/package/dump1090/0001-Fix-compilation-with-GCC15.patch
similarity index 100%
rename from package/dump1090/0002-Fix-compilation-with-GCC15.patch
rename to package/dump1090/0001-Fix-compilation-with-GCC15.patch
diff --git a/package/dump1090/0001-swap-size-arguments-to-calloc.patch b/package/dump1090/0001-swap-size-arguments-to-calloc.patch
deleted file mode 100644
index 1c2d502793..0000000000
--- a/package/dump1090/0001-swap-size-arguments-to-calloc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From be8f5b7ab1223076ba0086f14aeeb53ace2d4b5c Mon Sep 17 00:00:00 2001
-From: Jeff Lawson <jeff.lawson@flightaware.com>
-Date: Tue, 18 Jun 2024 15:58:24 +0000
-Subject: [PATCH] swap size arguments to calloc
-
-fixes #241
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://github.com/flightaware/dump1090/pull/243
----
- adaptive.c | 2 +-
- net_io.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/adaptive.c b/adaptive.c
-index f16e16c..d656433 100644
---- a/adaptive.c
-+++ b/adaptive.c
-@@ -195,7 +195,7 @@ void adaptive_init()
-     adaptive_burst_window_remaining = adaptive_samples_per_window;
-     adaptive_burst_window_counter = 0;
- 
--    adaptive_range_radix = calloc(sizeof(unsigned), 65536);
-+    adaptive_range_radix = calloc(65536, sizeof(unsigned));
-     adaptive_range_state = RANGE_RESCAN_UP;
- 
-     // select and enforce gain limits
-diff --git a/net_io.c b/net_io.c
-index bf98028..8abd510 100644
---- a/net_io.c
-+++ b/net_io.c
-@@ -104,7 +104,7 @@ struct net_service *serviceInit(const char *descr, struct net_writer *writer, he
- {
-     struct net_service *service;
- 
--    if (!(service = calloc(sizeof(*service), 1))) {
-+    if (!(service = calloc(1, sizeof(*service)))) {
-         fprintf(stderr, "Out of memory allocating service %s\n", descr);
-         exit(1);
-     }
--- 
-2.39.2
-
diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index a493e76560..0683e6ef62 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6190622c3625713ec9cff882a9d6f6a51b6d2f83ef20e6e1905a3902c7b08483  dump1090-9.0.tar.gz
+sha256  1135588ea8f3d045601e8ab45702648e339168eee0792b2c4f62fae3d2cc9f3b  dump1090-10.2.tar.gz
 sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index e06babb082..1ecdfca47f 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = 9.0
+DUMP1090_VERSION = 10.2
 DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
 DUMP1090_LICENSE = GPL-2.0+
 DUMP1090_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
