From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Nov 2011 22:40:33 +0100
Subject: [Buildroot] [git commit] opencv: ffmpeg supports needs largefile /
	ipv6
Message-ID: <20111119214056.6372782B39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c83738b2a41fbab73472d48cb676182c8fae48d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opencv/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 1f454b6..961282f 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -31,11 +31,16 @@ config BR2_PACKAGE_OPENCV_WITH_PYTHON
 
 config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	bool "ffmpeg support"
+	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
 	  Use ffmpeg from the target system.
 
+comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
 	select BR2_PACKAGE_GSTREAMER
