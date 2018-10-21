From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 18:16:29 +0200
Subject: [Buildroot] [git commit] package/imagemagick: add host package
Message-ID: <20181021161455.6C5AB883A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c29b905f332778dc2172f3462f63d6f5d0d9b04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the host package for imagemagick.
It comes with a minimal selection of configure options to
compile fast cause it is used only to convert
the image files for the custom linux logo.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Peter: explicitly disable other configure options like it is done for the
	target variant, add host-pkgconf]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index b75d65375b..72482267ce 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -143,4 +143,41 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
+HOST_IMAGEMAGICK_CONF_OPTS = \
+	--disable-openmp \
+	--without-djvu \
+	--without-dps \
+	--without-flif \
+	--without-fpx \
+	--without-gslib \
+	--without-gvc \
+	--without-jbig \
+	--without-lqr \
+	--without-openexr \
+	--without-perl \
+	--without-raqm \
+	--without-wmf \
+	--without-x \
+	--without-bzlib \
+	--without-fftw \
+	--without-fontconfig \
+	--without-freetype \
+	--without-lcms \
+	--without-lzma \
+	--without-pango \
+	--without-rsvg \
+	--without-tiff \
+	--without-webp \
+	--without-xml \
+	--with-jpeg \
+	--with-png \
+	--with-zlib
+
+HOST_IMAGEMAGICK_DEPENDENCIES = \
+	host-libjpeg \
+	host-libpng \
+	host-pkgconf \
+	host-zlib
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
