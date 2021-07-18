Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50594C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0045E60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0045E60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C214D4225A;
	Tue,  3 Aug 2021 23:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQ756IDZrOe9; Tue,  3 Aug 2021 23:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C0842253;
	Tue,  3 Aug 2021 23:47:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02AE41BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C47440F3C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pXG-53LNAeL for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 489E540ECA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A000586AA7; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:24:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5348521f8924447dc5c4038a8d01d242a182651
X-Git-Newrev: f6461f6fc8b1dcd505befa35ab3c2db388fb5461
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.A000586AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libndp: drop patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6461f6fc8b1dcd505befa35ab3c2db388fb5461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch is not needed since bump to version 1.7 in commit
6274f4191335cf8c9b88796f59da8af04e3abf7a and
https://github.com/jpirko/libndp/commit/94e9a082d76414f82794b0c9817d0c24e3868275

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libndp/0001-ndptool.c-Fix-musl-build.patch | 30 ----------------------
 1 file changed, 30 deletions(-)

diff --git a/package/libndp/0001-ndptool.c-Fix-musl-build.patch b/package/libndp/0001-ndptool.c-Fix-musl-build.patch
deleted file mode 100644
index 547598c6ee..0000000000
--- a/package/libndp/0001-ndptool.c-Fix-musl-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 561f80b9a848be923f37bf1afedbecf92da3b2e7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 30 Jan 2016 16:36:39 +0100
-Subject: [PATCH 1/1] ndptool.c: Fix musl build
-
-Fixes a build issue with the musl C library
-http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/build-end.log
-
-Patch sent upstream: https://github.com/jpirko/libndp/pull/7
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- utils/ndptool.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/ndptool.c b/utils/ndptool.c
-index 04ec4e1..c6ef48c 100644
---- a/utils/ndptool.c
-+++ b/utils/ndptool.c
-@@ -27,6 +27,7 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <errno.h>
-+#include <sys/select.h>
- #include <ndp.h>
- 
- enum verbosity_level {
--- 
-2.7.0.rc3
-
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
