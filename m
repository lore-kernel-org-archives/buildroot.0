From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 13 Jan 2014 06:48:11 +0100
Subject: [Buildroot] [PATCH 1/1] ffmpeg: Fix build error regarding missing
	host-yasm
Message-ID: <BLU0-SMTP463FE58CE6FFFBCD32F870BD9BC0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/b2a/b2aefd25431bab3d0f4fcf4c3e6de1ff6fc54ffa//

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f717115..2168785 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -214,7 +214,7 @@ endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPT += --enable-yasm
-FFMPEG_DEPENDENCIES += yasm
+FFMPEG_DEPENDENCIES += host-yasm
 else
 FFMPEG_CONF_OPT += --disable-yasm
 FFMPEG_CONF_OPT += --disable-mmx
-- 
1.7.9.5
