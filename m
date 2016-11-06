From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Sun,  6 Nov 2016 21:05:13 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: Change -DNEBUG to -DNDEBUG
Message-ID: <1478462713-24310-1-git-send-email-Stefan.Nickl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

---
Seems like a typo, see assert(3) for the correct spelling.

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index e095356..d4252dd 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -25,8 +25,8 @@ set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 #   screwed up and there is nothing Buildroot can do about that :(
 set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
 set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
-set(CMAKE_C_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
-set(CMAKE_CXX_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CXXFLAGS")
+set(CMAKE_C_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CFLAGS")
+set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
 
 # Build type from the Buildroot configuration
 set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
@@ -36,7 +36,7 @@ set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configur
 # want to customize the compiler/linker flags, then:
 # * set them all on the cmake command line, e.g.:
 #     cmake -DCMAKE_C_FLAGS="@@TARGET_CFLAGS@@ -Dsome_custom_flag" ...
-# * and make sure the project's CMake code extendsthem like this if needed:
+# * and make sure the project's CMake code extends them like this if needed:
 #     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dsome_definitions")
 set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
 set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
@@ -58,7 +58,7 @@ set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
   set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
-  set(CMAKE_Fortran_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release Fortran FLAGS")
+  set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
   set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
   set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
 endif()
-- 
2.7.4
