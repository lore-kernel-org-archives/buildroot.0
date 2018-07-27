From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 09:18:17 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump to 1.14.2
Message-ID: <20180727071305.8898A8A46E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66cc6eb178d5f5bc2e65c543c5630ae5599f4809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release desription see [1].

- gst1-vaapi: remove upstream patch 0001-plugins-guard-GstGL-code.patch

[1] https://gstreamer.freedesktop.org/releases/1.14/#1.14.2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash            |  4 +--
 package/gstreamer1/gst-omx/gst-omx.mk              |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash      |  4 +--
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  2 +-
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +--
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  2 +-
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 +--
 .../gst1-plugins-base/gst1-plugins-base.mk         |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash       |  4 +--
 .../gst1-plugins-good/gst1-plugins-good.mk         |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |  4 +--
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |  4 +--
 .../gst1-rtsp-server/gst1-rtsp-server.mk           |  2 +-
 .../gst1-vaapi/0001-plugins-guard-GstGL-code.patch | 35 ----------------------
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |  4 +--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        |  2 +-
 .../gstreamer1/gst1-validate/gst1-validate.hash    |  4 +--
 package/gstreamer1/gst1-validate/gst1-validate.mk  |  2 +-
 .../gstreamer1-editing-services.hash               |  4 +--
 .../gstreamer1-editing-services.mk                 |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +--
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  2 +-
 23 files changed, 33 insertions(+), 68 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 5535a75812..3e94d4eee0 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.1.tar.xz.sha256sum
-sha256 7cb6c39301dfa3960abce195305c7cf431736bf6b47bde1fd4412c81c3e75cd8 gst-omx-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.2.tar.xz.sha256sum
+sha256 316dbb13693795383cad6ec4dbebd94a869cd1f9d59a393686cad0b77bf9b5a9 gst-omx-1.14.2.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 8242d24a1f..f70477823e 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.14.1
+GST_OMX_VERSION = 1.14.2
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index d67968557d..944f63d78e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.1.tar.xz.sha256sum
-sha256 eff80a02d2f2fb9f34b67e9a26e9954d3218c7aa18e863f2a47805fa7066029d gst-libav-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.14.2.tar.xz.sha256sum
+sha256 8a351c39c5cfc2bbd31ca434ec4a290a730a26efbdea962fdd8306dce5c576de gst-libav-1.14.2.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index b7566f0161..071da40a6e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.14.1
+GST1_LIBAV_VERSION = 1.14.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 927e45b7e9..6342561ddf 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.1.tar.xz.sha256sum
-sha256 2a77c6908032aafdf2cd2e5823fec948f16a25c2d1497a953828d762dc20d61a gst-plugins-bad-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.2.tar.xz.sha256sum
+sha256 34fab7da70994465a64468330b2168a4a0ed90a7de7e4c499b6d127c6c1b1eaf gst-plugins-bad-1.14.2.tar.xz
 sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 53b4038f1f..c9bf2b2fb7 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.14.1
+GST1_PLUGINS_BAD_VERSION = 1.14.2
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 65c9f29c2f..6e13f97a9f 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.1.tar.xz.sha256sum
-sha256 1026c7c3082d825d9b5d034c1a6dd8a4ebab60eb3738b0a0afde4ad2dc0b0db5 gst-plugins-base-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.2.tar.xz.sha256sum
+sha256 a4b7e80ba869f599307449b17c9e00b5d1e94d3ba1d8a1a386b8770b2ef01c7c gst-plugins-base-1.14.2.tar.xz
 sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 3ad841bdd3..210bbeb20a 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.14.1
