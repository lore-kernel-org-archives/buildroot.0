Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92376C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE3281300;
	Sun,  7 Aug 2022 12:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE3281300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zoo8agXTwmdA; Sun,  7 Aug 2022 12:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B9F812F2;
	Sun,  7 Aug 2022 12:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B9F812F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1928A1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90F2812A5
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E90F2812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptpc8uM4pyDZ for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:38:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 302DC81259
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 302DC81259
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 029F386EFD; Sun,  7 Aug 2022 12:24:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:38:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe4ac73698bb79e1129b71e69e1c0c28ace0995
X-Git-Newrev: 59fdc58ef5b9e27a6124b3c86b18904c117644a9
X-Patchwork-Hint: ignore
Message-Id: <20220807122428.029F386EFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbw: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=59fdc58ef5b9e27a6124b3c86b18904c117644a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since the addition of
the package in commit e27ef7658265a62e74bf9f0e66e5e5432f453f6a:

CMake Error at CMakeLists.txt:3 (project):
  No CMAKE_CXX_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

Fixes:
 - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch b/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..2c2585ebe2
--- /dev/null
+++ b/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,38 @@
+From 059f67459912bba6d7f605b7c43519ff547f3a80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Aug 2022 11:34:19 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Fix the following build failure without C++:
+
+CMake Error at CMakeLists.txt:3 (project):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/raas/mbw/pull/14]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d3d4fcd..3b2cb3e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 3.10)
+ 
+-project(mbw VERSION 1.5)
++project(mbw VERSION 1.5 LANGUAGES C)
+ 
+ add_executable(mbw mbw.c)
+ install(TARGETS mbw DESTINATION bin)
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
