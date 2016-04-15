From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 20:24:05 +0200
Subject: [Buildroot] [git commit] tiff: add host variant
Message-ID: <20160415183007.E3AF381E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b16fbbf9dbd997263d2e157e5503732418760b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host variant to be used by host-gdk-pixbuf to update the loaders
cache.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
