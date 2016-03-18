From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Mar 2016 14:06:04 +0000
Subject: [Buildroot] [PATCH 1/3] ffmpeg: bump to version 3.0
Message-ID: <1458309966-16835-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove non-existen configure options:
  - --disable-mips32r2
  - --disable-libvo-aacenc

- Amend renamed configure options:
  - --disable-mipsdspr1 has been renamed to --disable-mipsdsp

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/ffmpeg.hash |  4 ++--
 package/ffmpeg/ffmpeg.mk   | 13 ++-----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 8643bff..3456883 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa	ffmpeg-2.8.6.tar.xz
+# Locally calculated (PGP Signature: https://ffmpeg.org/releases/ffmpeg-3.0.tar.xz.asc)
+sha256 12f32cee41c74435f608c30793fd616bdf53467bb513278e273e135a4c58e470 ffmpeg-3.0.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddfac20..75c0128 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.6
+FFMPEG_VERSION = 3.0
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -41,7 +41,7 @@ FFMPEG_CONF_OPTS = \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
 	--disable-memalign-hack \
-	--disable-mipsdspr1 \
+	--disable-mipsdsp \
 	--disable-mipsdspr2 \
 	--disable-msa \
 	--enable-hwaccels \
@@ -58,7 +58,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libnut \
 	--disable-libopenjpeg \
 	--disable-libschroedinger \
-	--disable-libvo-aacenc \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
 	--disable-doc
@@ -437,14 +436,6 @@ FFMPEG_CONF_OPTS += \
 	--enable-mipsfpu
 endif
 
-ifeq ($(BR2_mips_32r2),y)
-FFMPEG_CONF_OPTS += \
-	--enable-mips32r2
-else
-FFMPEG_CONF_OPTS += \
-	--disable-mips32r2
-endif
-
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 FFMPEG_CONF_OPTS += --enable-altivec
 else
-- 
2.7.3
