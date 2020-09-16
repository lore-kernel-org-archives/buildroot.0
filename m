From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 21:49:31 +0200
Subject: [Buildroot] [RFC v1 11/13] package/gst1-rtsp-server: bump version
 to 1.18.0
In-Reply-To: <20200916194933.24921-1-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
Message-ID: <20200916194933.24921-11-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change home page url to https

- remove 0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
  (upstream [1])

- meson options: doc=disabled

[1] https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/commit/95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...hen-cross-compiling-if-introspection.patch | 36 -------------------
 package/gstreamer1/gst1-rtsp-server/Config.in |  2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |  8 ++---
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  5 +--
 4 files changed, 8 insertions(+), 43 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch

diff --git a/package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
deleted file mode 100644
index 0adf6d4e47..0000000000
--- a/package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
-From: Tim Philipp <tim@centricular.com>
-Date:  Fri, 18 Oct 2019 00:42:12 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream commit: 95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47
-Signed-off-by: Tim Philipp <tim@centricular.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e1e3b1d..3f45f0e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -173,7 +173,7 @@ endif
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.24.1
-
diff --git a/package/gstreamer1/gst1-rtsp-server/Config.in b/package/gstreamer1/gst1-rtsp-server/Config.in
index 5869952f58..f0294795a1 100644
--- a/package/gstreamer1/gst1-rtsp-server/Config.in
+++ b/package/gstreamer1/gst1-rtsp-server/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_GST1_RTSP_SERVER
 	help
 	  RTSP server library based on GStreamer.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index f3dca615cf..d054756688 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.16.2.tar.xz.sha256sum
-sha256 de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e gst-rtsp-server-1.16.2.tar.xz
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.0.tar.xz.sha256sum
+sha256  2ad19311054cbf2df0d0622936bc703dedc06ced706df46a3d3a3ea5a4b7c70f  gst-rtsp-server-1.18.0.tar.xz
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 13653565bd..6f1db3644f 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.16.2
+GST1_RTSP_SERVER_VERSION = 1.18.0
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
@@ -20,7 +20,8 @@ GST1_RTSP_SERVER_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_RTSP_SERVER_CONF_OPTS = \
 	-Dexamples=disabled \
-	-Dtests=disabled
+	-Dtests=disabled \
+	-Ddoc=disabled
 
 GST1_RTSP_SERVER_CONF_OPTS += \
 	-Dexamples=disabled \
-- 
2.28.0
