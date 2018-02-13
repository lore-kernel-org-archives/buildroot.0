From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 13 Feb 2018 09:39:35 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/imagemagick: add host package
Message-ID: <1518511178-28623-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch add the host package for imagemagick.
It comes with a minimal selection of configure options to
compile fast cause it's only used to convert
the image files for the custom linux logo.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/imagemagick/imagemagick.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c2171a7..c2e0dcf 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -143,4 +143,15 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
+HOST_IMAGEMAGICK_CONF_OPTS = \
+	--with-jpeg \
+	--with-png \
+	--with-zlib
+
+HOST_IMAGEMAGICK_DEPENDENCIES = \
+	host-libjpeg \
+	host-libpng \
+	host-zlib
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
