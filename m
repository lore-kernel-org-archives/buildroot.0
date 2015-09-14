From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 21:43:45 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: depend on directfb
	instead of selecting it for directfb plugin
Message-ID: <20150914194447.55A267FD26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f8b4388236e1a055c648b1c9b72769d76e2933b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed here:
http://lists.busybox.net/pipermail/buildroot/2015-September/139213.html

It makes more sense to use 'depends on' (and default to y) for a big
dependency like directfb.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 590a9cf..89066af 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -492,13 +492,8 @@ comment "decklink needs a toolchain w/ C++"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
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
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
