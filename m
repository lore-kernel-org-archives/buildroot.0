Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08885C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 110F44F5A6;
	Fri, 28 Feb 2025 16:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnOQ7Cld8AV0; Fri, 28 Feb 2025 16:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C62BF4F625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62BF4F625;
	Fri, 28 Feb 2025 16:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A2C01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B3854255E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spgBLxqucAdz for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A68C41A26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A68C41A26
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 034ED820F8; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 16:25:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1f4b4ccde7ceb379010aeb93458792202622d64b
X-Git-Newrev: 6744f0e9368d940f22a58b5981d9659e1a63f206
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.034ED820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fluent-bit: bump to
 3.2.2
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
Content-Type: multipart/mixed; boundary="===============1923775014612707744=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1923775014612707744==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6744f0e9368d940f22a58b5981d9659e1a63f206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

News:

https://fluentbit.io/announcements/v3.2.2/
https://fluentbit.io/announcements/v3.2.1/
https://fluentbit.io/announcements/v3.2.0/
https://fluentbit.io/announcements/v3.1.10/
https://fluentbit.io/announcements/v3.1.9/
https://fluentbit.io/announcements/v3.1.8/
https://fluentbit.io/announcements/v3.1.7/
https://fluentbit.io/announcements/v3.1.6/
https://fluentbit.io/announcements/v3.1.5/
https://fluentbit.io/announcements/v3.1.4/

Support has been added for (some) system provided libraries,
see:
 - https://github.com/fluent/fluent-bit/pull/7286
 - https://github.com/fluent/fluent-bit/pull/8930

The c-ares and nghttp2 package are always needed, so use
the buildroot shipped versions. Also allow the usage of
libbacktrace and jemalloc.

A bunch of new compile fixes have been added,
all of them are proposed upstream for review.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...d-use-the-system-provided-LuaJIT-if-found.patch | 62 ---------------
 ...ka-CMakeLists.txt-allow-compilation-with.patch} | 12 ++-
 ...d-disable-cxx-support-for-librdkafka-7741.patch | 27 +++++++
 ...txt-disable-cxx-support-for-librdkafka-77.patch | 29 -------
 ...-CMakeLists.txt-do-not-require-a-CXX-comp.patch | 91 ++++++++++++++++++++++
 ...cmake-CMakeLists.txt-do-not-require-a-CXX.patch | 37 +++++++++
 ...ing-write-gs-base-with-cmake-variable-30.patch} |  4 +-
 ...out-_kafka-CMakeLists.txt-fix-cross-compi.patch | 48 ++++++++++++
 ...ib-cprofiles-fix-wrong-pointer-assignment.patch | 81 +++++++++++++++++++
 package/fluent-bit/Config.in                       |  2 +
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   | 29 +++++--
 12 files changed, 318 insertions(+), 106 deletions(-)

