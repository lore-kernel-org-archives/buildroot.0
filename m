Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA98C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28E2960A4A;
	Mon,  8 Jul 2024 20:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 342i3SE0VOKD; Mon,  8 Jul 2024 20:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169C160AD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169C160AD4;
	Mon,  8 Jul 2024 20:21:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 116C11BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB692608E0
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQewyRkXhTwp for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBDD560804
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBDD560804
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D788883FF6; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61d67ad32152a54ccbeef70fbecea1ed659e9f87
X-Git-Newrev: 2ef2d436d4ada8c37896efdd199dd1d5066c67e5
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.D788883FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ef2d436d4ada8c37896efdd199dd1d5066c67e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, redis fails to build with output:

    Applying 0002-largefile-conditional-define.patch using patch:
    patching file src/fmacros.h
    Hunk #1 FAILED at 42.
    1 out of 1 hunk FAILED -- saving rejects to file src/fmacros.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Tested-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/redis/0002-largefile-conditional-define.patch | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/redis/0002-largefile-conditional-define.patch b/package/redis/0002-largefile-conditional-define.patch
index 747e0552b3..685a30cc5b 100644
--- a/package/redis/0002-largefile-conditional-define.patch
+++ b/package/redis/0002-largefile-conditional-define.patch
@@ -12,13 +12,15 @@ Avoids:
   <command-line>:0:0: note: this is the location of the previous definition
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: redis-2.6.11/src/fmacros.h
 ===================================================================
 --- redis-2.6.11.orig/src/fmacros.h	2013-03-25 22:09:15.000000000 +0100
 +++ redis-2.6.11/src/fmacros.h	2013-03-25 22:09:40.000000000 +0100
-@@ -42,7 +42,12 @@
- #define _XOPEN_SOURCE
+@@ -55,8 +55,13 @@
+ #define _POSIX_C_SOURCE 199506L
  #endif
  
 +#ifndef _LARGEFILE_SOURCE
@@ -29,4 +31,5 @@ Index: redis-2.6.11/src/fmacros.h
  #define _FILE_OFFSET_BITS 64
 +#endif
  
- #endif
+ /* deprecate unsafe functions
+  *
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
