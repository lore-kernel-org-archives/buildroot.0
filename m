From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 13 May 2011 15:12:25 +0200
Subject: [Buildroot] [git commit] ffmpeg: ffmpeg binary requires swscale
Message-ID: <20110513131407.1168C834CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ed1f1e3cd12b38dd4defc2f33744df40d772705
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index 7a9513c..d11233e 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_FFMPEG_NONFREE
 
 config BR2_PACKAGE_FFMPEG_FFMPEG
 	bool "Build ffmpeg (the command line application)"
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	default y
 	help
          FFmpeg is a very fast video and audio converter.
-- 
1.7.3.4
