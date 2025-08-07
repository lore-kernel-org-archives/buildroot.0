Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B5AC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E27A60674;
	Thu,  7 Aug 2025 17:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xibKT8ShnkyU; Thu,  7 Aug 2025 17:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362F1606A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362F1606A7;
	Thu,  7 Aug 2025 17:20:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 693D34C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEC064009B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUSCFJLGitBe for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD694008E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AD694008E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3918D86FE1; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:36 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 33cc49849d6c9793f5c2c9bdbdcafad8d579bb7d
X-Git-Newrev: 60b8fb63cc523909e1e428cce6fb9598e5497d33
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.3918D86FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/watchdog: do not
 guard shutdown __GLIBC__
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60b8fb63cc523909e1e428cce6fb9598e5497d33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

These headers are provided by uclibc/musl/glibc and bionic so we can
assume they are not needed to be glibc specific includes. This also
ensures that we get proper declaration of reboot() API.

Upstream:
https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/

Fixes:
https://autobuild.buildroot.org/results/3e67d5b3b89d794e3f6c510803368f8b100b07a7/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: reformat Upstream: tag in patch to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ea797e760bc1d30ca5d8db042528bf3d1042a0f9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Do-not-guard-shutdown-__GLIBC__.patch     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
new file mode 100644
index 0000000000..7140888753
--- /dev/null
+++ b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
@@ -0,0 +1,39 @@
+From aa371bf201b1d59c595a1ad7b3464ae544ed142f Mon Sep 17 00:00:00 2001
+From: Paul Crawford <psc@sat.dundee.ac.uk>
+Date: Thu, 16 Mar 2023 11:42:34 +0000
+Subject: [PATCH] Do not guard shutdown __GLIBC__
+
+- Patch by Khem Raj <raj.khem@gmail.com>
+
+- These headers are provided by uclibc/musl/glibc and bionic so we can
+  assume they are not needed to be glibc specific includes. This also
+  ensures that we get proper declaration of reboot() API
+
+Upstream: https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/shutdown.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/shutdown.c b/src/shutdown.c
+index 1d9a857..6aea0d0 100644
+--- a/src/shutdown.c
++++ b/src/shutdown.c
+@@ -29,13 +29,9 @@
+ #include "extern.h"
+ #include "ext2_mnt.h"
+ 
+-#if defined __GLIBC__
+ #include <sys/quota.h>
+ #include <sys/swap.h>
+ #include <sys/reboot.h>
+-#else				/* __GLIBC__ */
+-#include <linux/quota.h>
+-#endif				/* __GLIBC__ */
+ 
+ #include <unistd.h>
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
