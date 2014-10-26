From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 16:50:13 +0100
Subject: [Buildroot] [git commit] gst-ffmpeg: expand package description to
	describe libav usage
Message-ID: <20141026155119.F032EB089B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a732c545246d4066d8eb389ac17c6983c0b4e20e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Change URL to gst-ffmpeg page at the gstreamer site.
- Note that gst-ffmpeg actually uses libav, not ffmpeg [anymore].
- Note that gst-ffmpeg is using an internal copy of libav, not a
  system copy.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-ffmpeg/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 9bf5196..ab80ef8 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -4,9 +4,14 @@ config BR2_PACKAGE_GST_FFMPEG
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
 
