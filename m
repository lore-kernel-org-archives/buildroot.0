From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:30:40 +0100
Subject: [Buildroot] [git commit] pkg-cmake: Change -DNEBUG to -DNDEBUG
Message-ID: <20161106213052.93E06817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fb2263d29317ddb3f48113e340d3d7f6425423a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/toolchainfile.cmake.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
