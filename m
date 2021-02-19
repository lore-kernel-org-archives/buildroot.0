From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2021 00:02:55 +0100
Subject: [Buildroot] [PATCH/next v1 4/5] package/imagemagick: add optional
 libraw support
In-Reply-To: <20210219230256.27955-1-ps.report@gmx.net>
References: <20210219230256.27955-1-ps.report@gmx.net>
Message-ID: <20210219230256.27955-4-ps.report@gmx.net>
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
index 5b4ba63c85..30200e95b0 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -88,6 +88,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRAW),y)
+IMAGEMAGICK_CONF_OPTS += --with-raw
+IMAGEMAGICK_DEPENDENCIES += libraw
+else
+IMAGEMAGICK_CONF_OPTS += --without-raw
+endif
+
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 IMAGEMAGICK_CONF_OPTS += --with-rsvg
 IMAGEMAGICK_DEPENDENCIES += librsvg
@@ -182,6 +189,7 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-openexr \
 	--without-perl \
 	--without-raqm \
+	--without-raw \
 	--without-wmf \
 	--without-x \
 	--without-zip \
-- 
2.30.0
