From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu,  7 May 2015 16:58:19 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-plugins-bad: remove obsolete make rules
Message-ID: <1431010700-3356-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 83e29f2656a237e2c300d523776868837d3bc646 "gst1-plugins-bad: bump
version" (from 1.2.4 to 1.4.1) removed the configuration options for the
cdaudio and eglglessink plugins as a consequence of their removal in
1.3.1. However, that commit did not remove the corresponding make rules,
so remove them now.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 6280fd9..0e00ffd 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -544,13 +544,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-bz2
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-cdaudio
-GST1_PLUGINS_BAD_DEPENDENCIES += libcdaudio
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-cdaudio
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-curl
 GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
@@ -663,23 +656,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-eglgles
-GST1_PLUGINS_BAD_DEPENDENCIES += libegl libgles
-
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-# RPI has odd locations for several required headers.
-GST1_PLUGINS_BAD_CONF_OPTS += --with-egl-window-system=rpi
-GST1_PLUGINS_BAD_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) \
-	-I$(STAGING_DIR)/usr/include/IL \
-	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
-	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
-endif
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-eglgles
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
 GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdl
-- 
2.1.0
