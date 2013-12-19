From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 22:31:34 +0100
Subject: [Buildroot] [git commit] gstreamer1 packages: factorize dependency
	on gstreamer1
Message-ID: <20131219213349.9CA5B9C0EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30abaffe550e4156a54be6f0d2114b9585bbf5f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Proposed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/Config.in                   |    3 +++
 package/gstreamer1/gst-omx/Config.in           |    4 ++--
 package/gstreamer1/gst1-plugins-bad/Config.in  |    1 -
 package/gstreamer1/gst1-plugins-base/Config.in |    1 -
 package/gstreamer1/gst1-plugins-good/Config.in |    1 -
 package/gstreamer1/gst1-plugins-ugly/Config.in |    1 -
 6 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index f9d2363..f7b98c7 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -1,7 +1,10 @@
 # Gstreamer 1.x & Plugins
 source "package/gstreamer1/gstreamer1/Config.in"
+
+if BR2_PACKAGE_GSTREAMER1
 source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
 source "package/gstreamer1/gst1-plugins-bad/Config.in"
 source "package/gstreamer1/gst1-plugins-ugly/Config.in"
 source "package/gstreamer1/gst-omx/Config.in"
+endif
diff --git a/package/gstreamer1/gst-omx/Config.in b/package/gstreamer1/gst-omx/Config.in
index b6ea116..1d5b131 100644
--- a/package/gstreamer1/gst-omx/Config.in
+++ b/package/gstreamer1/gst-omx/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GST_OMX
 	bool "gst-omx"
-	depends on BR2_PACKAGE_GSTREAMER1 && BR2_PACKAGE_HAS_OPENMAX
+	depends on BR2_PACKAGE_HAS_OPENMAX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  GStreamer plug-in to use OpenMAX API.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_GST_OMX
 	  http://cgit.freedesktop.org/gstreamer/gst-omx
 
 comment "gst-omx requires a OpenMAX implementation"
-	depends on BR2_PACKAGE_GSTREAMER1 && !BR2_PACKAGE_HAS_OPENMAX
+	depends on !BR2_PACKAGE_HAS_OPENMAX
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d028245..407bf31 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
 	bool "gst1-plugins-bad"
-	depends on BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  A set of plug-ins for GStreamer that may be of poor quality or
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 5b54bab..55960ea 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
 	bool "gst1-plugins-base"
-	depends on BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index a9308c7..20983d6 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_GOOD
 	bool "gst1-plugins-good"
-	depends on BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  A set of well-supported plug-ins for GStreamer under the preferred
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index 9b5c8e0..ad9f13c 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_GST1_PLUGINS_UGLY
 	bool "gst1-plugins-ugly"
-	depends on BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  A set of well-supported plug-ins for GStreamer, but might pose
