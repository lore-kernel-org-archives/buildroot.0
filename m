Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00023C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48FF40330;
	Sun,  5 May 2024 15:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqCBBdv25Dqz; Sun,  5 May 2024 15:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5806640744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5806640744;
	Sun,  5 May 2024 15:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 275141BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE8781FEF
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWYYqI06yxjv for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6770813CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6770813CA
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:38:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0C39866BC; Sun,  5 May 2024 15:38:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 17:33:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3819b761f4a06bc75fe33b785e5ff2cecc5d211
X-Git-Newrev: eddc53a9c1561ed315b817cb1f9333ff38950ee2
X-Patchwork-Hint: ignore
Message-Id: <20240505153817.C0C39866BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zziplib: bump to version 0.13.74
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

commit: https://git.buildroot.net/buildroot/commit/?id=eddc53a9c1561ed315b817cb1f9333ff38950ee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- docs/copying.htm renamed to docs/copying.htm.md, and reformatted from
  HTML to Markdown, with upstream commit:
  https://github.com/gdraheim/zziplib/commit/b8138ba56ecb9d5d27c22d85fae37bdd594d2edb

https://github.com/gdraheim/zziplib/blob/v0.13.74/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - explain why hash of docs/copying.htm.md changed
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch | 75 ----------------------
 ...EST-create-symlinks-only-if-target-is-mis.patch | 72 ---------------------
 package/zziplib/zziplib.hash                       |  4 +-
 package/zziplib/zziplib.mk                         |  4 +-
 5 files changed, 4 insertions(+), 152 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fd39d6e0b6..a2bf1581f4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1703,7 +1703,6 @@ package/zip/0006-unix-configure-borrow-the-LFS-test-from-autotools.patch lib_pat
 package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch lib_patch.Upstream
 package/zip/0008-fix-musl-static-build.patch lib_patch.Upstream
 package/zmqpp/0001-Allow-building-shared-or-static-library-only.patch lib_patch.Upstream
-package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch lib_patch.Upstream
 support/dependencies/check-host-asciidoc.sh Shellcheck
 support/dependencies/check-host-cmake.sh Shellcheck
 support/dependencies/check-host-gzip.sh Shellcheck
