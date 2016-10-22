From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:44:06 +0200
Subject: [Buildroot] [git commit] toolchainfile.cmake: fix description of
	CMAKE_Fortran_FLAGS_{DEBUG, RELEASE}
Message-ID: <20161022144426.AF4008050C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d2407b3e72b86807983f56c3b2ccdc1bec3a29b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/toolchainfile.cmake.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 8674653..e095356 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -57,8 +57,8 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
 set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
-  set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
-  set(CMAKE_Fortran_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
+  set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
+  set(CMAKE_Fortran_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release Fortran FLAGS")
   set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
   set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
 endif()
