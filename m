From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Thu, 23 Aug 2012 01:11:55 +0300
Subject: [Buildroot] [PATCH] freetype, libfuse, libpng, x11vnc,
	zlib: get rid of BR2_SOURCEFORGE_MIRROR
In-Reply-To: <1345673515-1719-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1345673515-1719-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1345673515-1719-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/freetype/freetype.mk |    2 +-
 package/libfuse/libfuse.mk   |    2 +-
 package/libpng/libpng.mk     |    2 +-
 package/x11vnc/x11vnc.mk     |    2 +-
 package/zlib/zlib.mk         |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 448efe0..2116cee 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -5,8 +5,8 @@
 #############################################################
 
 FREETYPE_VERSION = 2.4.10
-FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
+FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/${FREETYPE_VERSION}
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
index 6edabc4..171b616 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -6,8 +6,8 @@
 
 LIBPNG_VERSION = 1.4.12
 LIBPNG_SERIES = 14
-LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
+LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/${LIBPNG_VERSION}
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
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
index a9d4a8f..54915ad 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -6,7 +6,7 @@
 
 ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
-ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
+ZLIB_SITE = http://downloads.sourceforge.net/project/libpng/zlib/$(ZLIB_VERSION)
 ZLIB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-- 
1.7.7.6
