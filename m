From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Feb 2015 18:56:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix nios2 fenv build failure
Message-ID: <1424454969-13751-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/216/216fbc33c4838b1414cb25f823fd1db5c92e33c6/
http://autobuild.buildroot.net/results/800/800fe1d79ef2e52b86a97feeba85b5c47aff8dcd/
http://autobuild.buildroot.net/results/8a6/8a6d24ecc6487fd20ba663f71996160124083a68/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 5f86f52..7a3a3b9 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -5,6 +5,8 @@ menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
+	depends on !BR2_nios2
 	help
 	  FFmpeg is a complete, cross-platform solution to record, convert
 	  and stream audio and video.
-- 
1.7.10.4
