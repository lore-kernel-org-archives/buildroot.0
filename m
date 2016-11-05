From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:18:03 +0100
Subject: [Buildroot] [git commit branch/next] cmake: bump version to 3.6.3
Message-ID: <20161105123930.CC31380DB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99ed85d74081a8611a6f6d1f3d745a5c40aef975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/0001-rename_cmake_rootfile.patch | 28 ++++++++++++++++----------
 package/cmake/cmake.hash                       |  4 ++--
 package/cmake/cmake.mk                         |  4 ++--
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/package/cmake/0001-rename_cmake_rootfile.patch b/package/cmake/0001-rename_cmake_rootfile.patch
index 915b7e3..8c168c1 100644
--- a/package/cmake/0001-rename_cmake_rootfile.patch
+++ b/package/cmake/0001-rename_cmake_rootfile.patch
@@ -5,19 +5,25 @@ files are removed at build time via the target-finalize rule.
 This buildroot-specific patch makes sure ctest looks also for
 "Modules/CMake.cmake.ctest" before complaining
 
+[Vincent: tweak patch for 3.6.3]
+
 Signed-off-by: Davide Viti <zinosat@tiscali.it>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
---- cmake-3.0.2/Source/cmake.cxx~	2014-09-11 15:24:01.000000000 +0200
-+++ cmake-3.0.2/Source/cmake.cxx	2014-11-25 15:48:04.461033690 +0100
-@@ -957,7 +957,10 @@
-      "Path to cpack program executable.", cmCacheManager::INTERNAL);
+diff -rup a/Source/cmake.cxx b/Source/cmake.cxx
+--- a/Source/cmake.cxx	2016-07-07 15:47:27.000000000 +0100
++++ b/Source/cmake.cxx	2016-07-14 10:14:59.914265515 +0100
+@@ -771,7 +771,12 @@ int cmake::AddCMakePaths()
+                       "Path to cpack program executable.", cmState::INTERNAL);
  #endif
-   if(!cmSystemTools::FileExists(
--       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake").c_str()))
-+       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake").c_str()) &&
-+     !cmSystemTools::FileExists(
-+       (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest").c_str())
+   if (!cmSystemTools::FileExists(
+-        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake").c_str())) {
++        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake").c_str()) &&
++	!cmSystemTools::FileExists(
++	  (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest").c_str()
++        )
 +     )
-     {
++  {
      // couldn't find modules
-     cmSystemTools::Error("Could not find CMAKE_ROOT !!!\n"
+     cmSystemTools::Error(
+       "Could not find CMAKE_ROOT !!!\n"
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index e40d4ea..f846dc9 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,2 +1,2 @@
-# From http://www.cmake.org/files/v3.5/cmake-3.5.2-SHA-256.txt
-sha256	92d8410d3d981bb881dfff2aed466da55a58d34c7390d50449aa59b32bb5e62a	cmake-3.5.2.tar.gz
+# From http://www.cmake.org/files/v3.6/cmake-3.6.3-SHA-256.txt
+sha256 7d73ee4fae572eb2d7cd3feb48971aea903bb30a20ea5ae8b4da826d8ccad5fe  cmake-3.6.3.tar.gz
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 7a80c1b..fadb09e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.5
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION_MAJOR = 3.6
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
