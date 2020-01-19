From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Jan 2020 10:52:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add opus support
Message-ID: <20200119095250.1564322-1-fontaine.fabrice@gmail.com>
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
index 6432954428..f5c51fadf3 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -32,7 +32,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
-	--disable-opus \
 	--disable-ext-sound \
 	--disable-g711-codec \
 	--disable-l16-codec \
@@ -72,6 +71,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+LIBPJSIP_DEPENDENCIES += opus
+LIBPJSIP_CONF_OPTS += --with-opus=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-opus
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 LIBPJSIP_CONF_OPTS += \
 	--enable-speex-aec \
-- 
2.24.1