diff --git a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
deleted file mode 100644
index aca6401ac8..0000000000
--- a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8d6f6cfb07a8fe32dc0b9577e1b2f1ee1b67b736 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Fri, 28 Apr 2023 10:25:16 +0200
-Subject: [PATCH] build: use the system provided LuaJIT if found
-
-e.g. buildroot has logic to build luajit,
-so if pkg_check_modules can find a suitable version,
-then use that one if -DFLB_PREFER_SYSTEM_LIBS=Yes.
-
-Upstream: https://github.com/fluent/fluent-bit/pull/7286
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- CMakeLists.txt     | 12 +++++++++++-
- src/CMakeLists.txt |  2 +-
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2da792d53..3229420c6 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -128,6 +128,7 @@ option(FLB_TESTS_INTERNAL_FUZZ "Enable internal fuzz tests"    No)
- option(FLB_TESTS_OSSFUZZ       "Enable OSS-Fuzz build"         No)
- option(FLB_MTRACE              "Enable mtrace support"         No)
- option(FLB_POSIX_TLS           "Force POSIX thread storage"    No)
-+option(FLB_PREFER_SYSTEM_LIBS  "Prefer system installed libraries" No)
- option(FLB_INOTIFY             "Enable inotify support"       Yes)
- option(FLB_SQLDB               "Enable SQL embedded DB"       Yes)
- option(FLB_HTTP_SERVER         "Enable HTTP Server"           Yes)
-@@ -1023,7 +1024,16 @@ endif()
- # LuaJIT (Scripting Support)
- # ==========================
- if(FLB_LUAJIT)
--  include(cmake/luajit.cmake)
-+  if(FLB_PREFER_SYSTEM_LIBS)
-+    find_package(PkgConfig)
-+    pkg_check_modules(LUAJIT luajit>=2.1.0)
-+  endif()
-+  if(LUAJIT_FOUND)
-+    include_directories(${LUAJIT_INCLUDE_DIRS})
-+  else()
-+    include(cmake/luajit.cmake)
-+    set(LUAJIT_LIBRARIES "libluajit")
-+  endif()
-   FLB_DEFINITION(FLB_HAVE_LUAJIT)
- endif()
- 
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index b6233d9f7..67baec456 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -221,7 +221,7 @@ endif()
- if(FLB_LUAJIT)
-   set(extra_libs
-     ${extra_libs}
--    "libluajit")
-+    ${LUAJIT_LIBRARIES})
- endif()
- 
- if(FLB_SQLDB)
--- 
-2.34.1
-
diff --git a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
similarity index 92%
rename from package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
rename to package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
index fd3d9ce722..e144642c93 100644
--- a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
+++ b/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
@@ -1,4 +1,4 @@
-From 29be5275f6f7e15aca768e9b235998abc5a604e2 Mon Sep 17 00:00:00 2001
+From c44256c95f5703dd627413f17c6ad250073898d9 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
 Subject: [PATCH] lib: librdkafka: CMakeLists.txt: allow compilation without
@@ -7,13 +7,11 @@ Subject: [PATCH] lib: librdkafka: CMakeLists.txt: allow compilation without
 e.g. fluent-bit is a c-only library, so allow compilation without cxx
 
 Upstream: https://github.com/confluentinc/librdkafka/pull/4366
