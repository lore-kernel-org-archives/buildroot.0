From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  6 Mar 2017 21:43:47 +0100
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: waylandsink needs
	wayland-protocols
Message-ID: <20170306204347.30354-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
Changes v1 -> v2:
  - use select instead of depends for BR2_PACKAGE_WAYLAND_PROTOCOLS
   (suggested by Thomas Petazzoni)
  - add select BR2_PACKAGE_WAYLAND_PROTOCOLS to missing second
    place (BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND)
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 2 ++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 6bec362db..1db51877d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -112,6 +112,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
 	default y
 	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
 	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
 
 comment "wayland needs the egl platform and the wayland package"
@@ -686,6 +687,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
 	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	default y
 	help
 	  Wayland Video Sink
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 00add02af..c6a151a62 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -121,7 +121,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
-GST1_PLUGINS_BAD_DEPENDENCIES += wayland
+GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
 endif
-- 
2.11.0
