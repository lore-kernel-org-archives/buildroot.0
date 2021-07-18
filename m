Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E77C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED9C601FC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ED9C601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC4FD605EF;
	Tue,  3 Aug 2021 22:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVJdFE0JOgoV; Tue,  3 Aug 2021 22:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A6160664;
	Tue,  3 Aug 2021 22:11:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DDD21BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CACB240584
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kGn6r242xbE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C6440579
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3AF6B8283F; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:34:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 88705a8c248e566f2c9ca71a8ee5353b33e368c2
X-Git-Newrev: 1d15817576b44c30eaa9bb8d1152934c6498b776
X-Patchwork-Hint: ignore
Message-Id: <20210803211009.3AF6B8283F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/apitrace: bump to
 version 10.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1d15817576b44c30eaa9bb8d1152934c6498b776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop all patches (already in version)
- C++17 and gcc >= 7 is required since
  https://github.com/apitrace/apitrace/commit/37c36e66b8cfa534797ca565c22e8c30923f35d4
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-dlsym-Fix-build-under-uClibc.patch        |  31 ------
 ...upport-libc-that-don-t-have-RTLD_DEEPBIND.patch |  25 -----
 ...-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch | 104 ---------------------
 package/apitrace/Config.in                         |   6 +-
 package/apitrace/apitrace.hash                     |   4 +-
 package/apitrace/apitrace.mk                       |   2 +-
 6 files changed, 6 insertions(+), 166 deletions(-)

