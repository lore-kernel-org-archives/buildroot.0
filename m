From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 17:10:14 +0200
Subject: [Buildroot] [git commit] package/mpv: disable cuda support
Message-ID: <20170416151109.311A482713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=030bebd7f137ffc9c41d4911c7957f720ed971c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpv wrongly detects cuda being available:

Checking for CUDA hwaccel : yes

leading to build errors.

Fixes
http://autobuild.buildroot.net/results/e89/e892a537265ad7259024403a0bb3ca5da85ed096/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 2c5d829..a21ddeb 100644
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
