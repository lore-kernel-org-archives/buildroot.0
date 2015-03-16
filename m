From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:16:45 +0100
Subject: [Buildroot] [git commit] toolchainfile.cmake: only search the
	sysroot for CMake module
Message-ID: <20150316212645.DA8F58015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=252e57cf16670e566b04a2d132b3ad199d0767f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change prevents CMake from searching outside the sysroot location
for CMake modules when cross-compiling.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/toolchainfile.cmake.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 816af13..cd41254 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -21,6 +21,7 @@ set(CMAKE_INSTALL_SO_NO_EXE 0)
 set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/usr/bin")
 set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
+set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
 set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
 set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
