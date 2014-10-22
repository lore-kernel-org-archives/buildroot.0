From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:57:42 +0200
Subject: [Buildroot] [git commit] gst1-validate: new package
Message-ID: <20141022210031.42F7CB0688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3cc980903d6afaa9988145df39605a5038decbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Example usages can be found at [1].

[1] http://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite-of-tools-to-run-integration-tests-for-gstreamer-2/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [build test on minimal internal x86_64 toolchain]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/Config.in                       |    1 +
 package/gstreamer1/gst1-validate/Config.in         |    9 +++++++++
 .../gstreamer1/gst1-validate/gst1-validate.hash    |    2 ++
 package/gstreamer1/gst1-validate/gst1-validate.mk  |   17 +++++++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index fe0ad48..5f08faf 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -7,5 +7,6 @@ source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst1-libav/Config.in"
+source "package/gstreamer1/gst1-validate/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
new file mode 100644
index 0000000..ffcdd27
--- /dev/null
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -0,0 +1,9 @@
+menuconfig BR2_PACKAGE_GST1_VALIDATE
+	bool "gst1-validate"
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  GstValidate is a tool that allows GStreamer developers to
+	  check that the GstElements they write behave the way they
+	  are supposed to.
+
+	  http://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
new file mode 100644
index 0000000..e2eb3ae
--- /dev/null
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -0,0 +1,2 @@
+# Hash from http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.4.0.tar.xz.sha256sum
+sha256 ac30d1041a8cfe5d268439f5cedee7e9753ba49080fc67bff1266581198438d0 gst-validate-1.4.0.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
new file mode 100644
index 0000000..4972cac
--- /dev/null
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# gst1-validate
+#
+################################################################################
+
+GST1_VALIDATE_VERSION = 1.4.0
+GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
+GST1_VALIDATE_SITE = http://gstreamer.freedesktop.org/src/gst-validate
+GST1_VALIDATE_LICENSE = LGPLv2.1+
+GST1_VALIDATE_LICENSE_FILES = COPYING
+
+GST1_VALIDATE_CONF_OPTS = --disable-sphinx-doc
+
+GST1_VALIDATE_DEPENDENCIES = gstreamer1 gst1-plugins-base
+
+$(eval $(autotools-package))
