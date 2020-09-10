From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 10 Sep 2020 17:50:54 +0200
Subject: [Buildroot] [PATCH] package/graphicsmagick: add support for webp
 image format
Message-ID: <20200910155057.29740-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/graphicsmagick/graphicsmagick.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 436df709e7..da7af5b53e 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -27,7 +27,6 @@ GRAPHICSMAGICK_CONF_OPTS = \
 	--without-jbig \
 	--without-perl \
 	--without-trio \
-	--without-webp \
 	--without-wmf \
 	--without-x \
 	--with-gs-font-dir=/usr/share/fonts/gs
@@ -85,6 +84,13 @@ else
 GRAPHICSMAGICK_CONF_OPTS += --without-tiff
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP_MUX),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-webp
+GRAPHICSMAGICK_DEPENDENCIES += webp
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-webp
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 GRAPHICSMAGICK_CONF_OPTS += --with-lzma
 GRAPHICSMAGICK_DEPENDENCIES += xz
-- 
2.24.3 (Apple Git-128)
