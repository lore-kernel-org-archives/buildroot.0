From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 08:35:56 +0100
Subject: [Buildroot] [git commit] ffmpeg: Fix build error regarding missing
	host-yasm
Message-ID: <20140113074100.92D009C49A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eb78ba124ac181d22b1cdfe513f79aa68014a18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b2a/b2aefd25431bab3d0f4fcf4c3e6de1ff6fc54ffa//

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
