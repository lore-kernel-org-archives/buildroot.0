From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:51:08 +0100
Subject: [Buildroot] [git commit] webp: add an option to enable webpmux
Message-ID: <20171201205332.6AB627FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e55d61fb976168f9d9bb9402f4262f03f8f1fcfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webp/Config.in | 7 +++++++
 package/webp/webp.mk   | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/webp/Config.in b/package/webp/Config.in
index 646eb9e..e8263a9 100644
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
index 8213027..2f3a78c 100644
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
