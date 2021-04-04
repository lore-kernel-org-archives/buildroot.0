From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:44:36 +0200
Subject: [Buildroot] [git commit] package/libvips: add lcms2 optional
 dependency
Message-ID: <20210404141921.CE1738C6FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f26d142e35b15b63e0de0b3550e0e05a952e181e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/libvips.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 304861ab83..494392de7b 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -23,7 +23,6 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
 LIBVIPS_CONF_OPTS = \
 	--without-dmalloc \
 	--without-gsf \
-	--without-lcms \
 	--without-OpenEXR \
 	--without-openslide \
 	--without-matio \
@@ -71,6 +70,13 @@ else
 LIBVIPS_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBVIPS_CONF_OPTS += --with-lcms
+LIBVIPS_DEPENDENCIES += lcms2
+else
+LIBVIPS_CONF_OPTS += --without-lcms
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LIBVIPS_CONF_OPTS += --with-png
 LIBVIPS_DEPENDENCIES += libpng
