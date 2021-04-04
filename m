From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:44:38 +0200
Subject: [Buildroot] [git commit] package/libvips: add webp optional
 dependency
Message-ID: <20210404141921.E8FA380F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f252f6063596910aadbcfdea7b18d6c89e2987b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
