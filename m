From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:44:37 +0200
Subject: [Buildroot] [git commit] package/libvips: add matio optional
 dependency
Message-ID: <20210404141921.DACC280F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0a45860b8287c5e84a03fc84ac108f83b9a6624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
