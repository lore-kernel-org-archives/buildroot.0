Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE57C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10B274049D;
	Thu, 11 Jul 2024 09:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpmAfmvce1NT; Thu, 11 Jul 2024 09:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6AEC405CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6AEC405CF;
	Thu, 11 Jul 2024 09:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1441BF574
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05B16405CF
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNiWput6k3n1 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A2C54049D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2C54049D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A2C54049D
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:52:19 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D749B3536257; Thu, 11 Jul 2024 11:52:17 +0200 (CEST)
Date: Thu, 11 Jul 2024 11:52:17 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zo+rUe629arAZsdA@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1720691537; bh=iCR5PEMx24O0itu50MA4M4aHJ5wEopluOzBC1sjz6JA=;
 h=Date:From:To:Subject:From;
 b=sf1Sbfd5PsJM40byMHeAAjzprNGL1xM9JTOIoPIfZaWseH4KgbjG/AWIxM9ziI9zD
 001KMjlLW0SodWcqgVGVn++G42DGDok0Mcw7B8L2hh+J6UUARfYUqk7uXEtkbiAJDN
 +5AAo79YkbPMexQxRWPRqp79YyLgdhqpRok2SB+ofU1PGR9uj40UZxFg/10GDEQHzq
 QEKPirgP2ATQDlEAVMazurvC8Dsrx/y5fip4f5iFc8p9pGbJnR7qydjiN/9/zy9YO4
 K5XU3XQbDeQBiV2DoMuWC2gMHzgQc/AOoO2bQuERmnIUazKOQktFoyXsnLz2TP2hza
 B/EZ46qVw969A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=sf1Sbfd5
Subject: [Buildroot] [PATCH] package/asterisk: update to 20.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a ChangeLog:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md

Patch 0005 is applied upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...es-stasis-control.c-include-signal.h.patch | 43 -------------------
 package/asterisk/asterisk.hash                |  2 +-
 package/asterisk/asterisk.mk                  |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/asterisk/0005-res-stasis-control.c-include-signal.h.patch

diff --git a/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch b/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
deleted file mode 100644
index fc615c4a19..0000000000
--- a/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8391dc3891337ecff8becefe1927a30d3922b848 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 1 May 2024 16:50:50 +0200
-Subject: [PATCH] res/stasis/control.c: include signal.h
-
-Include signal.h to avoid the following build failure with uclibc-ng
-raised since
-https://github.com/asterisk/asterisk/commit/2694792e13c7f3ab1911c4a69fba0df32c544177:
-
-stasis/control.c: In function 'exec_command_on_condition':
-stasis/control.c:313:3: warning: implicit declaration of function 'pthread_kill'; did you mean 'pthread_yield'? [-Wimplicit-function-declaration]
-  313 |   pthread_kill(control->control_thread, SIGURG);
-      |   ^~~~~~~~~~~~
-      |   pthread_yield
-stasis/control.c:313:41: error: 'SIGURG' undeclared (first use in this function)
-  313 |   pthread_kill(control->control_thread, SIGURG);
-      |                                         ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/asterisk/asterisk/pull/728
----
- res/stasis/control.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/res/stasis/control.c b/res/stasis/control.c
-index 360f20790..4ed0e2af1 100644
---- a/res/stasis/control.c
-+++ b/res/stasis/control.c
-@@ -41,6 +41,8 @@
- #include "asterisk/musiconhold.h"
- #include "asterisk/app.h"
- 
-+#include <signal.h>
-+
- AST_LIST_HEAD(app_control_rules, stasis_app_control_rule);
- 
- /*!
--- 
-2.43.0
-
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 8cb5468249..bff34b37bb 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  62adff44f5bc415627e16957e6bd528e1782a892e116ff261c46f96ca87c342b  asterisk-20.7.0.tar.gz
+sha256  bea2978c41d0f69f7197536c35c2d80cbfdf7db826f48c0741b6f66462981d2f  asterisk-20.8.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index be27509441..3d41285c78 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.7.0
+ASTERISK_VERSION = 20.8.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
