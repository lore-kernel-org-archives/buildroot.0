From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 22:27:19 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: set CMAKE_SYSROOT variable
	in toolchainfile.cmake
Message-ID: <20160818202723.4FED78225C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8c3755676111dbd5c45d556da7982993e33e227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change enforces the CMAKE_SYSROOT value set in the toolchainfile.cmake.

This fix overrides the CMake heuristics used to guess it, and turns off some
non-desirable behavior adding "-isystem ..." flags to the compiler command
line, misleading the compiler and making the build failed due to some
unfound standard headers.

Fixes:
  http://autobuild.buildroot.net/results/f7e/f7e92678e91a6cb15ccf32d4a7d75b39f49d6000/defconfig
  (and others)

Cc: Ben Boeckel <mathstuf@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/toolchainfile.cmake.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index e550b8f..649b52d 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -19,6 +19,7 @@ set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE
 set(CMAKE_INSTALL_SO_NO_EXE 0)
 
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
+set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
 set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
