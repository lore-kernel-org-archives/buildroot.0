From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:35 +0200
Subject: [Buildroot] [PATCH 24/83 v2] package/gstreamer: include plugins
	from gstreamer's real Config.in
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <941700a3a121f69bec52279fb256fd0b5a94cd83.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is more logical to have a single if-clause, rather than repeat it in
another file, possiblty brealking indentation like it previously was.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer/Config.in           | 12 ------------
 package/gstreamer/gstreamer/Config.in | 10 ++++++++++
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/gstreamer/Config.in b/package/gstreamer/Config.in
index c6292f4..476f838 100644
--- a/package/gstreamer/Config.in
+++ b/package/gstreamer/Config.in
@@ -1,14 +1,2 @@
 # Gstreamer 0.10.x & Plugins
 source "package/gstreamer/gstreamer/Config.in"
-
-if BR2_PACKAGE_GSTREAMER
-source "package/gstreamer/gst-plugins-base/Config.in"
-source "package/gstreamer/gst-plugins-good/Config.in"
-source "package/gstreamer/gst-plugins-bad/Config.in"
-source "package/gstreamer/gst-plugins-ugly/Config.in"
-source "package/gstreamer/gst-ffmpeg/Config.in"
-source "package/gstreamer/gst-dsp/Config.in"
-source "package/gstreamer/gst-fsl-plugins/Config.in"
-source "package/gstreamer/gst-omapfb/Config.in"
-source "package/gstreamer/gst-plugin-x170/Config.in"
-endif
diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index eb1249a..aee48b1 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -33,4 +33,14 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
 	  Enable support for the GStreamer plugin registry. This may increase
 	  the launch-time for a GStreamer application.
 
+source "package/gstreamer/gst-plugins-base/Config.in"
+source "package/gstreamer/gst-plugins-good/Config.in"
+source "package/gstreamer/gst-plugins-bad/Config.in"
+source "package/gstreamer/gst-plugins-ugly/Config.in"
+source "package/gstreamer/gst-ffmpeg/Config.in"
+source "package/gstreamer/gst-dsp/Config.in"
+source "package/gstreamer/gst-fsl-plugins/Config.in"
+source "package/gstreamer/gst-omapfb/Config.in"
+source "package/gstreamer/gst-plugin-x170/Config.in"
+
 endif
-- 
2.7.4
