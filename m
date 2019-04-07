From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 10:44:48 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: disable asm on mips r6
Message-ID: <20190407084214.645D7813C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ac8f92c1efa0445fb993b9722f6684f69376adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/f5125bde6d3604af3342a205a8445947aff95d5a
 - http://autobuild.buildroot.org/results/beb70bd6c1dd9abf7bc1b53299ba0094a36f4179

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
+#??Fix build failure on "addi opcode not supported"
+ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+FFMPEG_CONF_OPTS += --disable-asm
+endif
 endif # MIPS
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
