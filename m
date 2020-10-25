From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:26:44 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-imx: bump to
 version 0.13.1
Message-ID: <20201025091438.E71AD84EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df646546894b535a3a7942044200a81313e7ae86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove gst1-imx/0001-waf-update-to-2-0-12.patch as it's already upstreamed.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gst1-imx/0001-waf-update-to-2-0-12.patch       | 28 ----------------------
 package/gstreamer1/gst1-imx/gst1-imx.hash          |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch b/package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch
deleted file mode 100644
index dcc586311e..0000000000
--- a/package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 66bc1c2b9c74dab4706a1ca3696e863ed8d30433 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.krummenacher@toradex.com>
-Date: Sun, 15 Dec 2019 14:24:54 +0000
-Subject: [PATCH] waf: update to 2.0.12
-
-Prepare to allow building with python3.
-
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
-[Titouan: backport part from upstream, but drop the update of waf itself]
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
----
- wscript |  3 ++-
- 2 files changed, 12 insertions(+), 11 deletions(-)
-
-diff --git a/wscript b/wscript
-index c3a9926..f076b64 100644
---- a/wscript
-+++ b/wscript
-@@ -152,7 +152,8 @@ def configure(conf):
- 
- 	# test for GStreamer libraries
- 
--	gst_version_str = conf.check_cfg(package = 'gstreamer-1.0 >= 1.2.0', modversion = "gstreamer-1.0", uselib_store = 'GSTREAMER', args = '--cflags --libs', mandatory = 1)
-+	conf.check_cfg(package = 'gstreamer-1.0 >= 1.2.0', uselib_store = 'GSTREAMER', args = '--cflags --libs', mandatory = 1)
-+	gst_version_str = conf.check_cfg(modversion = "gstreamer-1.0", uselib_store = 'GSTREAMER', args = '--cflags --libs', mandatory = 1)
- 	gst_version = [int(x) for x in re.match('(\d*)\.(\d*)\.(\d*)', gst_version_str).groups()]
- 	conf.env['GSTREAMER_VERSION'] = gst_version
- 
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index 0ef01d71e9..0a701a058f 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 3fcf1046ab8c6c7cd94218f4d2bc31ad7b5efa8a6b8f9fd5d93dc182f98ce026  gst1-imx-0.13.0.tar.gz
+sha256 21feb24130c18e4a1f8cc4f72d575903d1f9134dd0604e41e91b5e783d81e320  gst1-imx-0.13.1.tar.gz
 sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  LICENSE
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 1156077274..f091b4f983 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_IMX_VERSION = 0.13.0
+GST1_IMX_VERSION = 0.13.1
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
 GST1_IMX_LICENSE = LGPL-2.0+
