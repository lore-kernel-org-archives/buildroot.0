Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A6C54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 22:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E693F83EF2;
	Thu, 29 May 2025 22:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUoXBdbHdwCx; Thu, 29 May 2025 22:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BD583F00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BD583F00;
	Thu, 29 May 2025 22:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9215127
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F4D640BC6
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9m9TpGvKE4th for <buildroot@buildroot.org>;
 Thu, 29 May 2025 22:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CBE540BB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CBE540BB5
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BCF1876CF; Thu, 29 May 2025 22:07:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 May 2025 23:43:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec361e7d10b2763df43965d62d0a1c32c166b8a6
X-Git-Newrev: d8173e084eb9ccd700b964e1b8117b96e0fed387
X-Patchwork-Hint: ignore
Message-Id: <20250529220705.7BCF1876CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi1: bump to version
 v1.5-48-g22b4667a8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8173e084eb9ccd700b964e1b8117b96e0fed387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the project doesn't have frequent releases, switch to git to avoid
the piling of patches.

The latest git version bumps the minimum CMake version (which fixes
builds with host-cmake >= 4.0) and adds SWIG 4.3 compatibility.

For change log, see:
http://developer.intra2net.com/git/?p=libftdi;a=shortlog;h=22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03

Fixes:
https://autobuild.buildroot.org/results/188811e73dd52eed3c66d7efb590165e4340fc30/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien:
 - use "git describe --abbrev=40" format in _VERSION
 - add link to git shortlog in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  3 -
 ...he-standard-CMake-flag-to-drive-the-share.patch | 93 ----------------------
 ...akeLists.txt-fix-paths-when-FTDIPP-is-set.patch | 46 -----------
 ...txt-fix-static-build-with-libusb-and-lato.patch | 47 -----------
 .../0004-move-from-distutils-to-sysconfig.patch    | 33 --------
 package/libftdi1/libftdi1.hash                     |  5 +-
 package/libftdi1/libftdi1.mk                       |  5 +-
 7 files changed, 4 insertions(+), 228 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fe736e3185..5a427fe0f1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -636,9 +636,6 @@ package/libfreeimage/0003-fix-big-endian-os.patch lib_patch.Upstream
 package/libfreeimage/0004-fixed-C-11-warnings.patch lib_patch.Upstream
 package/libftdi/0001-pkgconfig_libusb.patch lib_patch.Sob lib_patch.Upstream
 package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch lib_patch.Sob lib_patch.Upstream
-package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch lib_patch.Upstream
-package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch lib_patch.Upstream
-package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch lib_patch.Upstream
 package/libfuse/0001-fix-aarch64-build.patch lib_patch.Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch lib_patch.Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_patch.Upstream
