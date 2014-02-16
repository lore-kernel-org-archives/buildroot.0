From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Feb 2014 11:05:01 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: use -fPIC
Message-ID: <1392545101-26953-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix build for lua-ev
http://autobuild.buildroot.org/results/730/7303fffa6075d02289b6fdb12a1debdf0dd7d6f1//build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-cmake.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index dbe0d97..f0b8e62 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -162,8 +162,8 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	set(CMAKE_SYSTEM_NAME Linux)\n\
 	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
 	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
-	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
-	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
+	set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS) -fPIC\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
+	set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS) -fPIC\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
 	set(CMAKE_INSTALL_SO_NO_EXE 0)\n\
 	set(CMAKE_PROGRAM_PATH \"$(HOST_DIR)/usr/bin\")\n\
 	set(CMAKE_FIND_ROOT_PATH \"$(STAGING_DIR)\")\n\
-- 
1.7.9.5
