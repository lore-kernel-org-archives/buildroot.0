From: =?UTF-8?q?Jesper=20B=C3=A6kdahl?= <jbb@gamblify.com>
Date: Thu, 15 Dec 2016 15:53:51 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
Message-ID: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>
---
 package/gstreamer1/Config.in                  |  1 +
 package/gstreamer1/gst1-vaapi/Config.in       | 11 +++++++++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  2 ++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/gstreamer1/gst1-vaapi/Config.in
 create mode 100644 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
 create mode 100644 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 23862bd..0297851 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -9,6 +9,7 @@ source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
+source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
new file mode 100644
index 0000000..56d63f4
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GST1_VAAPI
+	bool "gst1-vaapi"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_LIBVA
+	select BR2_PACKAGE_GST1_PLUGINS_LIBDRM
+	help
+	  gstreamer-vaapi consists in a collection of VA-API based plugins for
+	  GStreamer and helper libraries.
+
+	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
new file mode 100644
index 0000000..21032ca
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -0,0 +1,2 @@
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.10.2.tar.xz.sha256sum
+sha256 9e31d2b85b2f30caa6b0cc1c6be10b96e1376668f13faa6a0f577d3693547fa9  gstreamer-vaapi-1.10.2.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
new file mode 100644
index 0000000..d66018d
--- /dev/null
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# gst1-vaapi
+#
+################################################################################
+
+GST1_VAAPI_VERSION = 1.10.2
+GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
+GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
+GST1_VAAPI_DEPENDENCIES = gstreamer1 gst1-plugins-base gst1-plugins-bad libva libdrm
+GST1_VAAPI_LICENSE = GPLv2+
+GST1_VAAPI_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.7.4
