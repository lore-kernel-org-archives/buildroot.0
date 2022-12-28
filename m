Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFE6C4167B
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 18:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3AAA80BC5;
	Wed, 28 Dec 2022 18:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3AAA80BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWZY9NrdC1nO; Wed, 28 Dec 2022 18:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0AA180BCB;
	Wed, 28 Dec 2022 18:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0AA180BCB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0FD1BF40A
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 399D080BCB
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399D080BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3WI-qj6MvtJ for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 18:11:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA4C180BC5
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA4C180BC5
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 18:11:54 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout10.t-online.de (Postfix) with SMTP id A8BFD13768;
 Wed, 28 Dec 2022 19:11:51 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAau6-1TtuPR0; Wed, 28 Dec 2022 19:11:50 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46150)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAau5-0000Jo-37;
 Wed, 28 Dec 2022 19:11:50 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 19:11:49 +0100
Message-Id: <20221228181149.2433577-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672251110-EFFF4A26-6608F156/0/0 CLEAN NORMAL
X-TOI-MSGID: 865ce5b5-2ab2-4430-b411-2e0eb264c991
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix build with updated
 jitterentropy-library
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a8807ddbe2 bumped package jitterentropy-library to version 3.4.1
which broke building rng-tools.

Add two upstream patches which improve jitterentropy-library detection.

Fixes:
http://autobuild.buildroot.net/results/a6f/a6f1381b3d1aa2a27412286167f5c8be5f6fdaf8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ropy-detection-to-look-for-the-setti.patch | 30 ++++++++++++++
 ...ropy-library-to-timeout-fail-on-long.patch | 39 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
 create mode 100644 package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch

diff --git a/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch b/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
new file mode 100644
index 0000000000..553842640d
--- /dev/null
+++ b/package/rng-tools/0002-Adjust-jitterentropy-detection-to-look-for-the-setti.patch
@@ -0,0 +1,30 @@
+From e2698477e8abf623c18ab28d33cc894ec882a706 Mon Sep 17 00:00:00 2001
+From: Neil Horman <neil.horman@privafy.com>
+Date: Fri, 18 Mar 2022 18:59:52 -0400
+Subject: [PATCH] Adjust jitterentropy detection to look for the settick
+ function
+
+Theres no great way to detect if jitterentropy has the internal timer
+feature enabled so we have to look for a function that is only defined
+when it is enabled
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://github.com/nhorman/rng-tools/commit/e2698477e8abf623c18ab28d33cc894ec882a706]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e16e1a0..0f5a38e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -94,7 +94,7 @@ AS_IF(
+ 		AC_SEARCH_LIBS(jent_version,jitterentropy,
+ 				[AM_CONDITIONAL([JITTER], [true])
+ 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
+-				AC_CHECK_LIB(jitterentropy, jent_entropy_switch_notime_impl,
++				AC_CHECK_LIB(jitterentropy, jent_notime_settick,
+ 				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
+ 				[],-lpthread)],
+ 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
diff --git a/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch b/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
new file mode 100644
index 0000000000..9d8dbe2d0b
--- /dev/null
+++ b/package/rng-tools/0003-Adjust-jitterentropy-library-to-timeout-fail-on-long.patch
@@ -0,0 +1,39 @@
+From c29424f10a0dcbd18ac25607fa1c81c18a960e81 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Mon, 16 May 2022 13:38:54 -0400
+Subject: [PATCH] Adjust jitterentropy library to timeout/fail on long delay
+
+[Bernd: removed description of unrelated part of the patch]
+
+Also while we're at it, I might have a build solution for the presence
+of internal timers.  When jitterentropy is built without internal
+timers, jent_notime_init is defined publically, but when it is built
+with timers, its declared as a static symbol, preenting resolution, so
+we can test to see if the function exists.  If it does we _don't_ have
+notime support. The logic is a bit backwards, but i think it works
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded configure.ac patch from upstream commit
+ https://github.com/nhorman/rng-tools/commit/57be6d4c90e78ea9ad036a3a6e9b09822ed4d219]
+---
+ configure.ac  |  6 ++---
+ rngd_jitter.c | 62 ++++++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 49 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 52f2bb5..0af64e7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,9 +101,9 @@ AS_IF(
+ 		AC_SEARCH_LIBS(jent_version,jitterentropy,
+ 				[AM_CONDITIONAL([JITTER], [true])
+ 				AC_DEFINE([HAVE_JITTER],1,[Enable JITTER])
+-				AC_CHECK_LIB(jitterentropy, jent_notime_settick,
+-				[AC_DEFINE([HAVE_JITTER_NOTIME],1,[Enable JITTER_NOTIME])],
+-				[],-lpthread)],
++				AC_CHECK_LIB(jitterentropy, jent_notime_init,
++				[],
++				[AC_DEFINE([HAVE_JITTER_NOTIME],1, [Enable JITTER_NOTIME])],-lpthread)],
+ 				AC_MSG_NOTICE([No Jitterentropy library found]),-lpthread)
+ 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
+ )
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
