From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Feb 2014 10:24:45 -0300
Subject: [Buildroot] [PATCH] mpd: fix vorbis build failure
Message-ID: <1391779485-3831-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forcibly disable the vorbis encoder support when the vorbis option isn't
enabled to avoid autodetection.
Said autodetection has a build bug that it won't properly set libvorbis
build options when the decoder is disabled. Fixes:
http://autobuild.buildroot.net/results/a46/a46b4c97fe126b23a96051a8bf1243a7f4935434/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4a7926c..6bdb149 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -91,7 +91,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
 else
-MPD_CONF_OPT += --disable-vorbis
+MPD_CONF_OPT += --disable-vorbis --disable-vorbis-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
-- 
1.8.3.2
