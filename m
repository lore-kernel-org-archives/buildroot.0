From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 24 Jul 2015 20:13:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix mips compile
Message-ID: <1437761628-4558-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot has no support for msa, CONFIG_CPU_HAS_MSA is not enabled in
kernel config.

Fixes
http://autobuild.buildroot.net/results/030/03055aa696e9e885baabb43fff613d751974a4b7//
http://autobuild.buildroot.net/results/6b5/6b5c13c949e8ae23f1b58c6da4002371130e9bb3//
http://autobuild.buildroot.net/results/1af/1af3c68bc21503438fb0066f5e51e82e35a5442b//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0162db2..28c6012 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -41,6 +41,7 @@ FFMPEG_CONF_OPTS = \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
 	--disable-memalign-hack \
+	--disable-msa \
 	--enable-hwaccels \
 	--disable-avisynth \
 	--disable-frei0r \
-- 
1.7.10.4
