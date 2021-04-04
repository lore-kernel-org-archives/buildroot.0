From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 16:30:48 +0200
Subject: [Buildroot] [PATCH 7/7] package/libvips: add webp optional
 dependency
In-Reply-To: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
References: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404143048.2308010-7-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 990d3f386f..7023b11119 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -26,7 +26,6 @@ LIBVIPS_CONF_OPTS = \
 	--without-OpenEXR \
 	--without-openslide \
 	--without-cfitsio \
-	--without-libwebp \
 	--without-pangoft2 \
 	--without-x
 LIBVIPS_INSTALL_STAGING = YES
@@ -132,6 +131,13 @@ else
 LIBVIPS_CONF_OPTS += --without-libexif
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
+LIBVIPS_CONF_OPTS += --with-libwebp
+LIBVIPS_DEPENDENCIES += webp
+else
+LIBVIPS_CONF_OPTS += --without-libwebp
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBVIPS_CONF_OPTS += --with-zlib
 LIBVIPS_DEPENDENCIES += zlib
-- 
2.30.2
