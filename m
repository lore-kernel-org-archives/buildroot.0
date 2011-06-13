From: Murat Demirten <mdemirten@yh.com.tr>
Date: Mon, 13 Jun 2011 13:18:56 +0300
Subject: [Buildroot] [PATCH] Add package libgeotiff
Message-ID: <BANLkTinABWL+chL8wDP3q=KYiKxjBf_daw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Libgeotiff is an open source library normally hosted on top of libtiff for
reading, and writing GeoTIFF information tags.

Regards,

[master b7094a9] package: libgeotiff added.
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/libgeotiff/Config.in
 create mode 100644 package/libgeotiff/libgeotiff.mk

---
 package/Config.in                |    1 +
 package/libgeotiff/Config.in     |    7 +++++++
 package/libgeotiff/libgeotiff.mk |   18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/libgeotiff/Config.in
 create mode 100644 package/libgeotiff/libgeotiff.mk

diff --git a/package/Config.in b/package/Config.in
index 81701d8..7b43143 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,7 @@ source "package/libart/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
 source "package/libgail/Config.in"
+source "package/libgeotiff/Config.in"
 source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
new file mode 100644
index 0000000..47420fd
--- /dev/null
+++ b/package/libgeotiff/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBGEOTIFF
+       bool "libgeotiff"
+       select BR2_PACKAGE_TIFF
+       help
+        Libgeotiff is an open source library normally hosted on top of
libtiff for reading, and writing GeoTIFF information tags.
+
+        http://geotiff.osgeo.org/
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/
libgeotiff.mk
new file mode 100644
index 0000000..742fd75
--- /dev/null
+++ b/package/libgeotiff/libgeotiff.mk
@@ -0,0 +1,18 @@
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
+LIBGEOTIFF_INSTALL_TARGET = YES
+
+define LIBGEOTIFF_INSTALL_TARGET_CMDS
+       mkdir -p $(TARGET_DIR)/usr/lib
+       cp -dpf $(@D)/.libs/libgeotiff.so* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(call AUTOTARGETS,package,libgeotiff))
-- 
1.7.5.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110613/3df2c59a/attachment.html>
