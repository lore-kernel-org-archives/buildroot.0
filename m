From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 16:30:47 +0200
Subject: [Buildroot] [PATCH 6/7] package/libvips: add matio optional
 dependency
In-Reply-To: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
References: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404143048.2308010-6-fontaine.fabrice@gmail.com>
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
index 494392de7b..990d3f386f 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -25,7 +25,6 @@ LIBVIPS_CONF_OPTS = \
 	--without-gsf \
 	--without-OpenEXR \
 	--without-openslide \
-	--without-matio \
 	--without-cfitsio \
 	--without-libwebp \
 	--without-pangoft2 \
@@ -91,6 +90,13 @@ else
 LIBVIPS_CONF_OPTS += --without-rsvg
 endif
 
+ifeq ($(BR2_PACKAGE_MATIO),y)
+LIBVIPS_CONF_OPTS += --with-matio
+LIBVIPS_DEPENDENCIES += matio
+else
+LIBVIPS_CONF_OPTS += --without-matio
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 LIBVIPS_CONF_OPTS += --with-orc
 LIBVIPS_DEPENDENCIES += orc
-- 
2.30.2
