From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Sep 2017 13:03:51 +0200
Subject: [Buildroot] [PATCH 1/4] package/imagemagick: add host package
In-Reply-To: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1505819034-29610-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add the host package for imagemagick.
It comes with a minimal selection of configure options to
compile fast cause it is used only to convert
the image files for the custom linux logo.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/imagemagick/imagemagick.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9043ce8..0ac750c 100644
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
