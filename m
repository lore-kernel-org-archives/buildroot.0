Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA7AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47AE817F5;
	Tue, 14 Dec 2021 19:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erm0Njko4WMa; Tue, 14 Dec 2021 19:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29095817C3;
	Tue, 14 Dec 2021 19:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79A971BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6796360BF4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Co3Iut1dcEJc for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE1160BBA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A8C4081E71; Tue, 14 Dec 2021 19:48:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:16:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 656f4a3718c5c643e419718ee693109093accbd9
X-Git-Newrev: ae395fe743d828106babd6185e75756c4ded054b
X-Patchwork-Hint: ignore
Message-Id: <20211214194841.A8C4081E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rp-pppoe: drop first patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae395fe743d828106babd6185e75756c4ded054b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch has been added to buildroot more than eleven years ago in commit
e9ae739ce757d73657ef860e21ccc78b3d55816e however it seems that rp-pppoe
builds perfectly fine without it nowadays.

- ac_cv_linux_kernel_pppoe=no just gives a warning;
- HAVE_LINUX_KERNEL_PPPOE is set by configure based on the presence of
  the appropriate header.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rp-pppoe/0001-krn-plugin.patch             | 27 ----------------------
 ...001-src-pppoe.h-fix-build-with-musl-libc.patch} |  0
 2 files changed, 27 deletions(-)

diff --git a/package/rp-pppoe/0001-krn-plugin.patch b/package/rp-pppoe/0001-krn-plugin.patch
deleted file mode 100644
index c386e85f29..0000000000
--- a/package/rp-pppoe/0001-krn-plugin.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-[Fabrice: update patch for 3.14]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-diff -Nura rp-pppoe-3.11.orig/src/configure rp-pppoe-3.11/src/configure
---- rp-pppoe-3.11.orig/src/configure	2012-08-21 10:01:10.536440032 -0300
-+++ rp-pppoe-3.11/src/configure	2012-08-21 10:01:45.353442397 -0300
-@@ -4517,7 +4517,7 @@
- modprobe pppoe > /dev/null 2>&1
- fi
- if test "$cross_compiling" = yes; then :
--  ac_cv_linux_kernel_pppoe=no; echo "cross-compiling, default: "
-+  ac_cv_linux_kernel_pppoe=yes; echo "cross-compiling, default: "
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
-diff -Nura rp-pppoe-3.11.orig/src/pppoe-server.c rp-pppoe-3.11/src/pppoe-server.c
---- rp-pppoe-3.11.orig/src/pppoe-server.c	2012-08-21 10:01:10.535440032 -0300
-+++ rp-pppoe-3.11/src/pppoe-server.c	2012-08-21 10:02:02.597443569 -0300
-@@ -20,6 +20,9 @@
- 
- #include "config.h"
- 
-+/* Patched hack to make this cross compile */
-+#define HAVE_LINUX_KERNEL_PPPOE 1
-+
- #if defined(HAVE_NETPACKET_PACKET_H) || defined(HAVE_LINUX_IF_PACKET_H)
- #define _POSIX_SOURCE 1 /* For sigaction defines */
- #endif
diff --git a/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
similarity index 100%
rename from package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
rename to package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
