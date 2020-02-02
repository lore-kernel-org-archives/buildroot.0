From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 21:54:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add ffmpeg support
Message-ID: <20200202205410.1785198-1-fontaine.fabrice@gmail.com>
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
index 7736a005af..e1c3b511e8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -33,7 +33,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
-	--disable-ffmpeg \
 	--disable-ipp \
 	--disable-silk \
 	--with-external-srtp
@@ -57,6 +56,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-bcg729
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBPJSIP_DEPENDENCIES += ffmpeg
+LIBPJSIP_CONF_OPTS += --with-ffmpeg=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-ffmpeg
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGSM),y)
 LIBPJSIP_CONF_OPTS += \
 	--enable-gsm-codec \
-- 
2.24.1
