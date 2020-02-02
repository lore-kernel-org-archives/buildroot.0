From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 14:53:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add openh264 support
Message-ID: <20200202135352.3841459-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 86cd31fc81..655ab4498c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -35,7 +35,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-sdl \
 	--disable-ffmpeg \
-	--disable-openh264 \
 	--disable-ipp \
 	--disable-silk \
 	--with-external-srtp
@@ -69,6 +68,13 @@ LIBPJSIP_CONF_OPTS += \
 	--disable-gsm-codec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
+LIBPJSIP_DEPENDENCIES += libopenh264
+LIBPJSIP_CONF_OPTS += --with-openh264=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-openh264
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBPJSIP_DEPENDENCIES += libopenssl
 LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
-- 
2.24.1
