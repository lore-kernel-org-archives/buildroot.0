From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Aug 2019 10:00:22 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/ffmpeg: add optional
 dependency to dav1d
In-Reply-To: <20190810080022.3222-1-bernd.kuhls@t-online.de>
References: <20190810080022.3222-1-bernd.kuhls@t-online.de>
Message-ID: <20190810080022.3222-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b1eb29dfd7..2b459aec18 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -403,6 +403,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libx265
 endif
 
+ifeq ($(BR2_PACKAGE_DAV1D),y)
+FFMPEG_CONF_OPTS += --enable-libdav1d
+FFMPEG_DEPENDENCIES += dav1d
+else
+FFMPEG_CONF_OPTS += --disable-libdav1d
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-x86asm
 FFMPEG_DEPENDENCIES += host-nasm
-- 
2.20.1