+GST1_PLUGINS_BASE_VERSION = 1.14.2
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 1254c4cde0..65750fa5a4 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.1.tar.xz.sha256sum
-sha256 34ec062ddb766a32377532e039781f4a16fbc3e8b449e642605bacab26a99172 gst-plugins-good-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.2.tar.xz.sha256sum
+sha256 c0575e2811860bfff59b865b8d125153859a01f0615fa41e279b64d88d25caad gst-plugins-good-1.14.2.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 6fa989d6bd..c1ed039bc7 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.14.1
+GST1_PLUGINS_GOOD_VERSION = 1.14.2
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 4fe4d091a8..3e675c8dc3 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.1.tar.xz.sha256sum
-sha256 cff2430bb13f54ef81409a0b3d65ce409a376d4a7bab57a14a97d602539fe1d3 gst-plugins-ugly-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.2.tar.xz.sha256sum
+sha256 55e097d9d93921fdcf7abb0ff92d23b21dd9098e632f1ba433603b3bd1cf3d69 gst-plugins-ugly-1.14.2.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 1b4842fb92..0116dad5ca 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.14.1
+GST1_PLUGINS_UGLY_VERSION = 1.14.2
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 4eabe12cef..dfb0849478 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.1.tar.xz.sha256sum
-sha256 38634f3b25c2bf2967b1ff914b54ff384f8612f5aefc18accd72c78bf3b02d7c gst-rtsp-server-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.2.tar.xz.sha256sum
+sha256 f7387755cf6ac5f334d4610f1f5aa7da4ff396a487dd5b789bb707f160222c98 gst-rtsp-server-1.14.2.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 4aa7c0b0c7..0dc2917685 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.14.1
+GST1_RTSP_SERVER_VERSION = 1.14.2
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
diff --git a/package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch b/package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch
deleted file mode 100644
index a85d666e31..0000000000
--- a/package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 73e31146a5c6bcd48eb3089a2a140833a401623b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
- <vjaquez@igalia.com>
-Date: Mon, 21 May 2018 13:27:14 +0200
-Subject: [PATCH] plugins: guard GstGL code
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi/patch/?id=45fb111850955d9192e43b9dbcb2ef8e3974e58d
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gst/vaapi/gstvaapipluginutil.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gst/vaapi/gstvaapipluginutil.c b/gst/vaapi/gstvaapipluginutil.c
-index fa25131..648c91b 100644
---- a/gst/vaapi/gstvaapipluginutil.c
-+++ b/gst/vaapi/gstvaapipluginutil.c
-@@ -246,6 +246,7 @@ gst_vaapi_create_display_from_gl_context (GstObject * gl_context_object)
- static void
- gst_vaapi_find_gl_context (GstElement * element)
- {
-+#if USE_GST_GL_HELPERS
-   GstVaapiPluginBase *const plugin = GST_VAAPI_PLUGIN_BASE (element);
- 
-   /* if the element is vaapisink or any vaapi encoder it doesn't need
-@@ -282,6 +283,7 @@ no_valid_gl_display:
-     gst_object_replace (&plugin->gl_other_context, NULL);
-     return;
-   }
-+#endif
- }
- 
- gboolean
--- 
-2.17.1
-
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index b3c72310c2..2e5beb8a0f 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.14.1.tar.xz.sha256sum
-sha256 585c3ddb0c39220de0a33e5d0ed6196a108b8407ec3538d7c64617713b4434e8 gstreamer-vaapi-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.14.2.tar.xz.sha256sum
+sha256 7f1064e27f5abd3a42ef66b425f1a2b9dbae7748c81bd9d090ce52a1aaf30d8a gstreamer-vaapi-1.14.2.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 1e7e6f1c86..ac33559887 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.14.1
+GST1_VAAPI_VERSION = 1.14.2
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index cb1046b9f7..07aa036a21 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.1.tar.xz.sha256sum
-sha256 68e3f38f66e0d04837b60090fe5d9ca1127f5df124669f34ca82e241209171e4 gst-validate-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.14.2.tar.xz.sha256sum
+sha256 ea9e423e5470ef85ef8a0aea1714e7abfc49deb2ed282057367484cdeba6f19f gst-validate-1.14.2.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 104cc0150d..cca3417894 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.14.1
+GST1_VALIDATE_VERSION = 1.14.2
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index c738db6f88..7e809614a1 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.14.1.tar.xz.sha256sum
-sha256 7e7c0962f39388cdf81b5e0d9f768eb15e30f58b346fd79f1ea778979eae113e gstreamer-editing-services-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.14.2.tar.xz.sha256sum
+sha256 05b280d19eb637f17634d32eb3b5ac8963fc9b667aeff29dab3594dbdfc61f34 gstreamer-editing-services-1.14.2.tar.xz
 
 # Hashes for license files:
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 215582bf15..11d99cd160 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.14.1
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.14.2
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 7e75489337..f69cc6a386 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.1.tar.xz.sha256sum
-sha256 28d82b0d261544a9bf85b429399929e4986eb00efcf1ce16cc71d269a4c3186c gstreamer-1.14.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.2.tar.xz.sha256sum
+sha256 4bd6127299f3f29379046bbd58a526e6353b569e0e72f7b4df2ae70df6882e09 gstreamer-1.14.2.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 02158f5238..092d6cb82e 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.14.1
+GSTREAMER1_VERSION = 1.14.2
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
