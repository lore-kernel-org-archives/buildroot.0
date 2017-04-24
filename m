From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 17:44:06 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/mpv: disable cuda
	support
Message-ID: <20170424193338.0F1E7821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e48857917e746bad70ce08464461d6843ed1ac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

mpv wrongly detects cuda being available:

Checking for CUDA hwaccel : yes

leading to build errors.

Fixes
http://autobuild.buildroot.net/results/e89/e892a537265ad7259024403a0bb3ca5da85ed096/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 030bebd7f137ffc9c41d4911c7957f720ed971c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 5b83b6d..25b54e5 100644
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
