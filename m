From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 13:58:27 +0200
Subject: [Buildroot] [git commit] package/libvips: add giflib optional
 dependency
Message-ID: <20210404113358.C48108B910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd1a3a29debdd43e07ad34b29283be5515539013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

giflib is an optional dependency which is enabled by default since
version 8.3.0 and
https://github.com/libvips/libvips/commit/d79407f285c768a7338e73ccfc6cf09480b95582

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
