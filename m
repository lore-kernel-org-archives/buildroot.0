Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE1CDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8519C41283;
	Wed, 18 Sep 2024 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u28EJIzGJMy0; Wed, 18 Sep 2024 20:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B00341295
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B00341295;
	Wed, 18 Sep 2024 20:35:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 898BE1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4972384930
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_JGANzUkQkQ for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A7784959
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A7784959
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7721683BDE; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:30:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b371c827b648be08b33f60949c7138713e4906d8
X-Git-Newrev: e497d9fdc3cc4fc4971dcb0a5c55756ac248befb
X-Patchwork-Hint: ignore
Message-Id: <20240918203458.7721683BDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/cache-calibrator:
 fix build failure for implicit declaration
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

commit: https://git.buildroot.net/buildroot/commit/?id=e497d9fdc3cc4fc4971dcb0a5c55756ac248befb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
 - http://autobuild.buildroot.org/results/db996c894c810ff5c7f4263975d1def0edef6d55

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4cf319c2670e8b5c1a437e504f99558ee90f8ccb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ailure-due-to-getpagesize-implicit-declar.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch b/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
new file mode 100644
index 0000000000..fcad669481
--- /dev/null
+++ b/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
@@ -0,0 +1,33 @@
+From 29c4e0038b212e953cc59ac8b31d4541db758a3d Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 3 Sep 2024 17:43:44 +0200
+Subject: [PATCH] Fix build failure due to getpagesize implicit declaration
+
+The patch fixes the following build error:
+
+calibrator.c: In function 'runCache':
+calibrator.c:267:24: error: implicit declaration of function 'getpagesize' [-Wimplicit-function-declaration]
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: sent to Stefan Manegold Stefan.Manegold@cwi.nl
+---
+ calibrator.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/calibrator.c b/calibrator.c
+index e045dfdcb96b..fd2fadb26020 100644
+--- a/calibrator.c
++++ b/calibrator.c
+@@ -37,9 +37,7 @@
+  * THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-/*
+ #include        <unistd.h>
+-*/
+ #include        <stdlib.h>
+ #include	<stdio.h>
+ #include	<math.h>
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
