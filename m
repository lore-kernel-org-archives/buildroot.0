From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:31:33 +0200
Subject: [Buildroot] [git commit] freetype, libfuse, libpng, x11vnc,
	zlib: get rid of BR2_SOURCEFORGE_MIRROR
Message-ID: <20120824213335.D227597183@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=721f339053217e04c6455cbbefec20dab47ec949
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.mk |    2 +-
 package/libfuse/libfuse.mk   |    2 +-
 package/libpng/libpng.mk     |    2 +-
 package/x11vnc/x11vnc.mk     |    2 +-
 package/zlib/zlib.mk         |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 448efe0..796c37c 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -5,8 +5,8 @@
 #############################################################
 
 FREETYPE_VERSION = 2.4.10
-FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
+FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = host-pkg-config \
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 5f748b4..246697f 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -6,7 +6,7 @@
 
 LIBFUSE_VERSION = 2.9.0
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
+LIBFUSE_SITE = http://downloads.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
 
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_CONF_OPT= --disable-nls \
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1c1a087..3bcd1b8 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -6,8 +6,8 @@
 
 LIBPNG_VERSION = 1.4.12
 LIBPNG_SERIES = 14
-LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
+LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 06d3f0d..e96b665 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -5,7 +5,7 @@
 #############################################################
 X11VNC_VERSION = 0.9.3
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
-X11VNC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver
+X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
 X11VNC_CONF_OPT = \
 	--without-avahi
 
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 2ddab62..f127138 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -6,7 +6,7 @@
 
 ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
-ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
+ZLIB_SITE = http://downloads.sourceforge.net/project/libpng/zlib/$(ZLIB_VERSION)
 ZLIB_LICENSE = zlib license
 ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
