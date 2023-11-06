Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1046BC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEC8610AE;
	Mon,  6 Nov 2023 19:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBEC8610AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHfHY_Kfs6Ma; Mon,  6 Nov 2023 19:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65F0612A6;
	Mon,  6 Nov 2023 19:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C65F0612A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92BD91BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A7444185E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A7444185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1HLnSdEG6AM for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C45E417E7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C45E417E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 425D086972; Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:39:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4c555bd57ffdda313cb883be80d9c3d62a5442b
X-Git-Newrev: 1eb07c1904088b660d8c9b21b44b228cd824bece
X-Patchwork-Hint: ignore
Message-Id: <20231106194025.425D086972@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsolv: bump to version 0.7.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eb07c1904088b660d8c9b21b44b228cd824bece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/openSUSE/libsolv/blob/0.7.25/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                            |  1 -
 package/libsolv/0001-Fix-build-without-C.patch | 49 --------------------------
 package/libsolv/libsolv.hash                   |  2 +-
 package/libsolv/libsolv.mk                     |  2 +-
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1e35bf77db..0a0df6757a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -742,7 +742,6 @@ package/libsigrok/0001-Support-glibmm-2.68.patch Upstream
 package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch Upstream
 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch Upstream
 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch Upstream
-package/libsolv/0001-Fix-build-without-C.patch Upstream
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch Upstream
 package/libsoxr/0001-Add-Libs.private-for-static-linking.patch Upstream
 package/libspatialindex/0001-allow-building-static-libs.patch Upstream
diff --git a/package/libsolv/0001-Fix-build-without-C.patch b/package/libsolv/0001-Fix-build-without-C.patch
deleted file mode 100644
index 2389aebcde..0000000000
--- a/package/libsolv/0001-Fix-build-without-C.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5691f58d1f8ce1332b02536e48f1ac5864629c6c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Feb 2023 15:27:27 +0100
-Subject: [PATCH] Fix build without C++
-
-Fix the following build failure without C++:
-
-CMake Error at CMakeLists.txt:1 (PROJECT):
-  No CMAKE_CXX_COMPILER could be found.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Fixes:
- - http://autobuild.buildroot.org/results/a7f2176d40f156c319754ef5d3b7fd0decfe754f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/openSUSE/libsolv/pull/520]
----
- CMakeLists.txt     | 2 +-
- ext/CMakeLists.txt | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3541f496..f899c49a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--PROJECT (libsolv)
-+PROJECT (libsolv C)
- 
- CMAKE_MINIMUM_REQUIRED (VERSION 2.8.5)
- 
-diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index f01c0238..589fa946 100644
---- a/ext/CMakeLists.txt
-+++ b/ext/CMakeLists.txt
-@@ -103,6 +103,7 @@ IF (ENABLE_CUDFREPO)
- ENDIF (ENABLE_CUDFREPO)
- 
- IF (ENABLE_HAIKU)
-+    enable_language(CXX)
-     SET (libsolvext_SRCS ${libsolvext_SRCS}
- 	repo_haiku.cpp)
-     SET (libsolvext_HEADERS ${libsolvext_HEADERS}
--- 
-2.39.0
-
diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
index 162e46e54d..b18a682ccf 100644
--- a/package/libsolv/libsolv.hash
+++ b/package/libsolv/libsolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  968aef452b5493751fa0168cd58745a77c755e202a43fe8d549d791eb16034d5  libsolv-0.7.22.tar.gz
+sha256  b382bba4196b19c36eb34e0ef02546c0b922be601c6f73390c9ab643895b656a  libsolv-0.7.25.tar.gz
 sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 04fdb387fd..2a9f1bf208 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOLV_VERSION = 0.7.22
+LIBSOLV_VERSION = 0.7.25
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
