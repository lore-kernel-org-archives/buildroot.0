From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 19:16:22 +0200
Subject: [Buildroot] [PATCH v2 2/2] gst1-interpipe: new package
In-Reply-To: <20171027171622.16050-1-ps.report@gmx.net>
References: <20171027171622.16050-1-ps.report@gmx.net>
Message-ID: <20171027171622.16050-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add hash for the license file
---
 package/gstreamer1/Config.in                       |  1 +
 package/gstreamer1/gst1-interpipe/Config.in        | 10 +++++++++
 .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |  5 +++++
 .../gstreamer1/gst1-interpipe/gst1-interpipe.mk    | 24 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/gstreamer1/gst1-interpipe/Config.in
 create mode 100644 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
 create mode 100644 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index aef75b55bf..ae7b982bf3 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -7,6 +7,7 @@ source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-imx/Config.in"
+source "package/gstreamer1/gst1-interpipe/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-validate/Config.in"
diff --git a/package/gstreamer1/gst1-interpipe/Config.in b/package/gstreamer1/gst1-interpipe/Config.in
new file mode 100644
index 0000000000..0a169e8d4f
--- /dev/null
+++ b/package/gstreamer1/gst1-interpipe/Config.in
@@ -0,0 +1,10 @@
+menuconfig BR2_PACKAGE_GST1_INTERPIPE
+	bool "gst1-interpipe"
+	select BR2_PACKAGE_GSTREAMER1_CHECK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	help
+	  GstInterpipe is a Gstreamer plug-in that allows communication
+	  between two independent pipelines.
+
+	  https://github.com/RidgeRun/gst-interpipe
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
new file mode 100644
index 0000000000..b9b1c5e429
--- /dev/null
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -0,0 +1,5 @@
+# locally computed hash
+sha256 3f8cc5cf4861e5836938c66415b47555550c93b06b1bc9faed83e89bacf705cf gst1-interpipe-10dba89eecc200e49f0b432e299f1c8a4312b657.tar.gz
+
+# Hashes for license files:
+sha256 16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5 COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
new file mode 100644
index 0000000000..0a06aac41e
--- /dev/null
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# gst1-interpipe
+#
+################################################################################
+
+GST1_INTERPIPE_VERSION = 10dba89eecc200e49f0b432e299f1c8a4312b657
+GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
+GST1_INTERPIPE_SITE_METHOD = git
+# fetch gst-interpipe/common sub module
+GST1_INTERPIPE_GIT_SUBMODULES = YES
+
+GST1_INTERPIPE_LICENSE = LGPL-2.1
+GST1_INTERPIPE_LICENSE_FILES = COPYING
+
+# from git source
+GST1_INTERPIPE_AUTORECONF = YES
+
+GST1_INTERPIPE_DEPENDENCIES += \
+	host-pkgconf \
+	gstreamer1 \
+	gst1-plugins-base
+
+$(eval $(autotools-package))
-- 
2.14.2
