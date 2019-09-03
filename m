From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Sep 2019 20:08:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: remove unrecognized
 --enable-cxx
Message-ID: <20190903180804.23629-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove --enable-cxx, this option has been removed since version 8.1 and
https://github.com/libvips/libvips/commit/346a9e70c0b096f84127449488e7dce6968d91c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvips/libvips.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 269b0866c8..3e6af4131d 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -41,10 +41,6 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
-# --disable-cxx is broken upstream
-# https://github.com/jcupitt/libvips/issues/231
-LIBVIPS_CONF_OPTS += --enable-cxx
-
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBVIPS_CONF_OPTS += --with-jpeg
 LIBVIPS_DEPENDENCIES += jpeg
-- 
2.23.0.rc1
