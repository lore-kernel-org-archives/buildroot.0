Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2F9EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A08E41E68;
	Thu, 27 Jul 2023 22:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A08E41E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMBhITppw7Ic; Thu, 27 Jul 2023 22:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0956A41E81;
	Thu, 27 Jul 2023 22:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0956A41E81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 869891BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6044660EC2
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6044660EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOJHwTTfCpPu for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:28:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51EAA60E59
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EAA60E59
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E8A18377D; Thu, 27 Jul 2023 22:28:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:06:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a433fbcff74c7d87fce675dcdc1859b88090d62b
X-Git-Newrev: 39610c8b3c7201d0a25a00c6707b724ff1aafce0
X-Patchwork-Hint: ignore
Message-Id: <20230727222840.3E8A18377D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbw: bump to version 2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=39610c8b3c7201d0a25a00c6707b724ff1aafce0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version is released under GPL-3.0. The patch can be removed
as it has been accepted upstream as of commit
https://github.com/raas/mbw/commit/86a38c688aa8e3db67079ac92ab298e498511899.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 38 ----------------------
 package/mbw/mbw.hash                               |  4 +--
 package/mbw/mbw.mk                                 |  6 ++--
 4 files changed, 5 insertions(+), 44 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e6c55cb324..38fdc63726 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -933,7 +933,6 @@ package/matchbox-panel/0003-mb-applet-battery.patch Upstream
 package/matchbox-startup-monitor/0001-true-false.patch Upstream
 package/matchbox/0001-defaulttheme.patch Upstream
 package/matchbox/0002-src-Fix-build-with-gcc-10.patch Upstream
-package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch Upstream
 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch Upstream
 package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch Upstream
 package/memcached/0001-logger.c-initialize-rport.patch Upstream
diff --git a/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch b/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index 2c2585ebe2..0000000000
--- a/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 059f67459912bba6d7f605b7c43519ff547f3a80 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Aug 2022 11:34:19 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Fix the following build failure without C++:
-
-CMake Error at CMakeLists.txt:3 (project):
-  No CMAKE_CXX_COMPILER could be found.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Fixes:
- - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/raas/mbw/pull/14]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d3d4fcd..3b2cb3e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 3.10)
- 
--project(mbw VERSION 1.5)
-+project(mbw VERSION 1.5 LANGUAGES C)
- 
- add_executable(mbw mbw.c)
- install(TARGETS mbw DESTINATION bin)
--- 
-2.35.1
-
diff --git a/package/mbw/mbw.hash b/package/mbw/mbw.hash
index 74e38992de..d58d7a5d44 100644
--- a/package/mbw/mbw.hash
+++ b/package/mbw/mbw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3c396ce09bb78c895e4d45e99b1ae07f80e3ea5eee59d78ed2048a7f2ae591ae  mbw-1.5.tar.gz
-sha256  1afb2b8258506742238b9ceb8a865d7030c5889c56ba2911a0c0c042aa1335d1  mbw.spec
+sha256  557f670e13ff663086fe239e4184d8ca6154b004bd5fde2b0a748e5aa543c87f  mbw-2.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/mbw/mbw.mk b/package/mbw/mbw.mk
index 755a9f5293..04d6ea3494 100644
--- a/package/mbw/mbw.mk
+++ b/package/mbw/mbw.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MBW_VERSION = 1.5
+MBW_VERSION = 2.0
 MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
-MBW_LICENSE = LGPL-2.1
-MBW_LICENSE_FILES = mbw.spec
+MBW_LICENSE = GPL-3.0+
+MBW_LICENSE_FILES = LICENSE
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
