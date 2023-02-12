Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D103FC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC7C813ED;
	Sun, 12 Feb 2023 20:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC7C813ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoUoP9ZCRQs0; Sun, 12 Feb 2023 20:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B96D813F7;
	Sun, 12 Feb 2023 20:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B96D813F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43F9C1BF865
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C35C40131
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C35C40131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKfZYRlJchau for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:34:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C89F400D3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C89F400D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A88785AAC; Sun, 12 Feb 2023 20:34:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:34:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4706e04e3ca7428c755bffd79ddf8ef8628141e0
X-Git-Newrev: add76a41c3c68e649ecae69aa896d5f8b627d1be
X-Patchwork-Hint: ignore
Message-Id: <20230212203453.4A88785AAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsolv: fix build without C++
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
