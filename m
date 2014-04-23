From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:21 +0200
Subject: [Buildroot] [PATCH 02/14] pkg-cmake.mk: remove unneeded quotes in
	the generated toolchainfile.cmake
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Buildroot does not support space in paths (at least neither in the
Buildroot installation location, nor in the output directory).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/pkg-cmake.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index edda14a..963a423 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -167,10 +167,10 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
 	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
-	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
-	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
+	set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
+	set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
 	set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
-	set(ENV{PKG_CONFIG_SYSROOT_DIR} \"$(STAGING_DIR)\")\n\
+	set(ENV{PKG_CONFIG_SYSROOT_DIR} $(STAGING_DIR))\n\
 	" > $@
-- 
1.9.2
