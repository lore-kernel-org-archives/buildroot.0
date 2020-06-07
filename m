From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 09:00:51 +0200
Subject: [Buildroot] [git commit] package/libvips: add gobject-introspection
 support
Message-ID: <20200607070058.3499082AA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c57106165a74db50201833d283fc7a3bfbacba7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvips/libvips.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 001a148a7e..169fda9b10 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -21,7 +21,6 @@ LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 LIBVIPS_CONF_OPTS = \
-	--disable-introspection \
 	--without-dmalloc \
 	--without-gsf \
 	--without-magick \
@@ -41,6 +40,13 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBVIPS_CONF_OPTS += --enable-introspection
+LIBVIPS_DEPENDENCIES += gobject-introspection
+else
+LIBVIPS_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBVIPS_CONF_OPTS += --with-jpeg
 LIBVIPS_DEPENDENCIES += jpeg
