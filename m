Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAF2D3B7DD
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 09:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356DD409D3;
	Mon,  8 Dec 2025 09:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAsSE3CKeW2b; Mon,  8 Dec 2025 09:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BD824099F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765186412;
	bh=0PPl4oa2fj9pLXJF4rFwy+lmYCWreD0f7t0rQOVfMWE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HbKv5uzZMyzFI15XHBw0vnGrG++evJybHRTtiyrkr+da54at7zpL/eddwmJ+jMU9n
	 Fm2q8UB5+3gzlbCUhBmLLVc93suduXbixR+U0/lAWjTh8Fl1MfLDeyCDfm/i/0StPU
	 ka/11xVh0cp7mXA97zBkh8ISqh9cXsav4k3ir8hqu1Wt+vXs502GUim8CyTShDnZAM
	 EvNjAUgaZ0XjmkK1clNY75UqdjKdilcklTf3FmOWhukIoOtOC94T1r34qYn99FXoYV
	 W3OSAFh8J94KDPyQ4a9FB7XZ05Fm25mtW7NHzNO8i1HErdSOS9UIGCzDYCtVEKjbk7
	 n8i97NvyNr0Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD824099F;
	Mon,  8 Dec 2025 09:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA263E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 09:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7983400C7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 09:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSZB10c1DAqe for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 09:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDCF74005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDCF74005C
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 09:33:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBBFD86414; Mon,  8 Dec 2025 09:33:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 10:32:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8745e0d5ca39abbbb664619e1512420c40bcd732
X-Git-Newrev: 6086429850d20ce7fbcaf88ca83504c674992c10
X-Patchwork-Hint: ignore
Message-Id: <20251208093330.CBBFD86414@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptodev-linux: Fix build for
 Linux 6.18
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5053361880661476200=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5053361880661476200==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6086429850d20ce7fbcaf88ca83504c674992c10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c bumped the
linux kernel to version 6.18 which broke the build of cryptodev-linux.

Added upstream patch to fix the problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-build-for-Linux-6.18-rc1.patch        | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/cryptodev-linux/0001-Fix-build-for-Linux-6.18-rc1.patch b/package/cryptodev-linux/0001-Fix-build-for-Linux-6.18-rc1.patch
new file mode 100644
index 0000000000..fef5af4099
--- /dev/null
+++ b/package/cryptodev-linux/0001-Fix-build-for-Linux-6.18-rc1.patch
@@ -0,0 +1,55 @@
+From 08644db02d43478f802755903212f5ee506af73b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Joan=20Bruguera=20Mic=C3=B3?= <joanbrugueram@gmail.com>
+Date: Sat, 6 Sep 2025 20:36:38 +0000
+Subject: [PATCH] Fix build for Linux 6.18-rc1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It's no longer required to use nth_page() when iterating pages within a
+single scatterlist entry.
+
+Note I believe this code path in `sg_advance` is currently unreachable:
+It is only called from `get_userbuf_srtp`, passing in a scatterlist
+copied from one created by `__get_userbuf`, which only generates
+entries such that `sg->offset + sg->length <= PAGE_SIZE`.
+On the other hand, this code path in `sg_advance` requires that
+`sg->offset + sg->length > sg->offset + consumed >= PAGE_SIZE`.
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f8f03eb5f0f91fddc9bb8563c7e82bd7d3ba1dd0
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ce00897b94bc5c62fab962625efcf1ab824d3688
+
+Signed-off-by: Joan Bruguera Micó <joanbrugueram@gmail.com>
+
+Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/08644db02d43478f802755903212f5ee506af73b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ util.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/util.c b/util.c
+index 9eba4836..d4267816 100644
+--- a/util.c
++++ b/util.c
+@@ -21,6 +21,7 @@
+ 
+ #include <crypto/scatterwalk.h>
+ #include <linux/scatterlist.h>
++#include <linux/version.h>
+ #include "util.h"
+ 
+ /* These were taken from Maxim Levitsky's patch to lkml.
+@@ -44,8 +45,12 @@ struct scatterlist *sg_advance(struct scatterlist *sg, int consumed)
+ 	sg->length -= consumed;
+ 
+ 	if (sg->offset >= PAGE_SIZE) {
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 18, 0))
++		struct page *page = sg_page(sg) + (sg->offset / PAGE_SIZE);
++#else
+ 		struct page *page =
+ 			nth_page(sg_page(sg), sg->offset / PAGE_SIZE);
++#endif
+ 		sg_set_page(sg, page, sg->length, sg->offset % PAGE_SIZE);
+ 	}
+ 

--===============5053361880661476200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5053361880661476200==--