diff --git a/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch b/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
deleted file mode 100644
index bf47bba931..0000000000
--- a/package/apitrace/0001-dlsym-Fix-build-under-uClibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 189a3b8397c61ba262a2221885e38dc514c59d94 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Sat, 7 Dec 2019 00:00:57 +0100
-Subject: [PATCH] dlsym: Fix build under uClibc
-
-uClibc defines the __GLIBC__ macro too (I know, right?), so verify that
-__UCLIBC__ is not defined before we can use glibc-specific internal
-functions.
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-Upstream: https://github.com/apitrace/apitrace/commit/189a3b8397c61ba262a2221885e38dc514c59d94
----
- wrappers/dlsym.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
-index 2eda082a..5ab8465b 100644
---- a/wrappers/dlsym.cpp
-+++ b/wrappers/dlsym.cpp
-@@ -34,7 +34,7 @@
- #include "os.hpp"
- 
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
- 
- 
- #include <dlfcn.h>
--- 
-2.24.0
-
diff --git a/package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch b/package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch
deleted file mode 100644
index e34357428a..0000000000
--- a/package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d495d15e20bf655afa3be62ada792e8dfc8d29b6 Mon Sep 17 00:00:00 2001
-From: Gleb Mazovetskiy <glex.spb@gmail.com>
-Date: Fri, 13 Dec 2019 13:39:19 +0000
-Subject: [PATCH] Support libc that don't have RTLD_DEEPBIND
-
-[Retrieved from: https://github.com/apitrace/apitrace/pull/646]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dispatch/glproc_gl.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/dispatch/glproc_gl.cpp b/dispatch/glproc_gl.cpp
-index 5d7903a0c..456fcc42e 100644
---- a/dispatch/glproc_gl.cpp
-+++ b/dispatch/glproc_gl.cpp
-@@ -148,6 +148,9 @@ _getPrivateProcAddress(const char *procName)
- 
- #else
- 
-+#ifndef RTLD_DEEPBIND
-+#define RTLD_DEEPBIND 0
-+#endif
- 
- static inline void
- logSymbol(const char *name, void *ptr) {
diff --git a/package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch b/package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch
deleted file mode 100644
index 8cc1f8bb0b..0000000000
--- a/package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 7f0f1e7e34f997eef697856804dd478b54bb365e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 22 Dec 2020 10:45:21 +0100
-Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING=OFF
-
-Allow the user to disable unit tests through BUILD_TESTING=OFF:
-https://cmake.org/cmake/help/latest/command/enable_testing.html
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/apitrace/apitrace/pull/698]
----
- CMakeLists.txt           | 6 +++++-
- gui/CMakeLists.txt       | 6 ++++--
- lib/guids/CMakeLists.txt | 6 ++++--
- lib/os/CMakeLists.txt    | 6 ++++--
- lib/trace/CMakeLists.txt | 6 ++++--
- 5 files changed, 21 insertions(+), 9 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4a07f069..ee401887 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -41,6 +41,8 @@ option (ENABLE_FRAME_POINTER "Disable frame pointer omission" ON)
- 
- option (ENABLE_ASAN "Enable Address Sanitizer" OFF)
- 
-+option (BUILD_TESTING "Enable unit tests" ON)
-+
- option (ENABLE_TESTS "Enable additional tests" OFF)
- 
- if (ANDROID)
-@@ -433,7 +435,9 @@ endmacro ()
- # which subdirectory they are declared
- set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
- 
--enable_testing ()
-+if (BUILD_TESTING)
-+    enable_testing ()
-+endif ()
- if (CMAKE_CROSSCOMPILING)
-     add_custom_target (check)
- elseif (DEFINED CMAKE_BUILD_TYPE)
-diff --git a/gui/CMakeLists.txt b/gui/CMakeLists.txt
-index 5baf3552..ad6ee501 100644
---- a/gui/CMakeLists.txt
-+++ b/gui/CMakeLists.txt
-@@ -13,8 +13,10 @@ add_library (qubjson STATIC
-     qubjson.cpp
- )
- 
--add_gtest (qubjson_test qubjson_test.cpp)
--target_link_libraries (qubjson_test qubjson)
-+if (BUILD_TESTING)
-+    add_gtest (qubjson_test qubjson_test.cpp)
-+    target_link_libraries (qubjson_test qubjson)
-+endif ()
- 
- set(qapitrace_SRCS
-    apisurface.cpp
-diff --git a/lib/guids/CMakeLists.txt b/lib/guids/CMakeLists.txt
-index ce0f86da..ea28a18f 100644
---- a/lib/guids/CMakeLists.txt
-+++ b/lib/guids/CMakeLists.txt
-@@ -5,5 +5,7 @@ add_library (guids STATIC
-     guids.hpp
- )
- 
--add_gtest (guids_test guids_test.cpp)
--target_link_libraries (guids_test guids)
-+if (BUILD_TESTING)
-+    add_gtest (guids_test guids_test.cpp)
-+    target_link_libraries (guids_test guids)
-+endif ()
-diff --git a/lib/os/CMakeLists.txt b/lib/os/CMakeLists.txt
-index 222411e0..b7134b57 100644
---- a/lib/os/CMakeLists.txt
-+++ b/lib/os/CMakeLists.txt
-@@ -36,5 +36,7 @@ if (APPLE)
-     )
- endif ()
- 
--add_gtest (os_thread_test os_thread_test.cpp)
--target_link_libraries (os_thread_test os)
-+if (BUILD_TESTING)
-+    add_gtest (os_thread_test os_thread_test.cpp)
-+    target_link_libraries (os_thread_test os)
-+endif ()
-diff --git a/lib/trace/CMakeLists.txt b/lib/trace/CMakeLists.txt
-index c68bd00f..d95df978 100644
---- a/lib/trace/CMakeLists.txt
-+++ b/lib/trace/CMakeLists.txt
-@@ -34,5 +34,7 @@ target_link_libraries (common
-     brotli_dec brotli_common
- )
- 
--add_gtest (trace_parser_flags_test trace_parser_flags_test.cpp)
--target_link_libraries (trace_parser_flags_test common)
-+if (BUILD_TESTING)
-+    add_gtest (trace_parser_flags_test trace_parser_flags_test.cpp)
-+    target_link_libraries (trace_parser_flags_test common)
-+endif ()
--- 
-2.29.2
-
diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 263eec5e7d..44bd696431 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,8 +1,8 @@
-comment "apitrace needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 4.9"
+comment "apitrace needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_APITRACE
 	bool "apitrace"
@@ -10,7 +10,7 @@ config BR2_PACKAGE_APITRACE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
index 9479f06425..7ccf6cfbe1 100644
--- a/package/apitrace/apitrace.hash
+++ b/package/apitrace/apitrace.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0eec81ba7d3799622336319785465a2982a0621898842517a07894d7e2aa18eb  apitrace-9.0.tar.gz
-sha256 7066bb1b787519c42f8278b77757c21de522cd97755cb30a22759ac401c62260  LICENSE
+sha256  2e57d37af39369d7ce78666acb8afb1a49ec758f683a21077ec39eb0befae4ad  apitrace-10.0.tar.gz
+sha256  7066bb1b787519c42f8278b77757c21de522cd97755cb30a22759ac401c62260  LICENSE
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index b962ac01d3..3656a5722b 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APITRACE_VERSION = 9.0
+APITRACE_VERSION = 10.0
 APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
