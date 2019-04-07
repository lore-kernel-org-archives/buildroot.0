From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 09:58:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: disable asm on mips r6
Message-ID: <20190407075816.8226-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/f5125bde6d3604af3342a205a8445947aff95d5a
 - http://autobuild.buildroot.org/results/beb70bd6c1dd9abf7bc1b53299ba0094a36f4179

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 17e4fa7074..eb237d3523 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -482,6 +482,11 @@ FFMPEG_CONF_OPTS += --disable-mipsfpu
 else
 FFMPEG_CONF_OPTS += --enable-mipsfpu
 endif
+
+#?Fix build failure on "addi opcode not supported"
+ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+FFMPEG_CONF_OPTS += --disable-asm
+endif
 endif # MIPS
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-- 
2.20.1
