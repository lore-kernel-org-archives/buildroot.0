Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181FDC77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 16:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A0561535;
	Wed,  3 May 2023 16:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A0561535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ap6U4sbkOjBC; Wed,  3 May 2023 16:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5006461549;
	Wed,  3 May 2023 16:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5006461549
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451D41BF3FF
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F0A940524
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 16:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F0A940524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8_aTAGzi-RY for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 16:45:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E2374023B
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E2374023B
 for <buildroot@buildroot.org>; Wed,  3 May 2023 16:45:06 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout02.t-online.de (Postfix) with SMTP id 4C54CB947
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:45:02 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.39]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1puFb9-2vCP6v0; Wed, 3 May 2023 18:44:59 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:51960)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1puFb9-0002ho-0Y
 for buildroot@buildroot.org; Wed, 03 May 2023 18:44:59 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 18:44:49 +0200
Message-Id: <20230503164458.747478-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503164458.747478-1-bernd.kuhls@t-online.de>
References: <20230503164458.747478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683132299-E9FF8C73-50BECFFB/0/0 CLEAN NORMAL
X-TOI-MSGID: 43025052-ba31-4bac-9c40-18dc1fc8b779
Subject: [Buildroot] [PATCH 02/11] package/kodi: bump version to 20.1-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replaced patch 0002 to fix python detection with new version due to
upstream changes:
https://github.com/xbmc/xbmc/pull/21597#issuecomment-1166365667

Removed patches which were applied upstream.

Bump gcc requirement as kodi depends on C++17.
Rework configure options.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-jsonschemabuilder.mk                 |   2 +-
 .../kodi-texturepacker/kodi-texturepacker.mk  |   2 +-
 package/kodi/0002-cmake-findpython.patch      | 135 ------------------
 package/kodi/0002-fix-findpython.patch        |  16 +++
 ...-cmake-search-for-python-interpreter.patch |  48 -------
 ...-allow-to-override-PYTHON_EXECUTABLE.patch |  39 -----
 package/kodi/Config.in                        |   6 +-
 package/kodi/kodi.hash                        |   8 +-
 package/kodi/kodi.mk                          |  16 ++-
 9 files changed, 35 insertions(+), 237 deletions(-)
 delete mode 100644 package/kodi/0002-cmake-findpython.patch
 create mode 100644 package/kodi/0002-fix-findpython.patch
 delete mode 100644 package/kodi/0003-cmake-search-for-python-interpreter.patch
 delete mode 100644 package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index a13fb91afe..72a2f05bd6 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 19.5-Matrix
