From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:25:56 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gst1-plugins-bad:
	waylandsink needs wayland-protocols
Message-ID: <20170331071605.EDE11826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc9ecb90c58908ffa0d896d4da5b1d4b917253c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
Changes v1 -> v2:
  - use select instead of depends for BR2_PACKAGE_WAYLAND_PROTOCOLS
   (suggested by Thomas Petazzoni)
  - add select BR2_PACKAGE_WAYLAND_PROTOCOLS to missing second
    place (BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND)
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit 5a2d37ca125c1742864af0e9324234f8f3ecc071)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 2 ++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 6bec362..1db5187 100644
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
index 00add02..c6a151a 100644
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
