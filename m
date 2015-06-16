From: grepper <grepper@gmail.com>
Date: Mon, 15 Jun 2015 22:12:26 -0400
Subject: [Buildroot] [PATCH 1/1] Allow imagemagick to find ghostscript fonts.
Message-ID: <1434420746-20199-1-git-send-email-grepper@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Robert Sohn <grepper@gmail.com>

It appears that Imagemagick needs to be configured with
 --with-gs-font-dir=/usr/share/fonts/gs else it will not find
the ghostscript fonts and /etc/ImageMagick-6/type-ghostscript.xml
will contain the wrong font paths. You end up with messages like:
Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
They are non-fatal but could get annoying fast if you are using 'convert'
on a lot of files.

Signed-off-by: Robert Sohn <grepper@gmail.com>
---
 package/imagemagick/imagemagick.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 298d0a8..1abb2a8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -33,7 +33,8 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-dps \
 	--without-gslib \
 	--without-fpx \
-	--without-x
+	--without-x \
+	--with-gs-font-dir=/usr/share/fonts/gs
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
-- 
2.1.4
