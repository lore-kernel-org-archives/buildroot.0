From: David du Colombier <0intro@gmail.com>
Date: Tue, 30 Sep 2014 15:28:04 +0200
Subject: [Buildroot] [PATCH 2/3] ffmpeg: enable libvpx support
In-Reply-To: <1412083685-20812-1-git-send-email-0intro@gmail.com>
References: <1412083685-20812-1-git-send-email-0intro@gmail.com>
Message-ID: <1412083685-20812-2-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ae3d4c3..5818db1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -215,6 +215,13 @@ else
 FFMPEG_CONF_OPT += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+FFMPEG_CONF_OPT += --enable-libvpx
+FFMPEG_DEPENDENCIES += libvpx
+else
+FFMPEG_CONF_OPT += --disable-libvpx
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPT += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
-- 
1.9.3
