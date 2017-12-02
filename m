From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 13:31:57 +0100
Subject: [Buildroot] [PATCH 1/1] webp: add giflib optional dependency
Message-ID: <20171202123157.16860-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webp/webp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 2f3a78c1c..899972039 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -29,6 +29,13 @@ else
 WEBP_CONF_OPTS += --disable-libwebpmux
 endif
 
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+WEBP_DEPENDENCIES += giflib
+WEBP_CONF_OPTS += --enable-gif
+else
+WEBP_CONF_OPTS += --disable-gif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WEBP_DEPENDENCIES += libpng
 WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
-- 
2.14.1
