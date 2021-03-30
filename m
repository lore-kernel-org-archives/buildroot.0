From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Mar 2021 23:43:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add poppler optional
 dependency
Message-ID: <20210330214331.759988-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

poppler is an optional dependency which is enabled by default since
version 8.3.0 and
https://github.com/libvips/libvips/commit/8da4e706dd60aba1a69e49bd562d8de225d2404d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index d0979b7e3b..014aaf0327 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -59,6 +59,13 @@ else
 LIBVIPS_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_POPPLER),y)
+LIBVIPS_CONF_OPTS += --with-poppler
+LIBVIPS_DEPENDENCIES += poppler
+else
+LIBVIPS_CONF_OPTS += --without-poppler
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LIBVIPS_CONF_OPTS += --with-tiff
 LIBVIPS_DEPENDENCIES += tiff
-- 
2.30.2
