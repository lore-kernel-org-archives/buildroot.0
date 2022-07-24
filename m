Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B765C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C472424C5;
	Sun, 24 Jul 2022 10:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C472424C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGr0QalNLwGX; Sun, 24 Jul 2022 10:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA6DD424BF;
	Sun, 24 Jul 2022 10:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6DD424BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE941BF96B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A603617A0
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A603617A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SShh4FfnZT9 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:31:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5616D60BF4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5616D60BF4
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6AA4E85BF5; Sun, 24 Jul 2022 10:17:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 12:28:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bbbf1ba584d760980eb243dc5da0c2d4bfc8bb9
X-Git-Newrev: 13e75d18e510c176320ad5102cc1606269e4e057
X-Patchwork-Hint: ignore
Message-Id: <20220724101753.6AA4E85BF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hackrf: bump to version 2021.03.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=13e75d18e510c176320ad5102cc1606269e4e057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/greatscottgadgets/hackrf/releases/tag/v2021.03.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../hackrf/0001-Don-t-require-a-C-compiler.patch   | 37 ----------------------
 ...es-FindFFTW.cmake-fix-build-without-fftw3.patch | 34 ++++++++++++++++++++
 package/hackrf/hackrf.hash                         |  2 +-
 package/hackrf/hackrf.mk                           |  2 +-
 4 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/package/hackrf/0001-Don-t-require-a-C-compiler.patch b/package/hackrf/0001-Don-t-require-a-C-compiler.patch
deleted file mode 100644
index 3369dca670..0000000000
--- a/package/hackrf/0001-Don-t-require-a-C-compiler.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8b0a8b2be8cf2e4a76c03d3bcdf99bff5025ba22 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sat, 31 Mar 2018 22:50:37 +0200
-Subject: [PATCH] Don't require a C++ compiler
-
-By default, CMake assumes that the project is using both C and C++.  By
-explicitly passing 'C' as argument of the project() macro, we tell CMake
-that only C is used, which prevents CMake from erroring out if a C++
-compiler doesn't exist.
-
-Upstream status: https://github.com/mossmann/hackrf/pull/469
-
-This patch differs from upstream because:
-- project name upstream has been changed into HackRF;
-- in Buildroot, we are only interested in host, not firmware.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- host/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
-index 874163f..d9cbe31 100644
---- a/host/CMakeLists.txt
-+++ b/host/CMakeLists.txt
-@@ -1,7 +1,7 @@
- #top dir cmake project for libhackrf + tools
- 
- cmake_minimum_required(VERSION 2.8)
--project (hackrf_all)
-+project (hackrf_all C)
- 
- add_subdirectory(libhackrf)
- add_subdirectory(hackrf-tools)
--- 
-2.16.3
-
diff --git a/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch b/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
new file mode 100644
index 0000000000..2b1f34879b
--- /dev/null
+++ b/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
@@ -0,0 +1,34 @@
+From 3e32f46c7948f6b26476558905995ebec9b01760 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Oct 2021 23:36:54 +0200
+Subject: [PATCH] cmake/modules/FindFFTW.cmake: fix build without fftw3
+
+Build on Linux fails if libfftw3 is not available since commit
+https://github.com/greatscottgadgets/hackrf/commit/a8c1fc92e9fa10843cb4aafd68c52f9903ebd05d
+which replaced
+pkg_check_modules(FFTW REQUIRED fftw3f)
+by
+find_package(FFTW REQUIRED)
+
+Fix this build failure by updating FindFFTW.cmake to check for fftw3f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/greatscottgadgets/hackrf/commit/3e32f46c7948f6b26476558905995ebec9b01760]
+---
+ host/cmake/modules/FindFFTW.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/cmake/modules/FindFFTW.cmake b/host/cmake/modules/FindFFTW.cmake
+index b9f3bfb81..802db4f5b 100644
+--- a/host/cmake/modules/FindFFTW.cmake
++++ b/host/cmake/modules/FindFFTW.cmake
+@@ -16,7 +16,7 @@ IF (WIN32)
+ include_directories(${FFTW_INCLUDES})
+ find_library (FFTW_LIBRARIES NAMES ${FFTW_LIBRARIES})
+ ELSE(WIN32)
+-find_library (FFTW_LIBRARIES NAMES fftw3)
++find_library (FFTW_LIBRARIES NAMES fftw3f)
+ ENDIF(WIN32)
+ 
+ 
diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index c0cf732213..9053858f76 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a89badc09a1d2fa18367b3b2c974580ad5f6ce93aaa4e54557dc3d013c029d14  hackrf-2018.01.1.tar.xz
+sha256  a43e5080c11efdfe69ddebcc35a02b018e30e820de0e0ebdc7948cf7b0cd93a3  hackrf-2021.03.1.tar.xz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 6d694f5fbc..c224afc332 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2018.01.1
+HACKRF_VERSION = 2021.03.1
 HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
