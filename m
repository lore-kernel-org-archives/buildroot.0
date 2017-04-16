From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Apr 2017 14:12:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: disable cuda support
Message-ID: <20170416121236.24706-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpv wrongly detects cuda being available:

Checking for CUDA hwaccel : yes

leading to build errors.

Fixes
http://autobuild.buildroot.net/results/e89/e892a537265ad7259024403a0bb3ca5da85ed096/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 2c5d8299c..a21ddeb1d 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -23,6 +23,7 @@ MPV_CONF_OPTS = \
 	--disable-cdda \
 	--disable-cocoa \
 	--disable-coreaudio \
+	--disable-cuda-hwaccel \
 	--disable-libv4l2 \
 	--disable-opensles \
 	--disable-rpi \
-- 
2.11.0
