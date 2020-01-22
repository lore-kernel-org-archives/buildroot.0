From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Jan 2020 20:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add libsamplerate support
Message-ID: <20200122192944.116833-1-fontaine.fabrice@gmail.com>
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
index f5c51fadf3..2e6c5abf08 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,7 +36,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
 	--disable-v4l2 \
@@ -71,6 +70,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+LIBPJSIP_DEPENDENCIES += libsamplerate
+LIBPJSIP_CONF_OPTS += --enable-libsamplerate
+else
+LIBPJSIP_CONF_OPTS += --disable-libsamplerate
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 LIBPJSIP_DEPENDENCIES += opus
 LIBPJSIP_CONF_OPTS += --with-opus=$(STAGING_DIR)/usr
-- 
2.24.1
