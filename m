From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Feb 2011 21:27:40 +0100
Subject: [Buildroot] [git commit master 1/1] mpd: move ffmpeg option up
Message-ID: <20110225202930.EC8758F780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=77dfefd43cab12c0393ba63953a08ab3615d618c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the ffmpeg option up to keep the pretty sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/Config.in |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 049c0fc..b3491f2 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -56,6 +56,17 @@ config BR2_PACKAGE_MPD_FLAC
 	  Enable flac input/streaming support.
 	  Select this if you want to play back FLAC files.
 
+config BR2_PACKAGE_MPD_FFMPEG
+	bool "ffmpeg"
+	select BR2_PACKAGE_FFMPEG
+	depends on BR2_LARGEFILE
+	help
+	  Enable ffmpeg input support.
+	  Select this if you want to play back files supported by ffmpeg.
+
+comment "ffmpeg support requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_MPD_LAME
 	bool "lame"
 	select BR2_PACKAGE_LAME
@@ -147,17 +158,6 @@ config BR2_PACKAGE_MPD_WAVPACK
 	  Enable wavpack input support.
 	  Select this if you want to play back WV files.
 
-config BR2_PACKAGE_MPD_FFMPEG
-	bool "ffmpeg"
-	select BR2_PACKAGE_FFMPEG
-	depends on BR2_LARGEFILE
-	help
-	  Enable ffmpeg input support.
-	  Select this if you want to play back files supported by ffmpeg.
-
-comment "ffmpeg support requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
-
 endif
 
 comment "mpd requires a toolchain with C++ and WCHAR support"
-- 
1.7.3.4
