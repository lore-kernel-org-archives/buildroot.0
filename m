From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 31 Jul 2016 14:45:50 +0200
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
Message-ID: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in              |  1 +
 package/shapelib/Config.in     |  8 ++++++++
 package/shapelib/shapelib.hash |  3 +++
 package/shapelib/shapelib.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/shapelib/Config.in
 create mode 100644 package/shapelib/shapelib.hash
 create mode 100644 package/shapelib/shapelib.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..6186da1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1333,6 +1333,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/shapelib/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
diff --git a/package/shapelib/Config.in b/package/shapelib/Config.in
new file mode 100644
index 0000000..a34a94d
--- /dev/null
+++ b/package/shapelib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SHAPELIB
+	bool "shapelib"
+	help
+	  The Shapefile C Library provides the ability to write simple C programs
+	  for reading, writing and updating (to a limited extent) ESRI Shapefiles,
+	  and the associated attribute file (.dbf).
+
+	  http://shapelib.maptools.org/
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
new file mode 100644
index 0000000..6c8a86f
--- /dev/null
+++ b/package/shapelib/shapelib.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 23d474016158ab5077db2f599527631706ba5c0dc7c4178a6a1d685bb014f68f  shapelib-1.3.0.tar.gz
+
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
new file mode 100644
index 0000000..5c928cb
--- /dev/null
+++ b/package/shapelib/shapelib.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# shapelib
+#
+################################################################################
+
+SHAPELIB_VERSION = 1.3.0
+SHAPELIB_SITE = http://download.osgeo.org/shapelib
+SHAPELIB_LICENSE = LGPL
+SHAPELIB_LICENSE_FILES = LICENSE.LGPL
+SHAPELIB_INSTALL_STAGING = YES
+
+define SHAPELIB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define SHAPELIB_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
+endef
+
+define SHAPELIB_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
