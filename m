From: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 7 Aug 2011 00:55:07 +0300
Subject: [Buildroot] [PATCH] New package: libgeotiff
Message-ID: <CA+pfegFLfoFVLTvOb183oExTfk7CCoyPCYv88SDMDsQXqzR4Ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libgeotiff is an open source library normally hosted on top of
libtiff for reading, and writing GeoTIFF information tags.

Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
---
 package/Config.in                |    1 +
 package/libgeotiff/Config.in     |    8 ++++++++
 package/libgeotiff/libgeotiff.mk |   12 ++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/libgeotiff/Config.in
 create mode 100644 package/libgeotiff/libgeotiff.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..9e5bfdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -283,6 +283,7 @@ source "package/libart/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
 source "package/libgail/Config.in"
+source "package/libgeotiff/Config.in"
 source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
new file mode 100644
index 0000000..530cd45
--- /dev/null
+++ b/package/libgeotiff/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBGEOTIFF
+       bool "libgeotiff"
+       select BR2_PACKAGE_TIFF
+       help
+         Libgeotiff is an open source library normally hosted on top of
+         libtiff for reading, and writing GeoTIFF information tags.
+
+         http://geotiff.osgeo.org
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
new file mode 100644
index 0000000..f159eba
--- /dev/null
+++ b/package/libgeotiff/libgeotiff.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libgeotiff
+#
+#############################################################
+LIBGEOTIFF_VERSION = 1.3.0
+LIBGEOTIFF_SOURCE = libgeotiff-$(LIBGEOTIFF_VERSION).tar.gz
+LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
+LIBGEOTIFF_DEPENDENCIES = tiff
+LIBGEOTIFF_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libgeotiff))
-- 
1.7.1
