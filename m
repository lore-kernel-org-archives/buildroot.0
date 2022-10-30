Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA2FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4392040359;
	Sun, 30 Oct 2022 11:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4392040359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Euck7YOvb8zO; Sun, 30 Oct 2022 11:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4204A40376;
	Sun, 30 Oct 2022 11:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4204A40376
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0851E1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6325812F7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6325812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wbvhr8tP85Eb for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E69D3812DA
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E69D3812DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D00F58746D; Sun, 30 Oct 2022 11:04:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:53:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c999e540dd233f8cb52eee4c35373cd6603aea97
X-Git-Newrev: f020e03ad9910f9e3419666aa5c7d58ab205fa9d
X-Patchwork-Hint: ignore
Message-Id: <20221030110442.D00F58746D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hackrf: bump to version 2022.09.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f020e03ad9910f9e3419666aa5c7d58ab205fa9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site
- Drop patch (already in version)

https://github.com/greatscottgadgets/hackrf/releases/tag/v2022.09.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...es-FindFFTW.cmake-fix-build-without-fftw3.patch | 34 ----------------------
 package/hackrf/Config.in                           |  2 +-
 package/hackrf/hackrf.hash                         |  2 +-
 package/hackrf/hackrf.mk                           |  4 +--
 4 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch b/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
deleted file mode 100644
index 2b1f34879b..0000000000
--- a/package/hackrf/0001-cmake-modules-FindFFTW.cmake-fix-build-without-fftw3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3e32f46c7948f6b26476558905995ebec9b01760 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Oct 2021 23:36:54 +0200
-Subject: [PATCH] cmake/modules/FindFFTW.cmake: fix build without fftw3
-
-Build on Linux fails if libfftw3 is not available since commit
-https://github.com/greatscottgadgets/hackrf/commit/a8c1fc92e9fa10843cb4aafd68c52f9903ebd05d
-which replaced
-pkg_check_modules(FFTW REQUIRED fftw3f)
-by
-find_package(FFTW REQUIRED)
-
-Fix this build failure by updating FindFFTW.cmake to check for fftw3f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/greatscottgadgets/hackrf/commit/3e32f46c7948f6b26476558905995ebec9b01760]
----
- host/cmake/modules/FindFFTW.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/cmake/modules/FindFFTW.cmake b/host/cmake/modules/FindFFTW.cmake
-index b9f3bfb81..802db4f5b 100644
---- a/host/cmake/modules/FindFFTW.cmake
-+++ b/host/cmake/modules/FindFFTW.cmake
-@@ -16,7 +16,7 @@ IF (WIN32)
- include_directories(${FFTW_INCLUDES})
- find_library (FFTW_LIBRARIES NAMES ${FFTW_LIBRARIES})
- ELSE(WIN32)
--find_library (FFTW_LIBRARIES NAMES fftw3)
-+find_library (FFTW_LIBRARIES NAMES fftw3f)
- ENDIF(WIN32)
- 
- 
diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
index 05d01adc96..d5df328dfa 100644
--- a/package/hackrf/Config.in
+++ b/package/hackrf/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_HACKRF
 	help
 	  Library and tools for accessing HackRF SDR boards.
 
-	  https://github.com/mossmann/hackrf/tree/master/host
+	  https://hackrf.readthedocs.io
 
 comment "hackrf needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index 9053858f76..16ccb9dcfb 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a43e5080c11efdfe69ddebcc35a02b018e30e820de0e0ebdc7948cf7b0cd93a3  hackrf-2021.03.1.tar.xz
+sha256  bacd4e7937467ffa14654624444c8b5c716ab470d8c1ee8d220d2094ae2adb3e  hackrf-2022.09.1.tar.xz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index c224afc332..4317da60bc 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2021.03.1
-HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
+HACKRF_VERSION = 2022.09.1
+HACKRF_SITE = https://github.com/greatscottgadgets/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
