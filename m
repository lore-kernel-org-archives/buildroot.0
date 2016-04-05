From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Apr 2016 20:31:23 -0300
Subject: [Buildroot] [PATCH 1/2] tiff: add host variant
Message-ID: <1459899084-23473-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host variant to be used by host-gdk-pixbuf to update the loaders
cache.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tiff/tiff.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 266272a..a53d7bb 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -15,6 +15,14 @@ TIFF_CONF_OPTS = \
 
 TIFF_DEPENDENCIES = host-pkgconf
 
+HOST_TIFF_CONF_OPTS = \
+	--disable-cxx \
+	--without-x \
+	--disable-zlib \
+	--disable-lzma \
+	--disable-jpeg
+HOST_TIFF_DEPENDENCIES = host-pkgconf
+
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
@@ -81,3 +89,4 @@ endif
 TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.3
