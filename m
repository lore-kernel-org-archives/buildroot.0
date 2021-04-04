From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 16:30:42 +0200
Subject: [Buildroot] [PATCH 1/7] package/libvips: add zlib optional
 dependency
Message-ID: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is an optional dependency which is enabled by default since version
8.4.2 and
https://github.com/libvips/libvips/commit/5ab0001ec68a5f61396aecd8d2d7a619b1dbe1fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 0449751380..5f95fc7f1d 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -94,4 +94,11 @@ else
 LIBVIPS_CONF_OPTS += --without-libexif
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBVIPS_CONF_OPTS += --with-zlib
+LIBVIPS_DEPENDENCIES += zlib
+else
+LIBVIPS_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.30.2
