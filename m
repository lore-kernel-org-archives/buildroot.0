Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F0CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 06:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8491F404A9;
	Wed,  8 Jun 2022 06:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0m2LhO3rBPs; Wed,  8 Jun 2022 06:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B218340B51;
	Wed,  8 Jun 2022 06:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1791BF3BE
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 06:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16B40418DD
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 06:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MISuw0zNw3sA for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 06:49:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A29E408EA
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 06:49:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D27A086E03; Wed,  8 Jun 2022 06:37:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jun 2022 08:48:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f657ed3b3e7dc64f879c0818ca9b191ab3415182
X-Git-Newrev: 749ec74cf9007cf8853426bf8b993f14a0bda5d8
X-Patchwork-Hint: ignore
Message-Id: <20220608063735.D27A086E03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: drop patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=749ec74cf9007cf8853426bf8b993f14a0bda5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As part of the merge of the next branch into master after the 2022.05
release, the patch 0001-src-verify_hash.c-include-inttypes.h.patch
should have been dropped, as it is part of the rauc 1.7 release. This
commit drops this patch to fix the build of rauc.

Fixes:

  http://autobuild.buildroot.net/results/813776daa670ea3ff3284ee786ef16dd30a569ab/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-src-verify_hash.c-include-inttypes.h.patch | 38 ----------------------
 1 file changed, 38 deletions(-)

diff --git a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch b/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
deleted file mode 100644
index 916c8cca0b..0000000000
--- a/package/rauc/0001-src-verify_hash.c-include-inttypes.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b19a9c26d88a913417e77aaf60c72cdbf393d1f6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 31 May 2022 21:22:36 +0200
-Subject: [PATCH] src/verify_hash.c: include inttypes.h
-
-Include inttypes.h to avoid the following build failure:
-
-In file included from /nvmedata/autobuild/instance-22/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:62,
-                 from src/verity_hash.c:26:
-src/verity_hash.c: In function 'verify_zero':
-src/verity_hash.c:69:55: error: expected ')' before 'PRIu64'
-   69 |    g_message("Spare area is not zeroed at position %" PRIu64 ".",
-      |                                                       ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1a093c0e194a061836884419d2f50506105db01e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rauc/rauc/pull/914]
----
- src/verity_hash.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/verity_hash.c b/src/verity_hash.c
-index db82a78..3b2c2a0 100644
---- a/src/verity_hash.c
-+++ b/src/verity_hash.c
-@@ -19,6 +19,7 @@
-  */
- 
- #include <errno.h>
-+#include <inttypes.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.35.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
