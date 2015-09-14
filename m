From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 21:43:50 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: depend on wayland
	instead of selecting it for wayland plugin
Message-ID: <20150914194447.6198F7FD26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2cee48d27ddd5c51ba32d19282eae49684d2bc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed here:
http://lists.busybox.net/pipermail/buildroot/2015-September/139213.html

It makes more sense to use 'depends on' (and default to y) for a big
dependency like wayland.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 89066af..a778843 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -497,9 +497,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
-	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	select BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_WAYLAND
+	default y
 	help
 	  Wayland Video Sink
 
