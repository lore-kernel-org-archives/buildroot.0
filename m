From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 22:59:08 +0200
Subject: [Buildroot] [git commit] ffmpeg: enable x264 support
Message-ID: <20141007210844.962EEB0F59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3182056e98f698c3c7ed721cc76dc69aa9dcb008
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David du Colombier <0intro@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1af47a6..af4e1f6 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -229,6 +229,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libvpx
 endif
 
+ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
+FFMPEG_CONF_OPTS += --enable-libx264
+FFMPEG_DEPENDENCIES += x264
+else
+FFMPEG_CONF_OPTS += --disable-libx264
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
