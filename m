From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 11:45:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add libyuv support
Message-ID: <20200202104557.3342451-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a9febcf9c6..86cd31fc81 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,7 +36,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-sdl \
 	--disable-ffmpeg \
 	--disable-openh264 \
-	--disable-libyuv \
 	--disable-ipp \
 	--disable-silk \
 	--with-external-srtp
@@ -94,6 +93,15 @@ else
 LIBPJSIP_CONF_OPTS += --disable-v4l2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBYUV),y)
+LIBPJSIP_DEPENDENCIES += libyuv
+LIBPJSIP_CONF_OPTS += \
+	--enable-libyuv \
+	--with-external-yuv
+else
+LIBPJSIP_CONF_OPTS += --disable-libyuv
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
 LIBPJSIP_DEPENDENCIES += opencore-amr
 LIBPJSIP_CONF_OPTS += --with-opencore-amr=$(STAGING_DIR)/usr
-- 
2.24.1