diff --git a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
deleted file mode 100644
index 8c45b8811c..0000000000
--- a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 7e57ff280b55b45e74329b9988279e8831d32eab Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 25 Jan 2015 09:45:04 +0100
-Subject: [PATCH] cmake: use the standard CMake flag to drive the shared
- object build
-
-Remove the STATICLIBS CMake option (and the code handling it) and let
-the standard CMake flags drive the shared object build.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Fabrice: update for 1.5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeOptions.txt      |  1 -
- ftdipp/CMakeLists.txt | 14 +-------------
- src/CMakeLists.txt    | 13 +------------
- 3 files changed, 2 insertions(+), 26 deletions(-)
-
-diff --git a/CMakeOptions.txt b/CMakeOptions.txt
-index 07b5887..b780ffd 100644
---- a/CMakeOptions.txt
-+++ b/CMakeOptions.txt
-@@ -1,4 +1,3 @@
--option ( STATICLIBS "Build static libraries" ON )
- option ( BUILD_TESTS "Build unit tests with Boost Unit Test framework" OFF )
- option ( DOCUMENTATION "Generate API documentation with Doxygen" OFF )
- option ( EXAMPLES "Build example programs" ON )
-diff --git a/ftdipp/CMakeLists.txt b/ftdipp/CMakeLists.txt
-index fac5bcc..a06edf1 100644
---- a/ftdipp/CMakeLists.txt
-+++ b/ftdipp/CMakeLists.txt
-@@ -12,7 +12,7 @@ include_directories(BEFORE ${CMAKE_CURRENT_BINARY_DIR}
- include_directories(${Boost_INCLUDE_DIRS})
- 
- # Shared library
--add_library(ftdipp1 SHARED ${cpp_sources})
-+add_library(ftdipp1 ${cpp_sources})
- 
- math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatibility with previous releases
- set_target_properties(ftdipp1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 3)
-@@ -29,18 +29,6 @@ install ( TARGETS ftdipp1
- 					ARCHIVE DESTINATION lib${LIB_SUFFIX}
- 				)
- 
--# Static library
--if ( STATICLIBS )
--	add_library(ftdipp1-static STATIC ${cpp_sources})
--	set_target_properties(ftdipp1-static PROPERTIES OUTPUT_NAME "ftdipp1")
--	set_target_properties(ftdipp1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
--
--	install ( TARGETS ftdipp1-static
--						ARCHIVE DESTINATION lib${LIB_SUFFIX}
--						COMPONENT staticlibs
--					)
--endif ()
--
- install ( FILES ${cpp_headers}
- 					DESTINATION include/${PROJECT_NAME}
- 					COMPONENT headers
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 17b3617..ae4fc61 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -21,7 +21,7 @@ configure_file(ftdi_version_i.h.in "${CMAKE_CURRENT_BINARY_DIR}/ftdi_version_i.h
- set(c_sources     ${CMAKE_CURRENT_SOURCE_DIR}/ftdi.c ${CMAKE_CURRENT_SOURCE_DIR}/ftdi_stream.c CACHE INTERNAL "List of c sources" )
- set(c_headers     ${CMAKE_CURRENT_SOURCE_DIR}/ftdi.h CACHE INTERNAL "List of c headers" )
- 
--add_library(ftdi1 SHARED ${c_sources})
-+add_library(ftdi1 ${c_sources})
- 
- math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatibility with previous releases
- set_target_properties(ftdi1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 2)
-@@ -38,17 +38,6 @@ install ( TARGETS ftdi1
-           ARCHIVE DESTINATION lib${LIB_SUFFIX}
-         )
- 
--if ( STATICLIBS )
--  add_library(ftdi1-static STATIC ${c_sources})
--  target_link_libraries(ftdi1-static ${LIBUSB_LIBRARIES})
--  set_target_properties(ftdi1-static PROPERTIES OUTPUT_NAME "ftdi1")
--  set_target_properties(ftdi1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
--  install ( TARGETS ftdi1-static
--            ARCHIVE DESTINATION lib${LIB_SUFFIX}
--            COMPONENT staticlibs
--          )
--endif ()
--
- install ( FILES ${c_headers}
-           DESTINATION include/${PROJECT_NAME}
-           COMPONENT headers
--- 
-2.27.0
-
diff --git a/package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch b/package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch
deleted file mode 100644
index 14c248bb99..0000000000
--- a/package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3e68fd7da98a755403cf5719c3d7a3c2f4dcbb58 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 17 Jul 2020 21:04:45 +0200
-Subject: [PATCH] CMakeLists.txt: fix paths when FTDIPP is set
-
-Use the same project name (i.e. libftdi1 and not libftdipp1) when FTDIPP
-is enabled as suggested by Aurelien Jarno in
-http://developer.intra2net.com/mailarchive/html/libftdi/2020/msg00044.html
-
-Without this change, the libftdi1.pc config file defines the include
-path as /usr/local/include/libftdipp1 while the ftdi.h file is actually
-installed in /usr/local/include/libftdi1
-
-This is an issue for example for libsigrok which will fail on:
-
-In file included from src/hardware/asix-sigma/protocol.c:27:
-src/hardware/asix-sigma/protocol.h:28:10: fatal error: ftdi.h: No such file or directory
-   28 | #include <ftdi.h>
-      |          ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1427f44e36752c337791597fab47a1889552a2fe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-http://developer.intra2net.com/mailarchive/html/libftdi/2020/msg00045.html]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5aecafc..3b0b87c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -136,7 +136,7 @@ endif ()
- 
- add_subdirectory(src)
- if ( FTDIPP )
--  project(libftdipp1 C CXX)
-+  project(libftdi1 C CXX)
-   add_subdirectory(ftdipp)
- endif ()
- if ( PYTHON_BINDINGS )
--- 
-2.27.0
-
diff --git a/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch b/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
deleted file mode 100644
index c818c58d68..0000000000
--- a/package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b5b8fab6063ad90bb5ef05a72708ecde1796bc81 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 13 May 2022 18:11:50 +0200
-Subject: [PATCH] CMakeLists.txt: fix static build with libusb and -latomic
-
-Use pkg-config to retrieve libusb dependencies such as -latomic and
-avoid the following static build failure:
-
-/nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o): in function `libusb_unref_device':
-/nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-http://developer.intra2net.com/git/?p=libftdi;a=commit;h=b5b8fab6063ad90bb5ef05a72708ecde1796bc81]
----
- CMakeLists.txt |   12 ++++++++++--
- 1 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 58f664a..d20aa94 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -25,8 +25,16 @@ if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
- endif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
- 
- # find libusb
--find_package ( USB1 REQUIRED )
--include_directories ( ${LIBUSB_INCLUDE_DIR} )
-+find_package( PkgConfig )
-+if (PkgConfig_FOUND)
-+  pkg_check_modules( LIBUSB libusb-1.0 )
-+  if (LIBUSB_FOUND)
-+    include_directories ( ${LIBUSB_INCLUDE_DIRS} )
-+  else()
-+    find_package ( USB1 REQUIRED )
-+    include_directories ( ${LIBUSB_INCLUDE_DIR} )
-+  endif()
-+endif()
- 
- # Find Boost
- if (FTDIPP OR BUILD_TESTS)
--- 
-1.7.1
-
diff --git a/package/libftdi1/0004-move-from-distutils-to-sysconfig.patch b/package/libftdi1/0004-move-from-distutils-to-sysconfig.patch
deleted file mode 100644
index 7b38993ada..0000000000
--- a/package/libftdi1/0004-move-from-distutils-to-sysconfig.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From abd19b721f7e9b4d514ed319ece173ebc7b1ea72 Mon Sep 17 00:00:00 2001
-From: =?utf8?q?Dan=20Hor=C3=A1k?= <dan@danny.cz>
-Date: Mon, 19 Dec 2022 17:40:43 +0100
-Subject: [PATCH] python: move from distutils to sysconfig
-
-The distutils module was deprecated in Python 3.10, and will be removed
-in 3.12 [1], thus switch to the sysconfig module instead.
-
-[1] https://peps.python.org/pep-0632/
-
-Upstream: http://developer.intra2net.com/git/?p=libftdi;a=commit;h=abd19b721f7e9b4d514ed319ece173ebc7b1ea72
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
-Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
----
- python/CMakeLists.txt |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
-index 5e406ff..9358419 100644
---- a/python/CMakeLists.txt
-+++ b/python/CMakeLists.txt
-@@ -42,7 +42,7 @@ endif ()
- 
- set_target_properties ( ${SWIG_MODULE_ftdi1_REAL_NAME} PROPERTIES NO_SONAME ON )
- 
--execute_process ( COMMAND ${PYTHON_EXECUTABLE} -c "from distutils import sysconfig; print( sysconfig.get_python_lib( plat_specific=True, prefix='${CMAKE_INSTALL_PREFIX}' ) )"
-+execute_process ( COMMAND ${PYTHON_EXECUTABLE} -c "import sysconfig; print( sysconfig.get_path( 'platlib', vars={'platbase': '${CMAKE_INSTALL_PREFIX}'} ) )"
-                   OUTPUT_VARIABLE _ABS_PYTHON_MODULE_PATH
-                   OUTPUT_STRIP_TRAILING_WHITESPACE )
- 
--- 
-1.7.1
-
diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index 6b825e8d88..414b0af0ed 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,6 +1,5 @@
-# Locally computed after checking the signature
-# https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.5.tar.bz2.sig
-sha256  7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7407ff194482eb049  libftdi1-1.5.tar.bz2
+# Locally computed
+sha256  9ff3b0845ed410ed940a6190fc4c11d549617de3dd4e4c4a959268eb920c18ec  libftdi1-v1.5-48-g22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03-git4.tar.gz
 
 # Hash for license files:
 sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 66798addc4..8a6db58476 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = 1.5
-LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
-LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
+LIBFTDI1_VERSION = v1.5-48-g22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03
+LIBFTDI1_SITE = git://developer.intra2net.com/libftdi
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
 LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
