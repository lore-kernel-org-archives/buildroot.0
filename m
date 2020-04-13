From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:18:54 +0200
Subject: [Buildroot] [git commit] package/libglfw: bump version to 3.3.2
Message-ID: <20200413200524.85A8F8EB19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4aa6345bebce882dd4b3b2dc6e5ffe61440cf937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.glfw.org/changelog.html

Updated license hash due to upstream commit:
https://github.com/glfw/glfw/commit/f764836e58ec47b7e105687630c75f8161ffcaa8

xlib_libXi is now a mandatory dependency:
https://github.com/glfw/glfw/commit/9cc83cf07f47ac8acf46ae12f0f9312fe39cfd6e
https://github.com/glfw/glfw/commit/b383e70021bc875e6fb5c1a693e5aa85fbc160d5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglfw/Config.in    | 1 +
 package/libglfw/libglfw.hash | 4 ++--
 package/libglfw/libglfw.mk   | 8 ++------
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
index 045bd269e4..06f4376453 100644
--- a/package/libglfw/Config.in
+++ b/package/libglfw/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGLFW
 	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	help
diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 6796b81368..c21a595bbc 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 81bf5fde487676a8af55cb317830703086bb534c53968d71936e7b48ee5a0f3e  libglfw-3.3.tar.gz
-sha256 8ea14fdc7efee7fe53c79101b97049bd547dc6686cfa05df4f0686146a561423  LICENSE.md
+sha256  98768e12e615fbe9f3386f5bbfeb91b5a3b45a8c4c77159cef06b1f6ff749537  libglfw-3.3.2.tar.gz
+sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index aac5b1799d..63d2a88bf8 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.3
+LIBGLFW_VERSION = 3.3.2
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
-	xlib_libXinerama xlib_libXrandr
+	xlib_libXi xlib_libXinerama xlib_libXrandr
 LIBGLFW_LICENSE = Zlib
 LIBGLFW_LICENSE_FILES = LICENSE.md
 
@@ -17,10 +17,6 @@ LIBGLFW_CONF_OPTS += \
 	-DGLFW_BUILD_TESTS=OFF \
 	-DGLFW_BUILD_DOCS=OFF
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-LIBGLFW_DEPENDENCIES += xlib_libXi
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 LIBGLFW_DEPENDENCIES += xlib_libXxf86vm
 endif
