From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 Jan 2020 19:11:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add v4l2 support
Message-ID: <20200131181136.1137678-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a6012ba58b..a9febcf9c6 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -26,7 +26,6 @@ LIBPJSIP_CONF_ENV = \
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
-	--disable-video \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
@@ -36,7 +35,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-sdl \
 	--disable-ffmpeg \
-	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
 	--disable-ipp \
@@ -89,6 +87,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-libsamplerate
 endif
 
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+# --enable-v4l2 is broken (check for libv4l2 will be omitted)
+LIBPJSIP_DEPENDENCIES += libv4l
+else
+LIBPJSIP_CONF_OPTS += --disable-v4l2
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
 LIBPJSIP_DEPENDENCIES += opencore-amr
 LIBPJSIP_CONF_OPTS += --with-opencore-amr=$(STAGING_DIR)/usr
-- 
2.24.1
