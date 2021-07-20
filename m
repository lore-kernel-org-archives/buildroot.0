Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC1DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B9F60EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85B9F60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E2860AD4;
	Wed,  4 Aug 2021 00:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEs9l-ZUEhPf; Wed,  4 Aug 2021 00:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC16C60B2D;
	Wed,  4 Aug 2021 00:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5C81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A96F040FA2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hexUoqCbZStd for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10B5F4048C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A5ED81469; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:45:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7b68ebd2bc171fed054d4dfc550c48fe1712735
X-Git-Newrev: c4bb10b45a20cb183980f5d7cc8b93fd35c498d9
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.5A5ED81469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kismet: fix build on
 sparc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c4bb10b45a20cb183980f5d7cc8b93fd35c498d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure on sparc which is raised since bump to
version 2021-06-R1 in commit 5e3a1e6c7cc3e42b222ecbe30b9afaaa9d6b1c33

Fixes:
 - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-nrf_51822.h-fix-build-on-sparc.patch      | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
new file mode 100644
index 0000000000..c675654721
--- /dev/null
+++ b/package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch
@@ -0,0 +1,59 @@
+From b347fea1a5ba0f66bf15e7de56d748e0f0dd624a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 20 Jul 2021 22:27:45 +0200
+Subject: [PATCH] nrf_51822.h: fix build on sparc
+
+apple is not the only target that miss some defines, for example build
+fails on sparc with:
+
+capture_nrf_51822.c: In function 'get_baud':
+capture_nrf_51822.c:80:16: error: 'B2500000' undeclared (first use in this function); did you mean 'B2000000'?
+   80 |         return B2500000;
+      |                ^~~~~~~~
+      |                B2000000
+capture_nrf_51822.c:80:16: note: each undeclared identifier is reported only once for each function it appears in
+capture_nrf_51822.c:82:16: error: 'B3000000' undeclared (first use in this function); did you mean 'B2000000'?
+   82 |         return B3000000;
+      |                ^~~~~~~~
+      |                B2000000
+capture_nrf_51822.c:84:16: error: 'B3500000' undeclared (first use in this function); did you mean 'B500000'?
+   84 |         return B3500000;
+      |                ^~~~~~~~
+      |                B500000
+capture_nrf_51822.c:86:16: error: 'B4000000' undeclared (first use in this function); did you mean 'B2000000'?
+   86 |         return B4000000;
+      |                ^~~~~~~~
+      |                B2000000
+
+Fixes:
+ - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kismetwireless/kismet/pull/388]
+---
+ capture_nrf_51822/nrf_51822.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/capture_nrf_51822/nrf_51822.h b/capture_nrf_51822/nrf_51822.h
+index cf7fee1e..d9203f61 100644
+--- a/capture_nrf_51822/nrf_51822.h
++++ b/capture_nrf_51822/nrf_51822.h
+@@ -3,7 +3,6 @@
+ #ifndef __NRF51822_H__
+ #define __NRF51822_H__
+ 
+-#ifdef __APPLE__
+ #ifndef B9600
+ #define B9600 9600
+ #endif
+@@ -58,7 +57,6 @@
+ #ifndef B4000000
+ #define B4000000 4000000
+ #endif
+-#endif
+ 
+ 
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
