From: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 11 Sep 2011 10:50:30 +0200
Subject: [Buildroot] [git commit] New package: libgeotiff
Message-ID: <20110911091803.4011C8D515@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5368064c2556a5df9e04538c485453f53936342
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libgeotiff is an open source library normally hosted on top of
libtiff for reading, and writing GeoTIFF information tags.

Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/libgeotiff/Config.in     |    8 ++++++++
 package/libgeotiff/libgeotiff.mk |   12 ++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/libgeotiff/Config.in
 create mode 100644 package/libgeotiff/libgeotiff.mk

diff --git a/package/Config.in b/package/Config.in
index bcdf421..f56384d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -284,6 +284,7 @@ source "package/libart/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
 source "package/libgail/Config.in"
+source "package/libgeotiff/Config.in"
 source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
new file mode 100644
index 0000000..7489a47
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
1.7.3.4
