From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Apr 2021 22:07:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/domoticz: drop first patch
Message-ID: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch not needed since commit 37f197f8634352750f169b6a287588a09b82e00e
which bumped host-cmake dependency from 3.10 to 3.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nd-placeholders-in-global-namespace.patch} |  0
 ...CMake-configuration-file-to-use-vers.patch | 55 -------------------
 ... 0002-Build-failure-with-python-3-9.patch} |  0
 ...=> 0003-Load-python-3-9-shared-libs.patch} |  0
 4 files changed, 55 deletions(-)
 rename package/domoticz/{0002-Avoid-deprecated-bind-placeholders-in-global-namespace.patch => 0001-Avoid-deprecated-bind-placeholders-in-global-namespace.patch} (100%)
 delete mode 100644 package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
 rename package/domoticz/{0003-Build-failure-with-python-3-9.patch => 0002-Build-failure-with-python-3-9.patch} (100%)
 rename package/domoticz/{0004-Load-python-3-9-shared-libs.patch => 0003-Load-python-3-9-shared-libs.patch} (100%)

diff --git a/package/domoticz/0002-Avoid-deprecated-bind-placeholders-in-global-namespace.patch b/package/domoticz/0001-Avoid-deprecated-bind-placeholders-in-global-namespace.patch
similarity index 100%
rename from package/domoticz/0002-Avoid-deprecated-bind-placeholders-in-global-namespace.patch
rename to package/domoticz/0001-Avoid-deprecated-bind-placeholders-in-global-namespace.patch
diff --git a/package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch b/package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
deleted file mode 100644
index 5393b0caf0..0000000000
--- a/package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 2cd95289939b4a7c2576176c7f6268028aa093b2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 24 May 2019 21:50:16 +0200
-Subject: [PATCH] Revert "Updating CMake configuration file to use
- version 3.14 as minimum and added boost dependency targets"
-
-This reverts commit 4e4ee999c4b323514c0ba81ab1ff3afb10d2f1cd to avoid
-bumping host-cmake requirement version from 3.8 to 3.14 in buildroot.
-
-[Fabrice: Updated for 2020.1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c5b7832ff..a21f5b87b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
--#set to minimum version that supports clean build
--cmake_minimum_required(VERSION 3.14.0)
-+#set to minimum version that supports clean build on cygwin
-+cmake_minimum_required(VERSION 2.8.4)
- 
- project(domoticz)
- 
-@@ -583,6 +583,7 @@ set(Boost_USE_STATIC_LIBS ${USE_STATIC_BOOST})
- set(Boost_USE_MULTITHREADED ON)
- unset(Boost_INCLUDE_DIR CACHE)
- unset(Boost_LIBRARY_DIRS CACHE)
-+find_package(Boost REQUIRED COMPONENTS thread system)
- 
- if(USE_STATIC_BOOST)
-    message(STATUS "Linking against boost static libraries")
-@@ -590,16 +591,6 @@ else(USE_STATIC_BOOST)
-    message(STATUS "Linking against boost dynamic libraries")
- endif(USE_STATIC_BOOST)
- 
--find_package(Boost REQUIRED COMPONENTS thread system)
--if(Boost_FOUND)
--    MESSAGE(STATUS "BOOST libraries found at: ${Boost_LIBRARY_DIRS}")
--    MESSAGE(STATUS "Boost includes found at: ${Boost_INCLUDE_DIR}")
--else(Boost_FOUND)
--    MESSAGE(FATAL_ERROR "Boost thread/system library not found on your system, try to get this installed.")
--endif(Boost_FOUND)
--
--target_link_libraries(domoticz Boost::thread Boost::system)
--
- # compare found vs required libBoost version
- if(Boost_VERSION VERSION_LESS DOMO_MIN_LIBBOOST_VERSION)
-    message(FATAL_ERROR "Found libBoost version ${Boost_VERSION}, ${DOMO_MIN_LIBBOOST_VERSION} or newer required")
--- 
-2.20.1
-
diff --git a/package/domoticz/0003-Build-failure-with-python-3-9.patch b/package/domoticz/0002-Build-failure-with-python-3-9.patch
similarity index 100%
rename from package/domoticz/0003-Build-failure-with-python-3-9.patch
rename to package/domoticz/0002-Build-failure-with-python-3-9.patch
diff --git a/package/domoticz/0004-Load-python-3-9-shared-libs.patch b/package/domoticz/0003-Load-python-3-9-shared-libs.patch
similarity index 100%
rename from package/domoticz/0004-Load-python-3-9-shared-libs.patch
rename to package/domoticz/0003-Load-python-3-9-shared-libs.patch
-- 
2.30.2
