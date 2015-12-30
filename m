From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:24:56 +0100
Subject: [Buildroot] [git commit] libcdaudio: disable on nios2,
	binutils assertion failure
Message-ID: <20151230092519.2125E826DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53b5374c2f0bfcba3f4c98388da2825adeb54bf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/539/5397c51bc6915a082e873dee2d298f433172ef4d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 1 +
 package/libcdaudio/Config.in                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 3bfd12b..e2a67f1 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -252,6 +252,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
 	bool "cdaudio"
+	depends on !BR2_nios2 # libcdaudio
 	select BR2_PACKAGE_LIBCDAUDIO
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
diff --git a/package/libcdaudio/Config.in b/package/libcdaudio/Config.in
index 02df01e..3eca607 100644
--- a/package/libcdaudio/Config.in
+++ b/package/libcdaudio/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBCDAUDIO
 	bool "libcdaudio"
+	# binutils assertion failure
+	depends on !BR2_nios2
 	help
 	  libcdaudio is a library designed to provide functions to
 	  control operation of a CD-ROM when playing audio CDs. It
