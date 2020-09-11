From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 09:47:00 +0200
Subject: [Buildroot] [git commit] package/graphicsmagick: add support for
 webp image format
Message-ID: <20200911073915.CCC1788632@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ee1b0fac3029155b996bab65ca66f95a412b1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
