From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 16:30:45 +0200
Subject: [Buildroot] [PATCH 4/7] package/libvips: add orc optional dependency
In-Reply-To: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
References: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404143048.2308010-4-fontaine.fabrice@gmail.com>
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
index 7e8b705dd2..304861ab83 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -23,7 +23,6 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
 LIBVIPS_CONF_OPTS = \
 	--without-dmalloc \
 	--without-gsf \
-	--without-orc \
 	--without-lcms \
 	--without-OpenEXR \
 	--without-openslide \
@@ -86,6 +85,13 @@ else
 LIBVIPS_CONF_OPTS += --without-rsvg
 endif
 
+ifeq ($(BR2_PACKAGE_ORC),y)
+LIBVIPS_CONF_OPTS += --with-orc
+LIBVIPS_DEPENDENCIES += orc
+else
+LIBVIPS_CONF_OPTS += --without-orc
+endif
+
 ifeq ($(BR2_PACKAGE_POPPLER),y)
 LIBVIPS_CONF_OPTS += --with-poppler
 LIBVIPS_DEPENDENCIES += poppler
-- 
2.30.2
