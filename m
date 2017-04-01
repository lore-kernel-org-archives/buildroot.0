From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:35:02 +0200
Subject: [Buildroot] [git commit] packages: use SPDX short identifier for
	zlib license
Message-ID: <20170401134426.437C482617@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2093053106e3c3c791ed3f9f954c7435fc940f2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for zlib license is Zlib.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/zlib( )?(license)?/Zlib/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bullet/bullet.mk         | 2 +-
 package/libglfw/libglfw.mk       | 2 +-
 package/minizip/minizip.mk       | 2 +-
 package/physfs/physfs.mk         | 2 +-
 package/sdl2/sdl2.mk             | 2 +-
 package/sdl2_gfx/sdl2_gfx.mk     | 2 +-
 package/sdl2_image/sdl2_image.mk | 2 +-
 package/sdl2_ttf/sdl2_ttf.mk     | 2 +-
 package/sdl_gfx/sdl_gfx.mk       | 2 +-
 package/sdl_image/sdl_image.mk   | 2 +-
 package/sdl_mixer/sdl_mixer.mk   | 2 +-
 package/sdl_net/sdl_net.mk       | 2 +-
 package/sdl_ttf/sdl_ttf.mk       | 2 +-
 package/tinyxml/tinyxml.mk       | 2 +-
 package/tinyxml2/tinyxml2.mk     | 2 +-
 package/zlib/zlib.mk             | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 99ff423..920ea87 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -7,7 +7,7 @@
 BULLET_VERSION = 2.85.1
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
-BULLET_LICENSE = zlib license
+BULLET_LICENSE = Zlib
 BULLET_LICENSE_FILES = LICENSE.txt
 
 # Disable demos apps and unit tests.
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 0b1730d..1e42404 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -9,7 +9,7 @@ LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
 	xlib_libXinerama xlib_libXrandr
-LIBGLFW_LICENSE = zlib
+LIBGLFW_LICENSE = Zlib
 LIBGLFW_LICENSE_FILES = COPYING.txt
 
 LIBGLFW_CONF_OPTS += \
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 3d61288..835dfb9 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -10,7 +10,7 @@ MINIZIP_DEPENDENCIES = zlib
 MINIZIP_AUTORECONF = YES
 MINIZIP_INSTALL_STAGING = YES
 MINIZIP_CONF_OPTS = $(if $(BR2_PACKAGE_MINIZIP_DEMOS),--enable-demos)
-MINIZIP_LICENSE = zlib license
+MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
diff --git a/package/physfs/physfs.mk b/package/physfs/physfs.mk
index c88d7cf..9193ad5 100644
--- a/package/physfs/physfs.mk
+++ b/package/physfs/physfs.mk
@@ -8,7 +8,7 @@ PHYSFS_VERSION = be27dfd07d97336145e7f49d3fd200a6e902f85e
 PHYSFS_SITE = https://hg.icculus.org/icculus/physfs
 PHYSFS_SITE_METHOD = hg
 
-PHYSFS_LICENSE = zlib license (physfs), LGPL with exceptions (lzma)
+PHYSFS_LICENSE = Zlib (physfs), LGPL with exceptions (lzma)
 PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/LGPL.txt
 
 PHYSFS_INSTALL_STAGING = YES
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 628d906..1db4e76 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -7,7 +7,7 @@
 SDL2_VERSION = 2.0.5
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
-SDL2_LICENSE = zlib
+SDL2_LICENSE = Zlib
 SDL2_LICENSE_FILES = COPYING.txt
 SDL2_INSTALL_STAGING = YES
 SDL2_CONFIG_SCRIPTS = sdl2-config
diff --git a/package/sdl2_gfx/sdl2_gfx.mk b/package/sdl2_gfx/sdl2_gfx.mk
index 975bca7..1ec1387 100644
--- a/package/sdl2_gfx/sdl2_gfx.mk
+++ b/package/sdl2_gfx/sdl2_gfx.mk
@@ -7,7 +7,7 @@
 SDL2_GFX_VERSION = 1.0.1
 SDL2_GFX_SOURCE = SDL2_gfx-$(SDL2_GFX_VERSION).tar.gz
 SDL2_GFX_SITE = http://www.ferzkopp.net/Software/SDL2_gfx
