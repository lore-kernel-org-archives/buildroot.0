Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0D8C001B0
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 17:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDE104074E;
	Sun, 16 Jul 2023 17:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDE104074E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFvC5u8S5r95; Sun, 16 Jul 2023 17:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD6D440644;
	Sun, 16 Jul 2023 17:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6D440644
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 156911BF955
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD734090F
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 17:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD734090F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhbTpY_UrE-v for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 17:50:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2224408E4
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 17:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2224408E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C129487104; Sun, 16 Jul 2023 17:50:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 19:43:31 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2927ab2135001b9bfb88143c150cc92b809fbb25
X-Git-Newrev: 0a45615f653bb100381e18d48050f848e314f735
X-Patchwork-Hint: ignore
Message-Id: <20230716175050.C129487104@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/haproxy: fix
 build on aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a45615f653bb100381e18d48050f848e314f735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/07c/07ccb8c45c709a4b6ed32aafa33cd04e74174b11/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7fde35212c49f0d6e274cbcb6f3f5c871bf13398)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-atomic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
new file mode 100644
index 0000000000..b3b1f732ab
--- /dev/null
+++ b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
@@ -0,0 +1,36 @@
+From 5ab3c61932af7619518169da744ba6346f060405 Mon Sep 17 00:00:00 2001
+From: Willy Tarreau <w@1wt.eu>
+Date: Thu, 8 Dec 2022 08:32:57 +0100
+Subject: [PATCH] BUILD: atomic: atomic.h may need compiler.h on ARMv8.2-a
+
+We get a build error in ncbuf.c when building for ARMv8.2-a because ncbuf
+has minimal includes and among them bug.h which includes atomic.h. Atomic.h
+may use "forceinline" without including compiler.h, hence the build error.
+It was verified that adding it doesn't inflate the total headers.
+
+Since all other C files include api.h which already covers this, there's
+no real need to bapkport this. The issue was already there in 2.3 though.
+
+Upstream: https://git.haproxy.org/?p=haproxy.git;a=commitdiff;h=5ab3c61932af7619518169da744ba6346f060405#patch1
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/haproxy/atomic.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/haproxy/atomic.h b/include/haproxy/atomic.h
+index f60be95..7e3c826 100644
+--- a/include/haproxy/atomic.h
++++ b/include/haproxy/atomic.h
+@@ -23,6 +23,8 @@
+ #ifndef _HAPROXY_ATOMIC_H
+ #define _HAPROXY_ATOMIC_H
+ 
++#include <haproxy/compiler.h>
++
+ /* A few notes for the macros and functions here:
+  *  - this file is painful to edit, most operations exist in 3 variants,
+  *    no-thread, threads with gcc<4.7, threads with gcc>=4.7. Be careful when
+-- 
+1.7.10.4
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
