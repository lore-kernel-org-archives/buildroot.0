From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 00:38:42 +0100
Subject: [Buildroot] [git commit] package/imagemagick: add optional libzip
 support
Message-ID: <20210226231840.B2D7086322@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32479efafe52593aef6e54415354b2b65ea6e010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
