From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jan 2021 20:21:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: add gobject-introspection
 support
Message-ID: <20210110192124.1121117-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poppler/poppler.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 0553aec87c..aba8602e06 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -17,7 +17,6 @@ POPPLER_CONF_OPTS = \
 	-DBUILD_GTK_TESTS=OFF \
 	-DBUILD_QT5_TESTS=OFF \
 	-DBUILD_CPP_TESTS=OFF \
-	-DENABLE_GOBJECT_INTROSPECTION=OFF \
 	-DENABLE_GTK_DOC=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
@@ -35,6 +34,13 @@ else
 POPPLER_CONF_OPTS += -DENABLE_DCTDECODER=none -DWITH_JPEG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+POPPLER_DEPENDENCIES += gobject-introspection
+POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 POPPLER_DEPENDENCIES += libpng
 POPPLER_CONF_OPTS += -DWITH_PNG=ON
-- 
2.29.2
