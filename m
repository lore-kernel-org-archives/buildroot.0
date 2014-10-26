From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 16:50:00 +0100
Subject: [Buildroot] [git commit] gst-ffmpeg: add --pkg-config to internal
	libav configure options
Message-ID: <20141026155119.E884BB089B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15a7140bc55e431590cf47a4f4cc8d793543e343
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The internal copy of libav in gst-ffmpeg does not understand the
PKG_CONFIG env variable, so it throws a line like this at the end
of its configuration:

WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found, library detection may fail.

This patch adds the --pkg-config to let libav know where it is.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 44d3ace..984b64c 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -22,7 +22,8 @@ endif
 
 GST_FFMPEG_CONF_EXTRA_OPTS = \
 		--cross-prefix=$(TARGET_CROSS) \
-		--target-os=linux
+		--target-os=linux \
+		--pkg-config='$(PKG_CONFIG_HOST_BINARY)'
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