-Upstream: https://github.com/fluent/fluent-bit/pull/7765
+Upstream: https://github.com/fluent/fluent-bit/pull/9277
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
-[Fabrice: update for 3.1.3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- lib/librdkafka-2.3.0/CMakeLists.txt          | 18 ++++++++++--
- lib/librdkafka-2.3.0/examples/CMakeLists.txt | 31 +++++++++++++-------
+ lib/librdkafka-2.4.0/CMakeLists.txt          | 18 ++++++++++--
+ lib/librdkafka-2.4.0/examples/CMakeLists.txt | 31 +++++++++++++-------
  2 files changed, 35 insertions(+), 14 deletions(-)
 
 diff --git a/lib/librdkafka-2.4.0/CMakeLists.txt b/lib/librdkafka-2.4.0/CMakeLists.txt
@@ -116,5 +114,5 @@ index 8c0079abe..c9336b729 100644
 +    endif()
  endif(NOT WIN32)
 -- 
-2.34.1
+2.43.0
 
diff --git a/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch b/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
new file mode 100644
index 0000000000..ec8be4dfc6
--- /dev/null
+++ b/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
@@ -0,0 +1,27 @@
+From 0dc955cd15cc0b09a1d557131fae59842cb2bbd8 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 25 Jul 2023 10:00:36 +0200
+Subject: [PATCH] build: disable cxx support for librdkafka #7741
+
+Fluent-bit is c only, so no need to compile cxx.
+This fixes also a compile error in buildroot.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/9277
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ cmake/kafka.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cmake/kafka.cmake b/cmake/kafka.cmake
+index 3a0ebfed2..af0e2f460 100644
+--- a/cmake/kafka.cmake
++++ b/cmake/kafka.cmake
+@@ -1,4 +1,5 @@
+ # kafka cmake
++FLB_OPTION(RDKAFKA_BUILD_CXX      Off)
+ FLB_OPTION(RDKAFKA_BUILD_STATIC    On)
+ FLB_OPTION(RDKAFKA_BUILD_EXAMPLES Off)
+ FLB_OPTION(RDKAFKA_BUILD_TESTS    Off)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch b/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
deleted file mode 100644
index c96a7bdaa0..0000000000
--- a/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7f3fc55b734db2d28af63c393b52bc238af9f20a Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Tue, 25 Jul 2023 10:00:36 +0200
-Subject: [PATCH] CMakeLists.txt: disable cxx support for librdkafka #7741
-
-Fluent-bit is c only, so no need to compile cxx.
-This fixes also a compile error in buildroot.
-
-Upstream: https://github.com/fluent/fluent-bit/pull/7765
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3229420c6..2694f189f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -979,6 +979,7 @@ if(FLB_BACKTRACE)
- endif()
- 
- if(FLB_IN_KAFKA OR FLB_OUT_KAFKA)
-+    FLB_OPTION(RDKAFKA_BUILD_CXX      Off)
-     FLB_OPTION(RDKAFKA_BUILD_STATIC    On)
-     FLB_OPTION(RDKAFKA_BUILD_EXAMPLES Off)
-     FLB_OPTION(RDKAFKA_BUILD_TESTS    Off)
--- 
-2.34.1
-
diff --git a/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch b/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
new file mode 100644
index 0000000000..b68062de4f
--- /dev/null
+++ b/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
@@ -0,0 +1,91 @@
+From 8a9aed874fc41973d007f5145eca85e261f2bb35 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 25 Aug 2024 20:09:21 +0200
+Subject: [PATCH] lib: nghttp2: CMakeLists.txt: do not require a CXX compiler
+
+Upstream: https://github.com/nghttp2/nghttp2/commit/d9d266124c9f851bab7927321da6637d930367e2
+Upstream: https://github.com/fluent/fluent-bit/pull/9277
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/nghttp2/CMakeLists.txt | 50 ++++++++++++++++++++------------------
+ 1 file changed, 26 insertions(+), 24 deletions(-)
+
+diff --git a/lib/nghttp2/CMakeLists.txt b/lib/nghttp2/CMakeLists.txt
+index ee4cb0a4a..90c00b1dd 100644
+--- a/lib/nghttp2/CMakeLists.txt
++++ b/lib/nghttp2/CMakeLists.txt
+@@ -24,7 +24,7 @@
+ 
+ cmake_minimum_required(VERSION 3.0)
+ # XXX using 1.8.90 instead of 1.9.0-DEV
+-project(nghttp2 VERSION 1.58.90)
++project(nghttp2 VERSION 1.58.90 LANGUAGES C)
+ 
+ # See versioning rule:
+ #  https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
+@@ -122,29 +122,31 @@ else()
+   set(HINT_NORETURN)
+ endif()
+ 
+-include(ExtractValidFlags)
+-foreach(_cxx1x_flag -std=c++14)
+-  extract_valid_cxx_flags(_cxx1x_flag_supported ${_cxx1x_flag})
+-  if(_cxx1x_flag_supported)
+-    set(CXX1XCXXFLAGS ${_cxx1x_flag})
+-    break()
+-  endif()
+-endforeach()
++if(NOT ENABLE_LIB_ONLY)
++  include(ExtractValidFlags)
++  foreach(_cxx1x_flag -std=c++14)
++    extract_valid_cxx_flags(_cxx1x_flag_supported ${_cxx1x_flag})
++    if(_cxx1x_flag_supported)
++      set(CXX1XCXXFLAGS ${_cxx1x_flag})
++      break()
++    endif()
++  endforeach()
+ 
+-include(CMakePushCheckState)
+-include(CheckCXXSourceCompiles)
+-cmake_push_check_state()
+-set(CMAKE_REQUIRED_DEFINITIONS "${CXX1XCXXFLAGS}")
+-# Check that std::future is available.
+-check_cxx_source_compiles("
+-#include <vector>
+-#include <future>
+-int main() { std::vector<std::future<int>> v; }" HAVE_STD_FUTURE)
+-# Check that std::map::emplace is available for g++-4.7.
+-check_cxx_source_compiles("
+-#include <map>
+-int main() { std::map<int, int>().emplace(1, 2); }" HAVE_STD_MAP_EMPLACE)
+-cmake_pop_check_state()
++  include(CMakePushCheckState)
++  include(CheckCXXSourceCompiles)
++  cmake_push_check_state()
++  set(CMAKE_REQUIRED_DEFINITIONS "${CXX1XCXXFLAGS}")
++  # Check that std::future is available.
++  check_cxx_source_compiles("
++  #include <vector>
++  #include <future>
++  int main() { std::vector<std::future<int>> v; }" HAVE_STD_FUTURE)
++  # Check that std::map::emplace is available for g++-4.7.
++  check_cxx_source_compiles("
++  #include <map>
++  int main() { std::map<int, int>().emplace(1, 2); }" HAVE_STD_MAP_EMPLACE)
++  cmake_pop_check_state()
++endif()
+ 
+ 
+ # Checks for libraries.
+@@ -177,7 +179,7 @@ endif()
+ # openssl (for src)
+ include(CheckSymbolExists)
+ set(HAVE_OPENSSL    ${OPENSSL_FOUND})
+-if(OPENSSL_FOUND)
++if(NOT ENABLE_LIB_ONLY AND OPENSSL_FOUND)
+   set(OPENSSL_INCLUDE_DIRS  ${OPENSSL_INCLUDE_DIR})
+   cmake_push_check_state()
+   set(CMAKE_REQUIRED_INCLUDES   "${OPENSSL_INCLUDE_DIR}")
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch b/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
new file mode 100644
index 0000000000..c9c5662405
--- /dev/null
+++ b/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
@@ -0,0 +1,37 @@
+From ac870a2e2de899bcc8b6818b97404479da6d0663 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 25 Aug 2024 20:10:27 +0200
+Subject: [PATCH] lib: luajit-cmake: CMakeLists.txt: do not require a CXX
+ compiler
+
+Upstream: https://github.com/fluent/fluent-bit/pull/9277
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/luajit-cmake/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/luajit-cmake/CMakeLists.txt b/lib/luajit-cmake/CMakeLists.txt
+index 7baf878c7..051a800f5 100644
+--- a/lib/luajit-cmake/CMakeLists.txt
++++ b/lib/luajit-cmake/CMakeLists.txt
+@@ -13,7 +13,7 @@ endif()
+ 
+ get_directory_property(hasParent PARENT_DIRECTORY)
+ if(LUAJIT_DIR)
+-  project(luajit)
++  project(luajit LANGUAGES C)
+   include(LuaJIT.cmake)
+   if (hasParent)
+     set(LUA_TARGET $<TARGET_FILE:luajit> PARENT_SCOPE)
+@@ -24,7 +24,7 @@ if(LUAJIT_DIR)
+     endif()
+   endif()
+ elseif(LUA_DIR)
+-  project(lua)
++  project(lua LANGUAGES C)
+   include(lua.cmake)
+   if (hasParent)
+     set(LUA_TARGET $<TARGET_FILE:lua> PARENT_SCOPE)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch b/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
similarity index 98%
rename from package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
rename to package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
index 9cdab4c47a..4446238bd3 100644
--- a/package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
+++ b/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
@@ -1,4 +1,4 @@
-From 7eacb2ab839e74cb07038398def5e3cc198448d4 Mon Sep 17 00:00:00 2001
+From e17ce6ddcb4dc1cd3081eabfb94a1cdc224f4d69 Mon Sep 17 00:00:00 2001
 From: Wenyong Huang <wenyong.huang@intel.com>
 Date: Tue, 23 Jan 2024 12:21:20 +0800
 Subject: [PATCH] Enhance setting write gs base with cmake variable (#3066)
@@ -95,5 +95,5 @@ index e73ebc85f..a61a522f3 100644
  endif ()
  if (WAMR_CONFIGUABLE_BOUNDS_CHECKS EQUAL 1)
 -- 
-2.34.1
+2.43.0
 
diff --git a/package/fluent-bit/0006-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch b/package/fluent-bit/0006-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
new file mode 100644
index 0000000000..4083753a3e
--- /dev/null
+++ b/package/fluent-bit/0006-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
@@ -0,0 +1,48 @@
+From 7e8bb790cba0619af9e8d80e947f7cda0910caaa Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 16 Nov 2024 19:46:28 +0100
+Subject: [PATCH] plugins/{in,out}_kafka/CMakeLists.txt: fix cross compile
+ error
+
+KAFKA_INCLUDEDIR is not set if FLB_PREFER_SYSTEM_LIB_KAFKA is not used,
+when cross-compiling, it just translates to -I/librdkafka, which is not allowed.
+Fix this by only including KAFKA_INCLUDEDIR if really set.
+
+x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/librdkafka'
+
+Upstream: https://github.com/fluent/fluent-bit/pull/9600
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ plugins/in_kafka/CMakeLists.txt  | 4 +++-
+ plugins/out_kafka/CMakeLists.txt | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/in_kafka/CMakeLists.txt b/plugins/in_kafka/CMakeLists.txt
+index ede0831f9..02e2dc786 100644
+--- a/plugins/in_kafka/CMakeLists.txt
++++ b/plugins/in_kafka/CMakeLists.txt
+@@ -3,5 +3,7 @@ set(src
+   )
+ 
+ FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES})
+-target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
++if(DEFINED KAFKA_INCLUDEDIR)
++  target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
++endif()
+ target_link_libraries(flb-plugin-in_kafka -lpthread)
+diff --git a/plugins/out_kafka/CMakeLists.txt b/plugins/out_kafka/CMakeLists.txt
+index 01c96529b..54b14fc2a 100644
+--- a/plugins/out_kafka/CMakeLists.txt
++++ b/plugins/out_kafka/CMakeLists.txt
+@@ -5,5 +5,7 @@ set(src
+   kafka.c)
+ 
+ FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES})
+-target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
++if(DEFINED KAFKA_INCLUDEDIR)
++  target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
++endif()
+ target_link_libraries(flb-plugin-out_kafka -lpthread)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0007-lib-cprofiles-fix-wrong-pointer-assignment.patch b/package/fluent-bit/0007-lib-cprofiles-fix-wrong-pointer-assignment.patch
new file mode 100644
index 0000000000..033b5d428a
--- /dev/null
+++ b/package/fluent-bit/0007-lib-cprofiles-fix-wrong-pointer-assignment.patch
@@ -0,0 +1,81 @@
+From 6f474716432ca3ddae2ce989d9cdcdc9145c3959 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sat, 16 Nov 2024 20:55:37 +0100
+Subject: [PATCH] lib: cprofiles: fix wrong pointer assignment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The wrong struct types were used. Typo?
+
+/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c: In function ‘cprof_profile_destroy’:
+/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c:160:18: error: assignment to ‘struct cprof_mapping *’ from incompatible pointer type ‘struct cprof_location *’ [-Wincompatible-pointer-types]
+  160 |         location = cfl_list_entry(iterator,
+      |                  ^
+/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c:166:32: error: passing argument 1 of ‘cprof_location_destroy’ from incompatible pointer type [-Wincompatible-pointer-types]
+  166 |         cprof_location_destroy(location);
+      |                                ^~~~~~~~
+      |                                |
+      |                                struct cprof_mapping *
+In file included from /home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/src/cprof_profile.c:21:
+/home/thomas/br-test-pkg/bootlin-armv7-glibc/build/fluent-bit-3.2.0/lib/cprofiles/include/cprofiles/cprofiles.h:304:52: note: expected ‘struct cprof_location *’ but argument is of type ‘struct cprof_mapping *’
+  304 | void cprof_location_destroy(struct cprof_location *instance);
+      |                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
+
+Upstream: https://github.com/fluent/cprofiles/pull/3
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/cprofiles/src/cprof_encode_text.c | 6 +++---
+ lib/cprofiles/src/cprof_profile.c     | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/cprofiles/src/cprof_encode_text.c b/lib/cprofiles/src/cprof_encode_text.c
+index 218a72b5b..ab2d6247d 100644
+--- a/lib/cprofiles/src/cprof_encode_text.c
++++ b/lib/cprofiles/src/cprof_encode_text.c
+@@ -1909,7 +1909,7 @@ static int encode_cprof_resource_profiles(
+                 struct cprof_resource_profiles *instance) {
+     int result;
+     struct cfl_list             *iterator;
+-    struct cprof_scope_profile *scope_profile;
++    struct cprof_scope_profiles *scope_profiles;
+ 
+     result = encode_string(context,
+                             CFL_TRUE,
+@@ -1958,11 +1958,11 @@ static int encode_cprof_resource_profiles(
+ 
+         cfl_list_foreach(iterator,
+                          &instance->scope_profiles) {
+-            scope_profile = cfl_list_entry(
++            scope_profiles = cfl_list_entry(
+                                 iterator,
+                                 struct cprof_scope_profiles, _head);
+ 
+-            result = encode_cprof_scope_profiles(context, scope_profile);
++            result = encode_cprof_scope_profiles(context, scope_profiles);
+ 
+             if (result != CPROF_ENCODE_TEXT_SUCCESS) {
+                 return result;
+diff --git a/lib/cprofiles/src/cprof_profile.c b/lib/cprofiles/src/cprof_profile.c
+index 66d62b361..931457ef7 100644
+--- a/lib/cprofiles/src/cprof_profile.c
++++ b/lib/cprofiles/src/cprof_profile.c
+@@ -98,7 +98,7 @@ void cprof_profile_destroy(struct cprof_profile *instance)
+     struct cfl_list             *iterator_backup;
+     struct cprof_attribute_unit *attribute_unit;
+     struct cprof_value_type     *value_type;
+-    struct cprof_mapping        *location;
++    struct cprof_location       *location;
+     struct cprof_function       *function;
+     struct cfl_list             *iterator;
+     struct cprof_mapping        *mapping;
+@@ -307,4 +307,4 @@ int cprof_profile_add_comment(struct cprof_profile *profile, int64_t comment)
+     profile->comments_count++;
+ 
+     return 0;
+-}
+\ No newline at end of file
++}
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 697cb1bf15..420e40c9c4 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_NGHTTP2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index a3dbf5f544..57e5272ec0 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c745066223811047e3911c19db118eadec579ca62ef833a1b1fb573acd8cb85  fluent-bit-3.1.3.tar.gz
+sha256  3abcd7eda1a26fe79f1d715491bafcca77d0186cc46d1d8465157790358f827d  fluent-bit-3.2.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 10e639a3d5..31f62db7c7 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.1.3
+FLUENT_BIT_VERSION = 3.2.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
+FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml nghttp2 openssl
+
+FLUENT_BIT_CMAKE_BACKEND = ninja
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
@@ -18,8 +20,8 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_SECURITY=No \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
-	-DFLB_PREFER_SYSTEM_LIBS=Yes \
-	-DFLB_BACKTRACE=No
+	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
 FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
@@ -37,8 +39,25 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBACKTRACE),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_BACKTRACE=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_BACKTRACE=Yes
+FLUENT_BIT_DEPENDENCIES += libbacktrace
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_BACKTRACE=No
+endif
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_JEMALLOC=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_JEMALLOC=Yes
+FLUENT_BIT_DEPENDENCIES += jemalloc
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_JEMALLOC=No
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
-FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
+FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_LUAJIT=Yes
 FLUENT_BIT_DEPENDENCIES += luajit
 else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No

--===============1923775014612707744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1923775014612707744==--
