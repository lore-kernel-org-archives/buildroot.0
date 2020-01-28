From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jan 2020 23:22:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add opencore-amr support
Message-ID: <20200128222241.86898-1-fontaine.fabrice@gmail.com>
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
index 2e6c5abf08..84919fdc10 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -28,7 +28,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
 	--disable-resample \
 	--disable-video \
-	--disable-opencore-amr \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
@@ -77,6 +76,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-libsamplerate
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
+LIBPJSIP_DEPENDENCIES += opencore-amr
+LIBPJSIP_CONF_OPTS += --with-opencore-amr=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-opencore-amr
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 LIBPJSIP_DEPENDENCIES += opus
 LIBPJSIP_CONF_OPTS += --with-opus=$(STAGING_DIR)/usr
-- 
2.24.1
