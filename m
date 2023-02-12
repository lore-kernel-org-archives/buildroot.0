Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B0FC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2B24F5E2;
	Tue, 21 Feb 2023 00:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2B24F5E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lt7mE_lJAL5a; Tue, 21 Feb 2023 00:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F734F642;
	Tue, 21 Feb 2023 00:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F734F642
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6991BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB1741812
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB1741812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCAAueXNpxBg for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2614F4159D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2614F4159D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15E7486495; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:34:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4706e04e3ca7428c755bffd79ddf8ef8628141e0
X-Git-Newrev: add76a41c3c68e649ecae69aa896d5f8b627d1be
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.15E7486495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsolv: fix build
 without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=add76a41c3c68e649ecae69aa896d5f8b627d1be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure without C++ raised since the addition ot
the package in commit 93ce3c1be0753189d6af3ee9968b935037519c25:

CMake Error at CMakeLists.txt:1 (PROJECT):
  No CMAKE_CXX_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

Fixes:
 - http://autobuild.buildroot.org/results/a7f2176d40f156c319754ef5d3b7fd0decfe754f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsolv/0001-Fix-build-without-C.patch | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/libsolv/0001-Fix-build-without-C.patch b/package/libsolv/0001-Fix-build-without-C.patch
new file mode 100644
index 0000000000..2389aebcde
--- /dev/null
+++ b/package/libsolv/0001-Fix-build-without-C.patch
@@ -0,0 +1,49 @@
+From 5691f58d1f8ce1332b02536e48f1ac5864629c6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Feb 2023 15:27:27 +0100
+Subject: [PATCH] Fix build without C++
+
+Fix the following build failure without C++:
+
+CMake Error at CMakeLists.txt:1 (PROJECT):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a7f2176d40f156c319754ef5d3b7fd0decfe754f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/openSUSE/libsolv/pull/520]
+---
+ CMakeLists.txt     | 2 +-
+ ext/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3541f496..f899c49a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-PROJECT (libsolv)
++PROJECT (libsolv C)
+ 
+ CMAKE_MINIMUM_REQUIRED (VERSION 2.8.5)
+ 
+diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
+index f01c0238..589fa946 100644
+--- a/ext/CMakeLists.txt
++++ b/ext/CMakeLists.txt
+@@ -103,6 +103,7 @@ IF (ENABLE_CUDFREPO)
+ ENDIF (ENABLE_CUDFREPO)
+ 
+ IF (ENABLE_HAIKU)
++    enable_language(CXX)
+     SET (libsolvext_SRCS ${libsolvext_SRCS}
+ 	repo_haiku.cpp)
+     SET (libsolvext_HEADERS ${libsolvext_HEADERS}
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
