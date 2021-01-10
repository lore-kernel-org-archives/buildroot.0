From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jan 2021 20:06:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-python: needs
 gst1-plugins-base
Message-ID: <20210110190616.1023612-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-plugins-base is a mandatory dependency since at least version
1.9.90 and
https://github.com/GStreamer/gst-python/commit/16f971226df1980b58ebde330123debaaf3b53d0

Fixes:
 - http://autobuild.buildroot.org/results/48b22c66c3a610d70931b9adfd6e5082bb3ff3d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-python/Config.in      | 1 +
 package/gstreamer1/gst1-python/gst1-python.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-python/Config.in b/package/gstreamer1/gst1-python/Config.in
index 791562fea8..2f34984020 100644
--- a/package/gstreamer1/gst1-python/Config.in
+++ b/package/gstreamer1/gst1-python/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GST1_PYTHON
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index bf64c2c96a..0c506b260c 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -12,6 +12,7 @@ GST1_PYTHON_LICENSE_FILES = COPYING
 GST1_PYTHON_LICENSE = LGPL-2.1+
 
 GST1_PYTHON_DEPENDENCIES = \
+	gst1-plugins-base \
 	gstreamer1 \
 	python-gobject
 
-- 
2.29.2
