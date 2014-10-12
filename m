From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 12 Oct 2014 15:30:06 -0400
Subject: [Buildroot] [PATCH v3 3/3] gst-ffmpeg: expand package description
	to describe libav usage
In-Reply-To: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1413142206-30581-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Change URL to gst-ffmpeg page at the gstreamer site.
- Note that gst-ffmpeg actually uses libav, not ffmpeg [anymore].
- Note that gst-ffmpeg is using an internal copy of libav, not a
  system copy.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/gstreamer/gst-ffmpeg/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 00c3471..10e51b3 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -4,9 +4,14 @@ menuconfig BR2_PACKAGE_GST_FFMPEG
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
-	  GStreamer plugin using FFmpeg.
+	  GStreamer plugin containing one plugin with a set of elements using
+	  the Libav library.  It contains most popular decoders as well as
+	  colorspace conversion elements.
 
-	  http://gstreamer.freedesktop.org/
+	  This package is configured to use an internal copy of the Libav
+	  library.
+
+	  http://gstreamer.freedesktop.org/modules/gst-ffmpeg.html
 
 if BR2_PACKAGE_GST_FFMPEG
 
-- 
1.9.1
