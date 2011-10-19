From: Damian Kaczmarek <damian@veritymedical.co.uk>
Date: Wed, 19 Oct 2011 23:01:50 +0200
Subject: [Buildroot] [PATCH] mplayer: fix compiling on ARM by adjusting the
	offset to correct value (compiling with NEON still needs
	manual optimization flags to be set to -mfpu=neon)
Message-ID: <1319058110-31518-1-git-send-email-damian@veritymedical.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Damian Kaczmarek <damian@veritymedical.co.uk>
---
 .../mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch

diff --git a/package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch b/package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch
new file mode 100644
index 0000000..2072c37
--- /dev/null
+++ b/package/multimedia/mplayer/mplayer-1.0rc3-fix-arm-H264-AIC-offset.patch
@@ -0,0 +1,11 @@
+--- mplayer-32726.orig/ffmpeg/libavcodec/arm/asm-offsets.h	2011-10-19 14:52:46.729779445 +0200
++++ mplayer-32726/ffmpeg/libavcodec/arm/asm-offsets.h	2011-10-19 14:50:52.095779444 +0200
+@@ -35,7 +35,7 @@
+ #define AC_PRED                  0xae0
+ #define BLOCK_LAST_INDEX         0x21c0
+ #define INTER_SCANTAB_RASTER_END 0x23c0
+-#define H263_AIC                 0x2670
++#define H263_AIC                 0x2678
+ #elif defined(__APPLE__)
+ #define Y_DC_SCALE               0xa70
+ #define C_DC_SCALE               0xa74
-- 
1.7.3.4
