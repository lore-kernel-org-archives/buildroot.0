From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 May 2016 09:28:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/gstreamer1/gst1-libav: not
	available on nios2
Message-ID: <1463902120-8275-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ffmpeg is not available on nios2, this limitation was not reverse-
propagated to this package.

Fixes
http://autobuild.buildroot.net/results/267/2674395c1d804df68e7e4bc9bba1d6b7fc6d2dce/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer1/gst1-libav/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index b4b7aa7..8c3c834 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
+	depends on !BR2_nios2 # ffmpeg
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
-- 
2.8.1
