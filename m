From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:32:20 +0200
Subject: [Buildroot] [git commit] package/graphicsmagick: enable OpenMP when
 supported by toolchain
Message-ID: <20200919122349.9385281E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89c904c27a1f6a7551b8d2559cf18bbac7464c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/graphicsmagick/graphicsmagick.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index da7af5b53e..ab00ee2c9e 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -21,7 +21,6 @@ GRAPHICSMAGICK_CONFIG_SCRIPTS += GraphicsMagick++-config
 endif
 
 GRAPHICSMAGICK_CONF_OPTS = \
-	--disable-openmp \
 	--without-dps \
 	--without-fpx \
 	--without-jbig \
@@ -33,6 +32,12 @@ GRAPHICSMAGICK_CONF_OPTS = \
 
 GRAPHICSMAGICK_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
+GRAPHICSMAGICK_CONF_OPTS += --enable-openmp
+else
+GRAPHICSMAGICK_CONF_OPTS += --disable-openmp
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 GRAPHICSMAGICK_CONF_OPTS += --with-ttf
 GRAPHICSMAGICK_CONF_ENV += ac_cv_path_freetype_config=$(STAGING_DIR)/usr/bin/freetype-config
