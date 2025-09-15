Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F54CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 20:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B80B60B30;
	Mon, 15 Sep 2025 20:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcOXjdnnvncW; Mon, 15 Sep 2025 20:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD6360B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD6360B36;
	Mon, 15 Sep 2025 20:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D711D12D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C8281233
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzNg2QAA7SEt for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 20:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D09D98113E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D09D98113E
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:52:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEAA584767; Mon, 15 Sep 2025 20:52:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 22:33:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbc3cb2c8deebd362399cc7867dda94709d552e7
X-Git-Newrev: c7be3e603830f505c0c7df7e1b967122aa06fed0
X-Patchwork-Hint: ignore
Message-Id: <20250915205235.BEAA584767@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgeos: bump version to 3.14.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7be3e603830f505c0c7df7e1b967122aa06fed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/libgeos/geos/releases/tag/3.14.0

Bump minimal GCC version to 7. (Switched to C++17 as minimum requirement)
https://github.com/libgeos/geos/commit/e142764b77f4b8d0c36ec88406300c5f876743fb

Since commit https://github.com/libgeos/geos/commit/26292ce88077321ced5db5869ea0b11cabaa2d12
libgeos uses fenv.h to catch FPU exceptions. Some libc implementation may
have no fenv support. So add a patch to detect fenv.h availability.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien:
 - reformat patch title to fix check-package error
 - add Upstream header in patch to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...p-make-floating-point-exceptions-optional.patch | 71 ++++++++++++++++++++++
 package/libgeos/Config.in                          |  6 +-
 package/libgeos/libgeos.hash                       |  2 +-
 package/libgeos/libgeos.mk                         |  2 +-
 package/postgis/Config.in                          |  6 +-
 5 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
new file mode 100644
index 0000000000..6adcd39861
--- /dev/null
+++ b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
@@ -0,0 +1,71 @@
+From a6bac7bd506988085fa692ff2e12727ae0e9db84 Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <fido_max@inbox.ru>
+Date: Mon, 15 Sep 2025 17:16:08 +0300
+Subject: [PATCH] geosop: make floating-point exceptions optional
+
+commit 26292ce ("geosop: show most floating-point exceptions in verbose mode")
+add fenv.h dependency. Some libc implementations (uclibc-ng )may have no fenv
+support. So make floating-point exceptions optional and detetct fenv.h at
+configure stage.
+
+Upstream: https://github.com/libgeos/geos/pull/1305
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+---
+ CMakeLists.txt         | 7 +++++++
+ util/geosop/GeosOp.cpp | 6 ++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 12411e586..a1e2f0c6e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -558,3 +558,10 @@ if(PROJECT_IS_TOP_LEVEL)
+ 
+   unset(_is_multi_config_generator)
+ endif()  # PROJECT_IS_TOP_LEVEL
++
++include(CheckIncludeFile)
++check_include_file(fenv.h HAVE_FENV_H)
++
++if(HAVE_FENV_H)
++    target_compile_definitions(geos_cxx_flags INTERFACE HAVE_FENV)
++endif()
+diff --git a/util/geosop/GeosOp.cpp b/util/geosop/GeosOp.cpp
+index 2cb17f000..05307cf30 100644
+--- a/util/geosop/GeosOp.cpp
++++ b/util/geosop/GeosOp.cpp
+@@ -26,7 +26,9 @@
+ #include <geos/io/WKBStreamReader.h>
+ #include <geos/io/WKBWriter.h>
+ 
++#if defined(HAVE_FENV)
+ #include <cfenv>
++#endif
+ #include <fstream>
+ #include <iostream>
+ #include <sstream>
+@@ -394,10 +396,13 @@ void GeosOp::run(OpArguments& opArgs) {
+     //------------------------
+ 
+     try {
++#if defined(HAVE_FENV)
+         std::feclearexcept(FE_ALL_EXCEPT); // clear floating-point status flags
++#endif
+ 
+         execute(op, opArgs);
+ 
++#if defined(HAVE_FENV)
+         // Catch everything except for FE_INEXACT, which is usually harmless
+         const int fpexp = std::fetestexcept(FE_ALL_EXCEPT ^ FE_INEXACT);
+         if (args.isVerbose && (fpexp != 0)) {
+@@ -414,6 +419,7 @@ void GeosOp::run(OpArguments& opArgs) {
+                 std::cerr << " FE_UNDERFLOW";
+             std::cerr << std::endl;
+         }
++#endif
+     }
+     catch (std::exception &e) {
+         std::cerr << "Run-time exception: " << e.what() << std::endl;
+-- 
+2.51.0
+
diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 76cbb9bdcd..ff88f7254d 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 7, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index f404b267e2..538933873b 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c  geos-3.13.1.tar.bz2
+sha256  fe85286b1977121894794b36a7464d05049361bedabf972e70d8f9bf1e3ce928  geos-3.14.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 475a54f79f..0de73e2688 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.13.1
+LIBGEOS_VERSION = 3.14.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 593c0dc1f3..a0f64bd76a 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libgeos
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	select BR2_PACKAGE_LIBGEOS
@@ -17,6 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
