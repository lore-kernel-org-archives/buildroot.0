From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 21 Dec 2017 15:21:31 -0500
Subject: [Buildroot] [PATCH 1/1] gstreamer1: bump packages to 1.12.4
Message-ID: <20171221202131.6039-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove 0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
in gst-plugins-bad as the code has been fixed upstream:
see commit id: 536cb125773f36ecc46815e72ffa7ae2bba783d7 for more details

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash            |  4 +-
 package/gstreamer1/gst-omx/gst-omx.mk              |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.hash      |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  2 +-
 ...upport-building-with-openjpeg-2.3-simpler.patch | 89 ----------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  2 +-
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash       |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  2 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  2 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |  4 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk           |  2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |  4 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        |  2 +-
 .../gstreamer1/gst1-validate/gst1-validate.hash    |  4 +-
 package/gstreamer1/gst1-validate/gst1-validate.mk  |  2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  2 +-
 21 files changed, 30 insertions(+), 119 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 179993ad2c..c4f8b10bce 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.3.tar.xz.sha256sum
-sha256 eef5de8bab1bb495bfbc9d16af9837d7f55b47cb6b97819b3152c5899c85843c gst-omx-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.4.tar.xz.sha256sum
+sha256 a025fa24242ec868fe0ff1e66d806a1070bcbc7c14a987a89cdc3395d0d56d5f gst-omx-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 98431496a5..68cb7f6696 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.3
+GST_OMX_VERSION = 1.12.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 1fd6ffc27c..f9a287c590 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.3.tar.xz.sha256sum
-sha256 015ef8cab6f7fb87c8fb42642486423eff3b6e6a6bccdcd6a189f436a3619650 gst-libav-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.4.tar.xz.sha256sum
+sha256 2a56aa5d2d8cd912f2bce17f174713d2c417ca298f1f9c28ee66d4aa1e1d9e62 gst-libav-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 41b35abb1e..7450b759f1 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.12.3
+GST1_LIBAV_VERSION = 1.12.4
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
diff --git a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch b/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
deleted file mode 100644
index 23569424a8..0000000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-openjpeg-Support-building-with-openjpeg-2.3-simpler.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From b08b3ad2c4ca27519b34229b7430af5cb73cc7ef Mon Sep 17 00:00:00 2001
-From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
-Date: Thu, 19 Oct 2017 16:36:17 +0200
-Subject: [PATCH] openjpeg: Support building with openjpeg 2.3, simpler
-
-OpenJPEG 2.3 installs its headers to /usr/include/openjpeg-2.3. However,
-since libopenjp2.pc seems to provide the right includedir CFLAGS at
-least since version 2.1, instead of adding yet another version check,
-just remove the subdir and the check for 2.2.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=788703
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=bff2d834a4a38f64e555cee3d0144fde6c515acd
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac               |  5 -----
- ext/openjpeg/gstopenjpeg.h |  6 ++----
- ext/openjpeg/meson.build   | 20 +++++++-------------
- 3 files changed, 9 insertions(+), 22 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7a8d752..f9727ac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2815,11 +2815,6 @@ AG_GST_CHECK_FEATURE(OPENJPEG, [openjpeg library], openjpeg, [
-     AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_1, libopenjp2 >= 2.1)
-     if test x"$HAVE_OPENJPEG_2_1" = x"yes"; then
-       AC_DEFINE([HAVE_OPENJPEG_2_1], 1, [Define if OpenJPEG 2.1 is used])
--        dnl include paths changed for v2.2
--        AG_GST_PKG_CHECK_MODULES(OPENJPEG_2_2, libopenjp2 >= 2.2)
--        if test x"$HAVE_OPENJPEG_2_2" = x"yes"; then
--          AC_DEFINE([HAVE_OPENJPEG_2_2], 1, [Define if OpenJPEG 2.2 is used])
--        fi
-     fi
-   else
-     # Fallback to v1.5
-diff --git a/ext/openjpeg/gstopenjpeg.h b/ext/openjpeg/gstopenjpeg.h
-index 52410a4..f9ca74a 100644
---- a/ext/openjpeg/gstopenjpeg.h
-+++ b/ext/openjpeg/gstopenjpeg.h
-@@ -38,10 +38,8 @@
- #define OPJ_CPRL CPRL
- #else
- #include <stdio.h>
--# if defined(HAVE_OPENJPEG_2_2)
--#  include <openjpeg-2.2/openjpeg.h>
--# elif defined(HAVE_OPENJPEG_2_1)
--#  include <openjpeg-2.1/openjpeg.h>
-+# if defined(HAVE_OPENJPEG_2_1)
-+#  include <openjpeg.h>
- # else
- #  include <openjpeg-2.0/openjpeg.h>
- # endif
-diff --git a/ext/openjpeg/meson.build b/ext/openjpeg/meson.build
-index 0d97ebb..14b8583 100644
---- a/ext/openjpeg/meson.build
-+++ b/ext/openjpeg/meson.build
-@@ -6,21 +6,15 @@ openjpeg_sources = [
- 
- openjpeg_cargs = []
- 
--# Check for 2.2, 2.1, then 2.0
--openjpeg_dep = dependency('libopenjp2', version : '>=2.2', required : false)
-+# Check for 2.1, then 2.0, then 1.5
-+openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
- if openjpeg_dep.found()
--  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_2', '-DHAVE_OPENJPEG_2_1']
-+  openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
- else
--  openjpeg_dep = dependency('libopenjp2', version : '>=2.1', required : false)
--  if openjpeg_dep.found()
--    openjpeg_cargs += ['-DHAVE_OPENJPEG_2_1']
--  else
--    openjpeg_dep = dependency('libopenjp2', required : false)
--    # Fallback to 1.5
--    if not openjpeg_dep.found()
--      openjpeg_dep = dependency('libopenjpeg1', required : false)
--      openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
--    endif
-+  openjpeg_dep = dependency('libopenjp2', required : false)
-+  if not openjpeg_dep.found()
-+    openjpeg_dep = dependency('libopenjpeg1', required : false)
-+    openjpeg_cargs += ['-DHAVE_OPENJPEG_1']
-   endif
- endif
- 
--- 
-2.14.2
-
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 5cd25dad64..752d50a56d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.3.tar.xz.sha256sum
-sha256 36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec gst-plugins-bad-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.4.tar.xz.sha256sum
+sha256 0c7857be16686d5c1ba6e34bd338664d3d4599d32714a8eca5c8a41a101e2d08 gst-plugins-bad-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 9f94148cfa..5594b44def 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.3
+GST1_PLUGINS_BAD_VERSION = 1.12.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 2f4d57d790..b935f2f6dc 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz.sha256sum
-sha256 d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5 gst-plugins-base-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.4.tar.xz.sha256sum
+sha256 4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282 gst-plugins-base-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 19172ab63e..10361ee3c6 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.12.3
+GST1_PLUGINS_BASE_VERSION = 1.12.4
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 4df63aaf7d..c6f6138154 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.3.tar.xz.sha256sum
-sha256 13e7f479296891fef5a686438f20ba7d534680becf2269ecc5ee24aa83b45f03 gst-plugins-good-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.4.tar.xz.sha256sum
+sha256 649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957 gst-plugins-good-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 379fef6531..53e2341586 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.12.3
+GST1_PLUGINS_GOOD_VERSION = 1.12.4
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index c7bbce57ea..d0581531d4 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.3.tar.xz.sha256sum
-sha256 e88ca584c94ea78eeecbf3af00ef7f134b66bdee7408aa4aa6c547235e060052 gst-plugins-ugly-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.4.tar.xz.sha256sum
+sha256 1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522 gst-plugins-ugly-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 4b7ef96092..af02a560a8 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.12.3
+GST1_PLUGINS_UGLY_VERSION = 1.12.4
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 536a77ce82..95c8eef832 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.3.tar.xz.sha256sum
-sha256 67255971bb16029a01de66b9f9687f20d8dbf3d3bd75feb48605d0723a7c74ec gst-rtsp-server-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.12.4.tar.xz.sha256sum
+sha256 7660112ebd59838f1054796b38109dcbe32f0a040e3a252a68a81055aeaa56a9 gst-rtsp-server-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 71c9ef5bda..d6a82ee654 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.12.3
+GST1_RTSP_SERVER_VERSION = 1.12.4
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index 97bebaba69..3eebc0afe7 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.3.tar.xz.sha256sum
-sha256 f4cdafd8fd9606a490917c8b67336e835df1219580d55421c70480fd0913744d gstreamer-vaapi-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.12.4.tar.xz.sha256sum
+sha256 1c2d77242e1f30c4d1394636cae9f6877228a017960fca96881e0080d8b6e9c9 gstreamer-vaapi-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 9783c591aa..6b637416f5 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.12.3
+GST1_VAAPI_VERSION = 1.12.4
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index c726c17252..50bddd0a9f 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.3.tar.xz.sha256sum
-sha256 5139949d20274fdd702492438eeab2c9e55aa82f60aca17db27ebd3faf08489e gst-validate-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.12.4.tar.xz.sha256sum
+sha256 f9da9dfe6e5d6f5ba3b38c5752b42d3f927715904942b405c2924d3cb77afba1 gst-validate-1.12.4.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 33fec08d12..d276490160 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.12.3
+GST1_VALIDATE_VERSION = 1.12.4
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPL-2.1+
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index abcb62e12e..f8af907562 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz.sha256sum
-sha256 d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e gstreamer-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.4.tar.xz.sha256sum
+sha256 5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674 gstreamer-1.12.4.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index c2da60182a..ea9f29a4f3 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.12.3
+GSTREAMER1_VERSION = 1.12.4
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.14.3