diff --git a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch b/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
deleted file mode 100644
index 780d990ab7..0000000000
--- a/package/zziplib/0001-implant-ZZIP_LIBLATEST-for-zzip_lib.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 0e8d35f92efb680c81f6ec1fca9f11d173dce389 Mon Sep 17 00:00:00 2001
-From: Guido Draheim <guidod@gmx.de>
-Date: Sat, 22 May 2021 15:13:28 +0200
-Subject: [PATCH] #117 implant ZZIP_LIBLATEST for zzip.lib
-
-[Andreas: Extract link creation for versioned libraries from commit
-0e8d35f92efb680c81f6ec1fca9f11d173dce389.]
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
----
- zzip/CMakeLists.txt | 57 +++++++++++++++++++++++++++++++++++----------
- 1 file changed, 45 insertions(+), 12 deletions(-)
-
-diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
-index a966d5f..ccd08b6 100644
---- a/zzip/CMakeLists.txt
-+++ b/zzip/CMakeLists.txt
-@@ -28,6 +28,12 @@ option(ZZIP_LIBTOOL "Ensure binary compatibility with libtool" OFF)
- option(ZZIP_PKGCONFIG "Generate pkg-config files for linking" OFF)
- endif()
- 
-+if(ZZIP_LIBTOOL OR ZZIP_PKGCONFIG)
-+option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" ON)
-+else()
-+option(ZZIP_LIBLATEST "Ensure libname.lib links to libname-REL.lib" OFF)
-+endif()
-+
- # used in zzip/_config.h
- set(ZZIP_PACKAGE "${PROJECT_NAME}lib")
- set(ZZIP_VERSION "${PROJECT_VERSION}")
-@@ -346,6 +340,45 @@ if(ZZIP_LIBTOOL)
-   endif(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG)
- endif(ZZIP_LIBTOOL)
- 
-+if(ZZIP_LIBLATEST)
-+  if(BUILD_SHARED_LIBS)
-+    set(lib ${CMAKE_SHARED_LIBRARY_PREFIX})
-+    set(dll ${CMAKE_SHARED_LIBRARY_SUFFIX})
-+  else()
-+    set(lib ${CMAKE_STATIC_LIBRARY_PREFIX})
-+    set(dll ${CMAKE_STATIC_LIBRARY_SUFFIX})
-+  endif()
-+    get_target_property(libname libzzip OUTPUT_NAME)
-+    get_target_property(librelease libzzip RELEASE_POSTFIX)
-+    add_custom_target(libzzip_latest ALL
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
-+        )
-+    install(FILES
-+        ${outdir}/${lib}${libname}${dll}
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+    if(ZZIPFSEEKO)
-+    get_target_property(libname libzzipfseeko OUTPUT_NAME)
-+    get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
-+    add_custom_target(libzzipfseeko_latest ALL
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
-+        )
-+    install(FILES
-+        ${outdir}/${lib}${libname}${dll}
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+    endif(ZZIPFSEEKO)
-+    if(ZZIPMMAPPED)
-+    get_target_property(libname libzzipmmapped OUTPUT_NAME)
-+    get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
-+    add_custom_target(libzzipmmaped_latest ALL
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
-+        )
-+    install(FILES
-+        ${outdir}/${lib}${libname}${dll}
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+    endif(ZZIPMMAPPED)
-+endif(ZZIP_LIBLATEST)
-+
-+
- ## messages ##############################################
- 
- message(STATUS "lib zzipfseeko  to be compiled: ${ZZIPFSEEKO}")
diff --git a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
deleted file mode 100644
index c8ccd48dba..0000000000
--- a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 5977725ecea038f32a86938703ca1ed2b080b31c Mon Sep 17 00:00:00 2001
-From: Andreas Ziegler <br015@umbiko.net>
-Date: Fri, 29 Jul 2022 12:32:27 +0200
-Subject: [PATCH] ZZIP_LIBLATEST: create symlinks only if target is missing
-
-zzip/CMakeList.txt uses custom build targets to create symlinks to the
-(normally versioned) build results from unversioned file names. These
-targets are executed unconditionally, every time a build is started,
-regardless of the existence of the symlink.
-
-Debug builds, however, generate unversioned libraries. The build targets
-therefore overwrite existing files with recursive links.
-
-Create custom targets depending on the target file plus custom build
-commands containing the symlink creation, thereby ensuring that symlinks
-are only created if the link target is missing.
-
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
-Upstream: https://github.com/gdraheim/zziplib/pull/138
----
- zzip/CMakeLists.txt | 18 +++++++++++++++---
- 1 file changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
-index 4fa6b9c..dd1e56a 100644
---- a/zzip/CMakeLists.txt
-+++ b/zzip/CMakeLists.txt
-@@ -350,8 +350,12 @@ if(ZZIP_LIBLATEST)
-   endif()
-     get_target_property(libname libzzip OUTPUT_NAME)
-     get_target_property(librelease libzzip RELEASE_POSTFIX)
-+    set(libzzip_target "${lib}${libname}${dll}")
-+    add_custom_command(OUTPUT ${libzzip_target} 
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${libzzip_target}
-+        )
-     add_custom_target(libzzip_latest ALL
--        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
-+        DEPENDS ${libzzip_target}
-         )
-     install(FILES
-         ${outdir}/${lib}${libname}${dll}
-@@ -359,8 +363,12 @@ if(ZZIP_LIBLATEST)
-     if(ZZIPFSEEKO)
-     get_target_property(libname libzzipfseeko OUTPUT_NAME)
-     get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
-+    set(libzzipfseeko_target "${lib}${libname}${dll}")
-+    add_custom_command(OUTPUT ${libzzipfseeko_target} 
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${libzzipfseeko_target}
-+        )
-     add_custom_target(libzzipfseeko_latest ALL
--        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
-+        DEPENDS ${libzzipfseeko_target}
-         )
-     install(FILES
-         ${outdir}/${lib}${libname}${dll}
-@@ -369,8 +377,12 @@ if(ZZIP_LIBLATEST)
-     if(ZZIPMMAPPED)
-     get_target_property(libname libzzipmmapped OUTPUT_NAME)
-     get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
-+    set(libzzipmmapped_target "${lib}${libname}${dll}")
-+    add_custom_command(OUTPUT ${libzzipmmapped_target} 
-+        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${libzzipmmapped_target}
-+        )
-     add_custom_target(libzzipmmaped_latest ALL
--        COMMAND ${CMAKE_COMMAND} -E create_symlink $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
-+        DEPENDS ${libzzipmmapped_target}
-         )
-     install(FILES
-         ${outdir}/${lib}${libname}${dll}
--- 
-2.34.1
-
diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index b6a75ae0cb..3bff51f07f 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  93ef44bf1f1ea24fc66080426a469df82fa631d13ca3b2e4abaeab89538518dc  zziplib-0.13.72.tar.gz
+sha256  319093aa98d39453f3ea2486a86d8a2fab2d5632f6633a2665318723a908eecf  zziplib-0.13.74.tar.gz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
 sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
-sha256  1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
+sha256  9418aca218090f0bebfa91298c8145c7342de095eced3d72ea241c178df59368  docs/copying.htm.md
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 6cb9dedce8..0ef53436d2 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = 0.13.72
+ZZIPLIB_VERSION = 0.13.74
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
-ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
+ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
 ZZIPLIB_CPE_ID_VALID = YES
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
