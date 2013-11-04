From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 22:00:19 +0100
Subject: [Buildroot] [git commit] libvpx: needs thread support
Message-ID: <20131104211055.6335A9BCBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5702d2f3b7f12882d4e33d26606732290e442324
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/8de/8def7e54e4fecb7df350443824c00b53d1c61c01/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in |    4 ++++
 package/libvpx/Config.in                       |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 3342208..a9308c7 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -335,9 +335,13 @@ comment "taglib needs a toolchain w/ C++"
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
 	select BR2_PACKAGE_LIBVPX
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
 	help
 	  VP8 plugin
 
+comment "libvpx needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
 	bool "wavpack (*.wv audio)"
 	select BR2_PACKAGE_WAVPACK
diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 1332c56..0ed3e1a 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBVPX
 	bool "libvpx"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A high-quality, open video format that's freely available to
 	  everyone.
 
 	  http://webmproject.org
+
+comment "libvpx needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
