From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 15:29:34 +0100
Subject: [Buildroot] [git commit] vlc: fix some configure options
Message-ID: <20140227144133.5925F9BB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=020047730b5a30491751b81f9bc7017818d29269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a large number of incorrect configure options for vlc.

Configure warnings reported by Arnout Vandecappelle, in his analysis of vlc
autobuild failures.

Notice that this change of configure options is caused by our AUTORECONF
picking up a different PKG_WITH_MODULES definition.  If vlc is bumped in the
future and AUTORECONF is turned off, then this needs to be reverted.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |   70 ++++++++++++++++++++++++++--------------------------
 1 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 0e76e11..9bcedd1 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -14,23 +14,23 @@ VLC_AUTORECONF = YES
 
 VLC_CONF_OPT += \
 	--disable-a52 \
-	--disable-shout \
-	--disable-twolame \
-	--disable-dca \
-	--disable-dirac \
-	--disable-schroedinger \
-	--disable-quicksync \
-	--disable-fluidsynth \
+	--without-shout \
+	--without-twolame \
+	--without-dca \
+	--without-dirac \
+	--without-schroedinger \
+	--without-quicksync \
+	--without-fluidsynth \
 	--disable-zvbi \
-	--disable-kate \
-	--disable-caca \
+	--without-kate \
+	--without-caca \
 	--disable-jack \
-	--disable-samplerate \
-	--disable-chromaprint \
-	--disable-goom \
+	--without-samplerate \
+	--without-chromaprint \
+	--without-goom \
 	--disable-projectm \
 	--disable-vsxu \
-	--disable-mtp \
+	--without-mtp \
 	--without-opencv
 
 # Set powerpc altivec appropriately
@@ -49,10 +49,10 @@ endif
 
 # bonjour support needs avahi-client, which needs avahi-daemon and dbus
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
-VLC_CONF_OPT += --enable-bonjour
+VLC_CONF_OPT += --with-bonjour
 VLC_DEPENDENCIES += avahi dbus
 else
-VLC_CONF_OPT += --disable-bonjour
+VLC_CONF_OPT += --without-bonjour
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
@@ -96,10 +96,10 @@ VLC_CONF_OPT += --disable-swscale
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
-VLC_CONF_OPT += --enable-flac
+VLC_CONF_OPT += --with-flac
 VLC_DEPENDENCIES += flac
 else
-VLC_CONF_OPT += --disable-flac
+VLC_CONF_OPT += --without-flac
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D),y)
@@ -110,10 +110,10 @@ VLC_CONF_OPT += --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
-VLC_CONF_OPT += --enable-opus
+VLC_CONF_OPT += --with-opus
 VLC_DEPENDENCIES += opus
 else
-VLC_CONF_OPT += --disable-opus
+VLC_CONF_OPT += --without-opus
 endif
 
 ifeq ($(BR2_PACKAGE_LIBASS),y)
@@ -147,10 +147,10 @@ VLC_CONF_OPT += --disable-mod
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
-VLC_CONF_OPT += --enable-libmpeg2
+VLC_CONF_OPT += --with-libmpeg2
 VLC_DEPENDENCIES += libmpeg2
 else
-VLC_CONF_OPT += --disable-libmpeg2
+VLC_CONF_OPT += --without-libmpeg2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
@@ -161,31 +161,31 @@ VLC_CONF_OPT += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-VLC_CONF_OPT += --enable-svg
+VLC_CONF_OPT += --with-svg
 VLC_DEPENDENCIES += librsvg
 else
-VLC_CONF_OPT += --disable-svg
+VLC_CONF_OPT += --without-svg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
-VLC_CONF_OPT += --enable-theora
+VLC_CONF_OPT += --with-theora
 VLC_DEPENDENCIES += libtheora
 else
-VLC_CONF_OPT += --disable-theora
+VLC_CONF_OPT += --without-theora
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUPNP),y)
-VLC_CONF_OPT += --enable-upnp
+VLC_CONF_OPT += --with-upnp
 VLC_DEPENDENCIES += libupnp
 else
-VLC_CONF_OPT += --disable-upnp
+VLC_CONF_OPT += --without-upnp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-VLC_CONF_OPT += --enable-vorbis
+VLC_CONF_OPT += --with-vorbis
 VLC_DEPENDENCIES += libvorbis
 else
-VLC_CONF_OPT += --disable-vorbis
+VLC_CONF_OPT += --without-vorbis
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
@@ -203,10 +203,10 @@ VLC_CONF_OPT += --disable-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-VLC_CONF_OPT += --enable-libxml2
+VLC_CONF_OPT += --with-libxml2
 VLC_DEPENDENCIES += libxml2
 else
-VLC_CONF_OPT += --disable-libxml2
+VLC_CONF_OPT += --without-libxml2
 endif
 
 ifeq ($(BR2_PACKAGE_LIVE555),y)
@@ -254,10 +254,10 @@ VLC_CONF_OPT += --disable-sdl-image
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
-VLC_CONF_OPT += --enable-speex
+VLC_CONF_OPT += --with-speex
 VLC_DEPENDENCIES += speex
 else
-VLC_CONF_OPT += --disable-speex
+VLC_CONF_OPT += --without-speex
 endif
 
 ifeq ($(BR2_PACKAGE_TREMOR),y)
@@ -268,10 +268,10 @@ VLC_CONF_OPT += --disable-tremor
 endif
 
 ifeq ($(BR2_PACKAGE_UDEV),y)
-VLC_CONF_OPT += --enable-udev
+VLC_CONF_OPT += --with-udev
 VLC_DEPENDENCIES += udev
 else
-VLC_CONF_OPT += --disable-udev
+VLC_CONF_OPT += --without-udev
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
