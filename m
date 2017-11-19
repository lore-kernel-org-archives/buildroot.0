From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Nov 2017 17:58:23 +0100
Subject: [Buildroot] [PATCH 1/1] webp: add an option to enable webpmux
Message-ID: <20171119165823.20182-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webp/Config.in | 7 +++++++
 package/webp/webp.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/webp/Config.in b/package/webp/Config.in
index 646eb9ef5..e8263a95f 100644
--- a/package/webp/Config.in
+++ b/package/webp/Config.in
@@ -15,4 +15,11 @@ config BR2_PACKAGE_WEBP_DEMUX
 	  of an extended format WebP file, which can have features
 	  like color profile, metadata and animation.
 
+config BR2_PACKAGE_WEBP_MUX
+	bool "webpmux"
+	help
+	  Mux is a part of WebPMux for creation and manipulation
+	  of an extended format WebP file, which can have features
+	  like color profile, metadata and animation.
+
 endif
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 7cf3df23c..8e6572dbe 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -23,6 +23,12 @@ else
 WEBP_CONF_OPTS += --disable-libwebpdemux
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP_MUX),y)
+WEBP_CONF_OPTS += --enable-libwebpmux
+else
+WEBP_CONF_OPTS += --disable-libwebpmux
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WEBP_DEPENDENCIES += libpng
 WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
-- 
2.14.1
