From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 00:17:15 +0200
Subject: [Buildroot] [PATCH 2/6] package/ffmpeg: bump to version 3.0.1
In-Reply-To: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459289839-6230-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

- Remove non-existen configure options:
  - --disable-mips32r2
  - --disable-libvo-aacenc

- Amend renamed configure options:
  - --disable-mipsdspr1 has been renamed to --disable-mipsdsp

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(Bernd: bumped to version 3.0.1)
---
 package/ffmpeg/ffmpeg.hash |  2 +-
 package/ffmpeg/ffmpeg.mk   | 13 ++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 8643bff..65fe32b 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa	ffmpeg-2.8.6.tar.xz
+sha256	c389ca5e3c29e758dd82ee6981130fe79e73b06e26db1a3aa971daea63598bc1	ffmpeg-3.0.1.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddfac20..26633e4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.6
+FFMPEG_VERSION = 3.0.1
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
2.8.0.rc3