-SDL2_GFX_LICENSE = zlib
+SDL2_GFX_LICENSE = Zlib
 SDL2_GFX_LICENSE_FILES = COPYING SDL2_framerate.h
 SDL2_GFX_INSTALL_STAGING = YES
 SDL2_GFX_DEPENDENCIES = sdl2 host-pkgconf
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index cf3b738..71a9634 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -8,7 +8,7 @@ SDL2_IMAGE_VERSION = 2.0.1
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-SDL2_IMAGE_LICENSE = zlib
+SDL2_IMAGE_LICENSE = Zlib
 SDL2_IMAGE_LICENSE_FILES = COPYING.txt
 
 # Unconditionally enable support for image formats that don't require
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 86916c3..dbe30dd 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -7,7 +7,7 @@
 SDL2_TTF_VERSION = 2.0.14
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
-SDL2_TTF_LICENSE = zlib
+SDL2_TTF_LICENSE = Zlib
 SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index 7f3a2ff..e7420de 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -8,7 +8,7 @@ SDL_GFX_VERSION_MAJOR = 2.0
 SDL_GFX_VERSION = $(SDL_GFX_VERSION_MAJOR).23
 SDL_GFX_SOURCE = SDL_gfx-$(SDL_GFX_VERSION).tar.gz
 SDL_GFX_SITE = http://www.ferzkopp.net/Software/SDL_gfx-$(SDL_GFX_VERSION_MAJOR)
-SDL_GFX_LICENSE = zlib
+SDL_GFX_LICENSE = Zlib
 SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
 SDL_GFX_DEPENDENCIES = sdl
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index f88aa0e..6ea657b 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -8,7 +8,7 @@ SDL_IMAGE_VERSION = 1.2.12
 SDL_IMAGE_SOURCE = SDL_image-$(SDL_IMAGE_VERSION).tar.gz
 SDL_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL_IMAGE_INSTALL_STAGING = YES
-SDL_IMAGE_LICENSE = zlib
+SDL_IMAGE_LICENSE = Zlib
 SDL_IMAGE_LICENSE_FILES = COPYING
 
 SDL_IMAGE_CONF_OPTS = \
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 897b308..1c6912a 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -7,7 +7,7 @@
 SDL_MIXER_VERSION = 1.2.12
 SDL_MIXER_SOURCE = SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
 SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
-SDL_MIXER_LICENSE = zlib
+SDL_MIXER_LICENSE = Zlib
 SDL_MIXER_LICENSE_FILES = COPYING
 
 SDL_MIXER_INSTALL_STAGING = YES
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 4534dee..c7e409a 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -7,7 +7,7 @@
 SDL_NET_VERSION = 1.2.8
 SDL_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
-SDL_NET_LICENSE = zlib
+SDL_NET_LICENSE = Zlib
 SDL_NET_LICENSE_FILES = COPYING
 
 SDL_NET_CONF_OPTS = \
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 3e494b4..1d94c6c 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -7,7 +7,7 @@
 SDL_TTF_VERSION = 2.0.11
 SDL_TTF_SOURCE = SDL_ttf-$(SDL_TTF_VERSION).tar.gz
 SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
-SDL_TTF_LICENSE = zlib
+SDL_TTF_LICENSE = Zlib
 SDL_TTF_LICENSE_FILES = COPYING
 
 SDL_TTF_INSTALL_STAGING = YES
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index df7b29f..1528051 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -10,7 +10,7 @@ TINYXML_SITE = http://mirrors.xbmc.org/build-deps/sources
 # configure.ac which is not present in mainline.
 TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
-TINYXML_LICENSE = zlib
+TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
 
 $(eval $(autotools-package))
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 053e46e..461c36c 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -6,7 +6,7 @@
 
 TINYXML2_VERSION = 3.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
-TINYXML2_LICENSE = zlib
+TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
 TINYXML2_INSTALL_STAGING = YES
 
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index deea5a5..23c6e95 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -7,7 +7,7 @@
 ZLIB_VERSION = 1.2.11
 ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
 ZLIB_SITE = http://www.zlib.net
-ZLIB_LICENSE = zlib license
+ZLIB_LICENSE = Zlib
 ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
 
