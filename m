From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  8 Mar 2015 10:47:22 +0100
Subject: [Buildroot] [PATCH 3/4] toolchainfile.cmake: only search the
	sysroot for CMake module
In-Reply-To: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1425808043-32292-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change prevents CMake from searching outside the sysroot location
for CMake modules when cross-compiling.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
This patch is a better fix to [1] wrt the Arnout's comment [2]

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/117994.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-January/118154.html
---
 support/misc/toolchainfile.cmake.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.3.2
