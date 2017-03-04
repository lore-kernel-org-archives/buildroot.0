From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  4 Mar 2017 22:31:25 +0100
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: waylandsink needs
	wayland-protocols
Message-ID: <20170304213125.13321-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 6bec362db..923ed2cfc 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -112,11 +112,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
 	default y
 	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
 	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
 
-comment "wayland needs the egl platform and the wayland package"
+comment "wayland needs the egl platform and the wayland/wayland-protocols packages"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL || \
-		!BR2_PACKAGE_WAYLAND
+		!BR2_PACKAGE_WAYLAND || !BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX
 	bool "dispmanx"
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