+KODI_JSONSCHEMABUILDER_VERSION = 20.1-Nexus
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 9432e4bbd6..cb6b04d069 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 19.5-Matrix
+KODI_TEXTUREPACKER_VERSION = 20.1-Nexus
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0002-cmake-findpython.patch b/package/kodi/0002-cmake-findpython.patch
deleted file mode 100644
index 60728aa465..0000000000
--- a/package/kodi/0002-cmake-findpython.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 52f44ec5c7b728a6afaca867e8d815fced2012ec Mon Sep 17 00:00:00 2001
-From: fuzzard <fuzzard@kodi.tv>
-Date: Sat, 31 Jul 2021 19:22:08 +1000
-Subject: [PATCH] [cmake] findpython
-
-use cmakes (3.12+) FindPython3 module.
-Provide cmake vars for user to overide specific version, and search path
-
-Backport of https://github.com/xbmc/xbmc/pull/20045
-
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/20989
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt                 |  4 +-
- cmake/modules/FindPython.cmake | 71 ++++++++++++++++++++++++++--------
- 2 files changed, 56 insertions(+), 19 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2d5369798d..9bed54ef40 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.4)
-+cmake_minimum_required(VERSION 3.12)
- if(WIN32)
-   # Version 3.15 is required to use "PREPEND" for dependencies
-   cmake_minimum_required(VERSION 3.15)
-@@ -187,8 +187,6 @@ core_require_dep(${required_deps})
- find_package(TexturePacker REQUIRED)
- find_package(JsonSchemaBuilder REQUIRED)
- 
--SET(PYTHON_VERSION 3.8)
--
- if(ENABLE_MARIADBCLIENT AND NOT ENABLE_MARIADBCLIENT STREQUAL AUTO AND ENABLE_MYSQLCLIENT AND NOT ENABLE_MYSQLCLIENT STREQUAL AUTO)
-   MESSAGE(FATAL_ERROR "You can not use MySql and MariaDB at the same time. Disable one by adding -DENABLE_MYSQLCLIENT=OFF or -DENABLE_MARIADBCLIENT=OFF.")
- elseif(ENABLE_MYSQLCLIENT AND NOT ENABLE_MYSQLCLIENT STREQUAL AUTO)
-diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
-index c40e12d551..35220b5426 100644
---- a/cmake/modules/FindPython.cmake
-+++ b/cmake/modules/FindPython.cmake
-@@ -1,17 +1,56 @@
--# - Try to find python
--# Once done this will define
-+# FindPython
-+# --------
-+# Finds Python3 libraries
-+#
-+# This module will search for the required python libraries on the system
-+# If multiple versions are found, the highest version will be used.
-+#
-+# --------
-+#
-+# the following variables influence behaviour:
-+#
-+# PYTHON_PATH - use external python not found in system paths
-+#               usage: -DPYTHON_PATH=/path/to/python/lib
-+# PYTHON_VER - use exact python version, fail if not found
-+#               usage: -DPYTHON_VER=3.8
-+#
-+# --------
-+#
-+# This module will define the following variables:
- #
- # PYTHON_FOUND - system has PYTHON
-+# PYTHON_VERSION - Python version number (Major.Minor)
- # PYTHON_INCLUDE_DIRS - the python include directory
- # PYTHON_LIBRARIES - The python libraries
-+# PYTHON_LDFLAGS - Python provided link options
-+#
-+# --------
-+#
-+
-+# for Depends builds, set search root dir to depends path
-+if(KODI_DEPENDSBUILD)
-+  set(Python3_USE_STATIC_LIBS TRUE)
-+  set(Python3_ROOT_DIR ${DEPENDS_PATH}/lib)
-+endif()
-+
-+# Provide root dir to search for Python if provided
-+if(PYTHON_PATH)
-+  set(Python3_ROOT_DIR ${PYTHON_PATH})
-+
-+  # unset cache var so we can generate again with a different dir (or none) if desired
-+  unset(PYTHON_PATH CACHE)
-+endif()
-+
-+# Set specific version of Python to find if provided
-+if(PYTHON_VER)
-+  set(VERSION ${PYTHON_VER})
-+  set(EXACT_VER "EXACT")
- 
--if(PKG_CONFIG_FOUND)
--  pkg_check_modules(PC_PYTHON python3>=3.5 QUIET)
-+  # unset cache var so we can generate again with a different ver (or none) if desired
-+  unset(PYTHON_VER CACHE)
- endif()
- 
--find_program(PYTHON_EXECUTABLE python3 ONLY_CMAKE_FIND_ROOT_PATH)
--find_library(PYTHON_LIBRARY NAMES python3.9 python3.8 python3.7 python3.6 python3.5 PATHS ${PC_PYTHON_LIBDIR})
--find_path(PYTHON_INCLUDE_DIR NAMES Python.h PATHS ${PC_PYTHON_INCLUDE_DIRS} PATH_SUFFIXES python3.9 python3.8 python3.7 python3.6 python3.5)
-+find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Development)
- 
- if(KODI_DEPENDSBUILD)
-   find_library(FFI_LIBRARY ffi REQUIRED)
-@@ -27,17 +66,17 @@ if(KODI_DEPENDSBUILD)
-     endif()
-   endif()
- 
--  set(PYTHON_LIBRARIES ${PYTHON_LIBRARY} ${FFI_LIBRARY} ${EXPAT_LIBRARY} ${INTL_LIBRARY} ${GMP_LIBRARY} ${PYTHON_DEP_LIBRARIES})
--else()
--  find_package(PythonLibs 3.5 REQUIRED)
--  list(APPEND PYTHON_LIBRARIES ${PC_PYTHON_STATIC_LIBRARIES})
-+  list(APPEND Python3_LIBRARIES ${FFI_LIBRARY} ${EXPAT_LIBRARY} ${INTL_LIBRARY} ${GMP_LIBRARY} ${PYTHON_DEP_LIBRARIES})
- endif()
- 
--include(FindPackageHandleStandardArgs)
--find_package_handle_standard_args(Python REQUIRED_VARS PYTHON_INCLUDE_DIR PYTHON_LIBRARY PYTHON_LIBRARIES)
--if(PYTHON_FOUND)
--  set(PYTHON_INCLUDE_DIRS ${PYTHON_INCLUDE_DIR})
-+if(Python3_FOUND)
-   list(APPEND PYTHON_DEFINITIONS -DHAS_PYTHON=1)
-+  # These are all set for easy integration with the rest of our build system
-+  set(PYTHON_FOUND ${Python3_FOUND})
-+  set(PYTHON_INCLUDE_DIRS ${Python3_INCLUDE_DIRS})
-+  set(PYTHON_LIBRARIES ${Python3_LIBRARIES})
-+  set(PYTHON_VERSION "${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}" CACHE INTERNAL "" FORCE)
-+  set(PYTHON_LDFLAGS ${Python3_LINK_OPTIONS})
- endif()
- 
--mark_as_advanced(PYTHON_EXECUTABLE PYTHON_INCLUDE_DIRS PYTHON_INCLUDE_DIR PYTHON_LIBRARY PYTHON_LIBRARIES PYTHON_LDFLAGS FFI_LIBRARY EXPAT_LIBRARY INTL_LIBRARY GMP_LIBRARY)
-+mark_as_advanced(PYTHON_EXECUTABLE PYTHON_VERSION PYTHON_INCLUDE_DIRS PYTHON_LDFLAGS FFI_LIBRARY EXPAT_LIBRARY INTL_LIBRARY GMP_LIBRARY)
--- 
-2.30.2
-
diff --git a/package/kodi/0002-fix-findpython.patch b/package/kodi/0002-fix-findpython.patch
new file mode 100644
index 0000000000..03926e7b85
--- /dev/null
+++ b/package/kodi/0002-fix-findpython.patch
@@ -0,0 +1,16 @@
+Fix python detection
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xbmc-20.0rc1-Nexus.orig/cmake/modules/FindPython.cmake xbmc-20.0rc1-Nexus/cmake/modules/FindPython.cmake
+--- xbmc-20.0rc1-Nexus.orig/cmake/modules/FindPython.cmake	2022-12-10 05:39:56.000000000 +0100
++++ xbmc-20.0rc1-Nexus/cmake/modules/FindPython.cmake	2022-12-10 10:43:25.796686397 +0100
+@@ -60,7 +60,7 @@
+ 
+ find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Development)
+ if(CORE_SYSTEM_NAME STREQUAL linux)
+-  if(HOST_CAN_EXECUTE_TARGET)
++  if(HOST_CAN_EXECUTE_TARGET OR DEFINED PYTHON_EXECUTABLE)
+     find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Interpreter)
+   else()
+     find_package(Python3 COMPONENTS Interpreter)
diff --git a/package/kodi/0003-cmake-search-for-python-interpreter.patch b/package/kodi/0003-cmake-search-for-python-interpreter.patch
deleted file mode 100644
index 158345a212..0000000000
--- a/package/kodi/0003-cmake-search-for-python-interpreter.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6bb112e585f2ffd10e5af70ca28159dd235d063b Mon Sep 17 00:00:00 2001
-From: wsnipex <wsnipex@a1.net>
-Date: Thu, 19 Aug 2021 08:50:05 +0200
-Subject: [PATCH] [cmake] search for python interpreter fixes installing
- eventclients on linux
-
-Backport of https://github.com/xbmc/xbmc/pull/20058
-
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/20989
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- cmake/modules/FindPython.cmake | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
-index 35220b5426..c469ed9fb6 100644
---- a/cmake/modules/FindPython.cmake
-+++ b/cmake/modules/FindPython.cmake
-@@ -20,6 +20,7 @@
- #
- # PYTHON_FOUND - system has PYTHON
- # PYTHON_VERSION - Python version number (Major.Minor)
-+# PYTHON_EXECUTABLE - Python interpreter binary
- # PYTHON_INCLUDE_DIRS - the python include directory
- # PYTHON_LIBRARIES - The python libraries
- # PYTHON_LDFLAGS - Python provided link options
-@@ -51,6 +52,9 @@ if(PYTHON_VER)
- endif()
- 
- find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Development)
-+if(CORE_SYSTEM_NAME STREQUAL linux)
-+  find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Interpreter)
-+endif()
- 
- if(KODI_DEPENDSBUILD)
-   find_library(FFI_LIBRARY ffi REQUIRED)
-@@ -73,6 +77,7 @@ if(Python3_FOUND)
-   list(APPEND PYTHON_DEFINITIONS -DHAS_PYTHON=1)
-   # These are all set for easy integration with the rest of our build system
-   set(PYTHON_FOUND ${Python3_FOUND})
-+  set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE FILEPATH "Python interpreter" FORCE)
-   set(PYTHON_INCLUDE_DIRS ${Python3_INCLUDE_DIRS})
-   set(PYTHON_LIBRARIES ${Python3_LIBRARIES})
-   set(PYTHON_VERSION "${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}" CACHE INTERNAL "" FORCE)
--- 
-2.30.2
-
diff --git a/package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch b/package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch
deleted file mode 100644
index d1e9b3f25f..0000000000
--- a/package/kodi/0004-cmake-allow-to-override-PYTHON_EXECUTABLE.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 25681d8adde4a90d5da02051e30f6a3a27322136 Mon Sep 17 00:00:00 2001
-From: Jernej Skrabec <jernej.skrabec@gmail.com>
-Date: Sat, 25 Sep 2021 07:41:10 +0200
-Subject: [PATCH] [cmake] allow to override PYTHON_EXECUTABLE
-
-If Kodi is being build for distro which has different python version
-than host, PYTHON_EXECUTABLE must be overriden and point to distro
-version. Otherwise, eventclients will be installed in wrong location and
-be thus unusable.
-
-Use case: Cross compiling Kodi for LibreELEC
-
-Backport of https://github.com/xbmc/xbmc/pull/20171
-
-Patch sent upstream: https://github.com/xbmc/xbmc/pull/20989
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- cmake/modules/FindPython.cmake | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
-index c469ed9fb6..87b8368705 100644
---- a/cmake/modules/FindPython.cmake
-+++ b/cmake/modules/FindPython.cmake
-@@ -77,7 +77,9 @@ if(Python3_FOUND)
-   list(APPEND PYTHON_DEFINITIONS -DHAS_PYTHON=1)
-   # These are all set for easy integration with the rest of our build system
-   set(PYTHON_FOUND ${Python3_FOUND})
--  set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE FILEPATH "Python interpreter" FORCE)
-+  if(NOT PYTHON_EXECUTABLE)
-+    set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE FILEPATH "Python interpreter" FORCE)
-+  endif()
-   set(PYTHON_INCLUDE_DIRS ${Python3_INCLUDE_DIRS})
-   set(PYTHON_LIBRARIES ${Python3_LIBRARIES})
-   set(PYTHON_VERSION "${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}" CACHE INTERNAL "" FORCE)
--- 
-2.30.2
-
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 283e25561c..e7488316dd 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -5,12 +5,12 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	depends on BR2_USE_MMU # libcdio, and others
 
-comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.9"
+comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 9.x"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| BR2_TOOLCHAIN_USES_MUSL \
 		|| !BR2_PACKAGE_PYTHON3 \
 		|| BR2_PACKAGE_PYTHON3_PYC_ONLY
@@ -55,7 +55,7 @@ menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_WCHAR
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index e0f548879e..ea9a588aeb 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  56e0074f27f08496b2a21af5704a15378a2f0979ae3e9fa9a50a2630d0313d19  kodi-19.5-Matrix.tar.gz
-sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
-sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
-sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
+sha256  cd4158b2bc2d9593ad2f5c1cd2494957ab726b13d8379bbfb09d7d36df7b7d7e  kodi-20.1-Nexus.tar.gz
+sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
+sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
+sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
 sha256  9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index d8c1130ea4..5cbb257161 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,8 +6,8 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 19.5
-KODI_VERSION_NAME = Matrix
+KODI_VERSION_MAJOR = 20.1
+KODI_VERSION_NAME = Nexus
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
@@ -57,9 +57,9 @@ KODI_DEPENDENCIES = \
 	zlib
 
 # taken from tools/depends/target/*/*-VERSION
-KODI_LIBDVDCSS_VERSION = 1.4.2-Leia-Beta-5
-KODI_LIBDVDNAV_VERSION = 6.0.0-Leia-Alpha-3
-KODI_LIBDVDREAD_VERSION = 6.0.0-Leia-Alpha-3
+KODI_LIBDVDCSS_VERSION = 1.4.3-Next-Nexus-Alpha2-2
+KODI_LIBDVDNAV_VERSION = 6.1.1-Next-Nexus-Alpha2-2
+KODI_LIBDVDREAD_VERSION = 6.1.3-Next-Nexus-Alpha2-2
 KODI_EXTRA_DOWNLOADS += \
 	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
@@ -74,11 +74,15 @@ KODI_CONF_OPTS += \
 	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
 	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc \
+	-DENABLE_INTERNAL_RapidJSON=OFF \
+	-DENABLE_INTERNAL_SPDLOG=OFF \
 	-DKODI_DEPENDSBUILD=OFF \
-	-DENABLE_LDGOLD=OFF \
+	-DENABLE_GOLD=OFF \
+	-DHOST_CAN_EXECUTE_TARGET=FALSE \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
 	-DENABLE_TESTING=OFF \
+	-DENABLE_DEBUGFISSION=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
 	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
