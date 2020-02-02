From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 15:00:10 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add openh264 support
Message-ID: <20200202135030.EE974882E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ed187bf15b7dd6d9945211d1c0671ebba905d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
