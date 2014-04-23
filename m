From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:26 +0200
Subject: [Buildroot] [PATCH 07/14] pkg-cmake.mk: set additional variables in
	toolchainfile.cmake
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set binutils programs CMake variables in the toolchainfile.cmake file.

This variables must be cached, otherwise they are wrongly set, resulting
empty, which will make the builds fail.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/pkg-cmake.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 19f7843..d6dadbe 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -211,6 +211,14 @@ else()
 		set(CMAKE_CXX_COMPILER $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))g++)
 	endif()
 endif()
+
+set(CMAKE_LINKER  $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))ld      CACHE FILEPATH \"\" FORCE)
+set(CMAKE_AR      $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))ar      CACHE FILEPATH \"\" FORCE)
+set(CMAKE_RANLIB  $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))ranlib  CACHE FILEPATH \"\" FORCE)
+set(CMAKE_NM      $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))nm      CACHE FILEPATH \"\" FORCE)
+set(CMAKE_OBJCOPY $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))objcopy CACHE FILEPATH \"\" FORCE)
+set(CMAKE_OBJDUMP $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))objdump CACHE FILEPATH \"\" FORCE)
+set(CMAKE_STRIP   $(subst $(HOST_DIR),$${_HOST_DIR},$(TARGET_CROSS))strip   CACHE FILEPATH \"\" FORCE)
 endef
 
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
-- 
1.9.2
