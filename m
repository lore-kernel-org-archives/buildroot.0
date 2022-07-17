Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D56C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB35740A15;
	Sun, 17 Jul 2022 13:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB35740A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9McEjKNeEXQ5; Sun, 17 Jul 2022 13:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE5240412;
	Sun, 17 Jul 2022 13:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE5240412
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1C191BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5AAF409D3
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5AAF409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKxmuk-uGPgX for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D240D400F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D240D400F2
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9D60183AAC; Sun, 17 Jul 2022 12:49:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:01:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f50b833160e451199a1a9c5b0a17f77075f873a
X-Git-Newrev: 891bba3ce22ba56be7b124179c368401d57a1568
X-Patchwork-Hint: ignore
Message-Id: <20220717124917.9D60183AAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: bump to version
 4.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=891bba3ce22ba56be7b124179c368401d57a1568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first and second patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 44 ----------------------
 ...CMakeLists.txt-fix-build-without-threads.patch} |  0
 ...ake-remove-duplicate-LwsCheckRequirements.patch | 26 -------------
 package/libwebsockets/libwebsockets.hash           |  2 +-
 package/libwebsockets/libwebsockets.mk             |  2 +-
 5 files changed, 2 insertions(+), 72 deletions(-)

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index c6d6d07dcc..0000000000
--- a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 726b36eca158063d8871c91ad99a29113ea35aea Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 13 Apr 2022 21:03:26 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Fix the following build failure without C++ raised since version 4.2.0
-and
-https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
-
-CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
-  The C++ compiler
-
-    "/usr/bin/clang++"
-
-  is not able to compile a simple test program.
-
-Fixes:
- - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/warmcat/libwebsockets/pull/2613]
----
- CMakeLists.txt | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08aaf8c6..96e3ad18 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -71,7 +71,10 @@ if (ESP_PLATFORM)
- endif()
- 
- # it's at this point any toolchain file is brought in
--project(libwebsockets C CXX)
-+project(libwebsockets C)
-+if (LWS_WITH_SECURE_STREAMS_CPP)
-+	enable_language(CXX)
-+endif()
- include(CTest)
- 
- if (PICO_SDK_PATH)
--- 
-2.35.1
-
diff --git a/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
similarity index 100%
rename from package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
rename to package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
diff --git a/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
deleted file mode 100644
index fc76a2b610..0000000000
--- a/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 99a8b9c4422bed45c8b7412a1e121056f2a6132a Mon Sep 17 00:00:00 2001
-From: Andy Green <andy@warmcat.com>
-Date: Mon, 7 Feb 2022 14:48:55 +0000
-Subject: [PATCH] cmake: remove duplicate LwsCheckRequirements
-
-Signed-off-by: Andy Green <andy@warmcat.com>
-Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- cmake/libwebsockets-config.cmake.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/cmake/libwebsockets-config.cmake.in b/cmake/libwebsockets-config.cmake.in
-index 6247b2cb..8ba97e6f 100644
---- a/cmake/libwebsockets-config.cmake.in
-+++ b/cmake/libwebsockets-config.cmake.in
-@@ -32,6 +32,5 @@ endforeach()
- 
- include(CheckIncludeFile)
- include(CheckCSourceCompiles)
--include(LwsCheckRequirements)
- set(requirements 1)
- 
--- 
-2.35.3
-
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index e39d6e1853..4bff068241 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
+sha256  6a85a1bccf25acc7e8e5383e4934c9b32a102880d1e4c37c70b27ae2a42406e1  libwebsockets-4.3.2.tar.gz
 sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 3a9b9ea88f..f5cde37109 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.3.1
+LIBWEBSOCKETS_VERSION = 4.3.2
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
