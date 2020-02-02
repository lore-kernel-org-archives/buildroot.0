From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 12:19:14 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add libyuv support
Message-ID: <20200202111010.7118C88277@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5c292a765ba42b79027bc565d26b88ac2b57912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
