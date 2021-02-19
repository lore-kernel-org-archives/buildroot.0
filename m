From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2021 00:02:53 +0100
Subject: [Buildroot] [PATCH/next v1 2/5] package/imagemagick: add optional
 libzip support
In-Reply-To: <20210219230256.27955-1-ps.report@gmx.net>
References: <20210219230256.27955-1-ps.report@gmx.net>
Message-ID: <20210219230256.27955-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/imagemagick/imagemagick.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index bc3040769f..48892fd449 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -103,6 +103,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-xml
 endif
 
+ifeq ($(BR2_PACKAGE_LIBZIP),y)
+IMAGEMAGICK_CONF_OPTS += --with-zip
+IMAGEMAGICK_DEPENDENCIES += libzip
+else
+IMAGEMAGICK_CONF_OPTS += --without-zip
+endif
+
 ifeq ($(BR2_PACKAGE_PANGO),y)
 IMAGEMAGICK_CONF_OPTS += --with-pango
 IMAGEMAGICK_DEPENDENCIES += pango
@@ -170,6 +177,7 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-raqm \
 	--without-wmf \
 	--without-x \
+	--without-zip \
 	--without-bzlib \
 	--without-fftw \
 	--without-lcms \
-- 
2.30.0
