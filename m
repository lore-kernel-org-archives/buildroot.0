Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77625EED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D14D80D96;
	Thu,  1 Jan 2026 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYE6MzLG-4mE; Thu,  1 Jan 2026 17:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5798980DB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767289902;
	bh=x1rb7R7YlWsd3v25jgBkSh9b6l0drfr4WUetDTNFD/c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=stlUosxfLs8CHoTZhTJJlyTJb299X9lUn+ryLxc2CJHE6oyW+KKRpnYdQDsi0eqgF
	 vgwhAeHt6fTbjmbqYUBdyzV4gy39yfqzwpypzCdR4E1AkdkM81cvAW9lIiniYnFaDP
	 yaraDZyRm0BDvuXdUio0myToQAuL0qcvAqm1UDY24vJbIGo0jawE95ukaafBK0Apfr
	 JTopONRrnMUdQJh0ReLscHBuubxhl4pgndj1e6UjRMLnQtqPjEZpImgWgW68MyuF/L
	 gFROkIevCKh9dOJyR+RAvFlO09BXASmXQ4B45rXC5eLnFwLZNTWt4gjFMBIRwYmuIe
	 OQA2089Pw7Nwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5798980DB9;
	Thu,  1 Jan 2026 17:51:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B1EB206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 518CB80DB9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PvpdtC1C4l2 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895AE80D96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 895AE80D96
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F84987E70; Thu,  1 Jan 2026 17:51:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 18:51:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 802392055a950defdcc2c63161ae59556c8edf58
X-Git-Newrev: f4befa9ff66bcdef2de9e765dd330a6bb87bd61b
X-Patchwork-Hint: ignore
Message-Id: <20260101175140.7F84987E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: bump to 0.20.00
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4befa9ff66bcdef2de9e765dd330a6bb87bd61b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed unnecessary patch after merge of
https://github.com/ColinIanKing/stress-ng/commit/05353c7a9d0439e250f82ef9fc5643149811bb24

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.20.00

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-stress-pthread-fix-non-NPTL-build.patch   | 42 ----------------------
 package/stress-ng/stress-ng.hash                   |  2 +-
 package/stress-ng/stress-ng.mk                     |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch b/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch
deleted file mode 100644
index 518296fdc4..0000000000
--- a/package/stress-ng/0001-stress-pthread-fix-non-NPTL-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 73d1f5ed2167fca8a1cbfb85f4da123f00e524a1 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 30 Nov 2025 11:36:10 +0100
-Subject: [PATCH] stress-pthread: fix non-NPTL build
-
-https://github.com/ColinIanKing/stress-ng/commit/15b26e33daaf36acd5eeceaaf6fc954f46792a8b
-added the usage of attr without using HAVE_PTHREAD_ATTR_SETSTACK for
-toolchains without NPTL support.
-
-This patch fixes build errors detected by buildroot autobuilders:
-https://autobuild.buildroot.net/results/d4f/d4fadef213455b1776d93e30e51ffe09fb1879c5/build-end.log
-
-stress-pthread.c: In function 'stress_pthread':
-stress-pthread.c:567:81: error: 'attr' undeclared (first use in this function)
-  567 |                         pthreads[i].ret = pthread_create(&pthreads[i].pthread, &attr,
-
-Upstream: https://github.com/ColinIanKing/stress-ng/pull/593
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- stress-pthread.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/stress-pthread.c b/stress-pthread.c
-index aafcf0f0a..8605b7a1d 100644
---- a/stress-pthread.c
-+++ b/stress-pthread.c
-@@ -564,7 +564,11 @@ static int stress_pthread(stress_args_t *args)
- 
- 			pthreads[i].t_create = stress_time_now();
- 			pthreads[i].t_run = pthreads[i].t_create;
-+#if defined(HAVE_PTHREAD_ATTR_SETSTACK)
- 			pthreads[i].ret = pthread_create(&pthreads[i].pthread, &attr,
-+#else
-+			pthreads[i].ret = pthread_create(&pthreads[i].pthread, NULL,
-+#endif
- 				stress_pthread_func, (void *)&pargs);
- 			if (UNLIKELY(pthreads[i].ret)) {
- 				/* Out of resources, don't try any more */
--- 
-2.47.3
-
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index dbe5f60a25..f91aa76054 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  054953145d7de36725a54636ea68975bb9ada06b4769878d25e556fab5804513  stress-ng-0.19.06.tar.gz
+sha256  fe9e5161ac186c6ada22963251ff701fe3275fac2c5b87bdb59c4cab08aaeaae  stress-ng-0.20.00.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 7240e3e321..32ac21b540 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.19.06
+STRESS_NG_VERSION = 0.20.00
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
