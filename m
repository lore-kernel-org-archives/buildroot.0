From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:20:47 +0200
Subject: [Buildroot] [git commit] ffmpeg: fix dependencies
Message-ID: <20150612192737.C9FAE7F9C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=316a0a43a5577c5977984654bb1de3b86260e056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ffmpeg binary does not require swscale, but ffplay needs it.

ffserver needs fork().

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 00163ba..e5981fe 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_FFMPEG_NONFREE
 
 config BR2_PACKAGE_FFMPEG_FFMPEG
 	bool "Build ffmpeg (the command line application)"
-	select BR2_PACKAGE_FFMPEG_SWSCALE
 	default y
 	help
 	  FFmpeg is a very fast video and audio converter.
@@ -36,6 +35,7 @@ config BR2_PACKAGE_FFMPEG_FFMPEG
 
 config BR2_PACKAGE_FFMPEG_FFPLAY
 	bool "Build ffplay"
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_SDL
 	help
 	  FFplay is a very simple and portable media player using the
@@ -44,6 +44,7 @@ config BR2_PACKAGE_FFMPEG_FFPLAY
 
 config BR2_PACKAGE_FFMPEG_FFSERVER
 	bool "Build ffserver"
+	depends on BR2_USE_MMU # fork()
 	help
 	  FFserver is a streaming server for both audio and video.
 
