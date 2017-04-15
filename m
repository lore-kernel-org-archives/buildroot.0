From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Apr 2017 12:22:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: use
	BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <20170415102236.10720-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/69d/69d33792f2e7ec62bfe593eb4bbc8fb2652d7011/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index adc0f5d42..10e4e74d7 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -452,6 +452,11 @@ else
 FFMPEG_CONF_OPTS += --disable-altivec
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FFMPEG_CONF_OPTS += --extra-libs=-latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
 FFMPEG_CONF_OPTS += --enable-pic
 else
-- 
2.11.0
