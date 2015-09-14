From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 21:36:51 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: depend on directfb
	instead of selecting it for directfb plugin
Message-ID: <20150914194447.4CDD6819C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b7275b563e6e11a3708ba5cc2878b8b4f327fec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed here:
http://lists.busybox.net/pipermail/buildroot/2015-September/139213.html

It makes more sense to use 'depends on' (and default to y) for a big
dependency like directfb.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-bad/Config.in |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 339c6a6..6aa93de 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -260,13 +260,8 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
-	select BR2_PACKAGE_DIRECTFB
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # directfb
-
-comment "directfb needs a toolchain w/ C++, threads, gcc >= 4.5"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on BR2_PACKAGE_DIRECTFB
+	default y
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
