From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 12 May 2011 16:47:18 -0400
Subject: [Buildroot] [PATCH] ffmpeg: ffmpeg binary requires swscale
Message-ID: <1305233238-324-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mike Williams <mike@mikebwilliams.com>
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
