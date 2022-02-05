Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E2DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A761540132;
	Sat,  5 Feb 2022 15:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLdhbtXFMPgp; Sat,  5 Feb 2022 15:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60A21402B1;
	Sat,  5 Feb 2022 15:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D040D1BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF56F80E3B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzyTq0Ur5VlJ for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0EF880BCE
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:18:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 994B68295E; Sat,  5 Feb 2022 15:11:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 16:09:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc66c5901cbc912941f26275aac0f4b3fe6cf596
X-Git-Newrev: 7ddbcb76aaa4e88dfe7aef5072aafd95107b7161
X-Patchwork-Hint: ignore
Message-Id: <20220205151113.994B68295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bullet: bump to version 3.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ddbcb76aaa4e88dfe7aef5072aafd95107b7161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch | 42 ----------------------
 package/bullet/bullet.hash                         |  4 +--
 package/bullet/bullet.mk                           |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch b/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
deleted file mode 100644
index d01bb97d99..0000000000
--- a/package/bullet/0001-Extras-VHACD-inc-vhacdMutex.h-fix-musl-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dd37b97e79aea231ae026ac93c6ca4c7a2667582 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 7 Aug 2021 17:11:24 +0200
-Subject: [PATCH] Extras/VHACD/inc/vhacdMutex.h: fix musl build
-
-Fix the following build failure on musl (which does not provide
-PTHREAD_MUTEX_RECURSIVE_NP):
-
-In file included from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btScalar.h:289,
-                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btVector3.h:19,
-                 from /tmp/instance-5/output-1/build/bullet-3.09/src/LinearMath/btConvexHullComputer.h:18,
-                 from /tmp/instance-5/output-1/build/bullet-3.09/Extras/VHACD/src/VHACD.cpp:28:
-/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h: In constructor 'VHACD::Mutex::Mutex()':
-/tmp/instance-5/output-1/build/bullet-3.09/Extras/BulletRobotics/../../Extras/VHACD/inc/vhacdMutex.h:97:54: error: 'PTHREAD_MUTEX_RECURSIVE_NP' was not declared in this scope; did you mean 'PTHREAD_MUTEX_RECURSIVE'?
-   97 |   VHACD_VERIFY(pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_RECURSIVE_NP) == 0);
-      |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/bulletphysics/bullet3/pull/3930]
----
- Extras/VHACD/inc/vhacdMutex.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Extras/VHACD/inc/vhacdMutex.h b/Extras/VHACD/inc/vhacdMutex.h
-index 4d1ad2a7d..78c111383 100644
---- a/Extras/VHACD/inc/vhacdMutex.h
-+++ b/Extras/VHACD/inc/vhacdMutex.h
-@@ -69,7 +69,7 @@
- #include <pthread.h>
- #endif
- 
--#if defined(__APPLE__)
-+#if defined(__APPLE__) || !defined(__GLIBC__)
- #define PTHREAD_MUTEX_RECURSIVE_NP PTHREAD_MUTEX_RECURSIVE
- #endif
- 
--- 
-2.30.2
-
diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index 813e8299e1..5c70c683b0 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f2feef9322329c0571d9066fede2db0ede92b19f7f7fdf54def3b4651f02af03  bullet-3.09.tar.gz
-sha256 885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
+sha256  49d1ee47aa8cbb0bc6bb459f0a4cfb9579b40e28f5c7d9a36c313e3031fb3965  bullet-3.21.tar.gz
+sha256  885cd516a8420acb7c3e0b1a7119913b686495001ae564e3229740460e8cff59  LICENSE.txt
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index cc72be7c60..9afd922ec9 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BULLET_VERSION = 3.09
+BULLET_VERSION = 3.21
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
