From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:51:49 +0100
Subject: [Buildroot] [git commit] Revert "vlc: fix some configure options"
Message-ID: <20140301135330.C1F389BAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f13e500e5970577e7abd96a0e9254a1e8f643f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 020047730b5a30491751b81f9bc7017818d29269.

The change of configuration option from --{enable,disable}-* to
--{with,without} was made because we autoreconf vlc, but some vlc m4
functions are overriden by functions coming from our pkg.m4. An
upcoming patch from Arnout fixes the problem in a better way by
renaming the problematic macro so that they have a different name
between their vlc specific variants and the pkg.m4 variants.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |   70 ++++++++++++++++++++++++++--------------------------
 1 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 23905df..e25f2d2 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -14,23 +14,23 @@ VLC_AUTORECONF = YES
 
 VLC_CONF_OPT += \
 	--disable-a52 \
-	--without-shout \
-	--without-twolame \
-	--without-dca \
-	--without-dirac \
-	--without-schroedinger \
-	--without-quicksync \
-	--without-fluidsynth \
+	--disable-shout \
+	--disable-twolame \
+	--disable-dca \
+	--disable-dirac \
+	--disable-schroedinger \
+	--disable-quicksync \
+	--disable-fluidsynth \
 	--disable-zvbi \
-	--without-kate \
-	--without-caca \
+	--disable-kate \
+	--disable-caca \
 	--disable-jack \
-	--without-samplerate \
-	--without-chromaprint \
-	--without-goom \
+	--disable-samplerate \
+	--disable-chromaprint \
+	--disable-goom \
 	--disable-projectm \
 	--disable-vsxu \
-	--without-mtp \
+	--disable-mtp \
 	--without-opencv
 
 # Building static and shared doesn't work, so force static off.
@@ -54,10 +54,10 @@ endif
 
 # bonjour support needs avahi-client, which needs avahi-daemon and dbus
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
-VLC_CONF_OPT += --with-bonjour
+VLC_CONF_OPT += --enable-bonjour
 VLC_DEPENDENCIES += avahi dbus
 else
-VLC_CONF_OPT += --without-bonjour
+VLC_CONF_OPT += --disable-bonjour
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
@@ -101,10 +101,10 @@ VLC_CONF_OPT += --disable-swscale
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
-VLC_CONF_OPT += --with-flac
+VLC_CONF_OPT += --enable-flac
 VLC_DEPENDENCIES += flac
 else
-VLC_CONF_OPT += --without-flac
+VLC_CONF_OPT += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D),y)
@@ -115,10 +115,10 @@ VLC_CONF_OPT += --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
-VLC_CONF_OPT += --with-opus
+VLC_CONF_OPT += --enable-opus
 VLC_DEPENDENCIES += opus
 else
-VLC_CONF_OPT += --without-opus
+VLC_CONF_OPT += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_LIBASS),y)
@@ -152,10 +152,10 @@ VLC_CONF_OPT += --disable-mod
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
-VLC_CONF_OPT += --with-libmpeg2
+VLC_CONF_OPT += --enable-libmpeg2
 VLC_DEPENDENCIES += libmpeg2
 else
-VLC_CONF_OPT += --without-libmpeg2
+VLC_CONF_OPT += --disable-libmpeg2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
@@ -166,31 +166,31 @@ VLC_CONF_OPT += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-VLC_CONF_OPT += --with-svg
+VLC_CONF_OPT += --enable-svg
 VLC_DEPENDENCIES += librsvg
 else
-VLC_CONF_OPT += --without-svg
+VLC_CONF_OPT += --disable-svg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
-VLC_CONF_OPT += --with-theora
+VLC_CONF_OPT += --enable-theora
 VLC_DEPENDENCIES += libtheora
 else
-VLC_CONF_OPT += --without-theora
+VLC_CONF_OPT += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUPNP),y)
-VLC_CONF_OPT += --with-upnp
+VLC_CONF_OPT += --enable-upnp
 VLC_DEPENDENCIES += libupnp
 else
-VLC_CONF_OPT += --without-upnp
+VLC_CONF_OPT += --disable-upnp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-VLC_CONF_OPT += --with-vorbis
+VLC_CONF_OPT += --enable-vorbis
 VLC_DEPENDENCIES += libvorbis
 else
-VLC_CONF_OPT += --without-vorbis
+VLC_CONF_OPT += --disable-vorbis
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
@@ -208,10 +208,10 @@ VLC_CONF_OPT += --disable-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-VLC_CONF_OPT += --with-libxml2
+VLC_CONF_OPT += --enable-libxml2
 VLC_DEPENDENCIES += libxml2
 else
-VLC_CONF_OPT += --without-libxml2
+VLC_CONF_OPT += --disable-libxml2
 endif
 
 # live555 installs a static library only, and vlc tries to link it into a
@@ -261,10 +261,10 @@ VLC_CONF_OPT += --disable-sdl-image
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
-VLC_CONF_OPT += --with-speex
+VLC_CONF_OPT += --enable-speex
 VLC_DEPENDENCIES += speex
 else
-VLC_CONF_OPT += --without-speex
+VLC_CONF_OPT += --disable-speex
 endif
 
 ifeq ($(BR2_PACKAGE_TREMOR),y)
@@ -275,10 +275,10 @@ VLC_CONF_OPT += --disable-tremor
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-VLC_CONF_OPT += --with-udev
+VLC_CONF_OPT += --enable-udev
 VLC_DEPENDENCIES += udev
 else
-VLC_CONF_OPT += --without-udev
+VLC_CONF_OPT += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
