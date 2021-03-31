From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Mar 2021 20:59:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add giflib optional
 dependency
Message-ID: <20210331185943.1430261-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

giflib is an optional dependency which is enabled by default since
version 8.3.0 and
https://github.com/libvips/libvips/commit/d79407f285c768a7338e73ccfc6cf09480b95582

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 014aaf0327..0449751380 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -38,6 +38,13 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+LIBVIPS_CONF_OPTS += --with-giflib
+LIBVIPS_DEPENDENCIES += giflib
+else
+LIBVIPS_CONF_OPTS += --without-giflib
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBVIPS_CONF_OPTS += --enable-introspection
 LIBVIPS_DEPENDENCIES += gobject-introspection
-- 
2.30.2
