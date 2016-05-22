From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:43:26 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-libav: not
	available on nios2
Message-ID: <20160522194337.A59F6818DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d91c076ca193ae4cb2052b7bba8a527f8deb7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg is not available on nios2, this limitation was not reverse-
propagated to this package.

Fixes
http://autobuild.buildroot.net/results/267/2674395c1d804df68e7e4bc9bba1d6b7fc6d2dce/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
