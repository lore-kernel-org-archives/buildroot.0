From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Dec 2012 23:25:53 +0100
Subject: [Buildroot] [git commit] package: use BR2_ARM_CPU_HAS_NEON
Message-ID: <20121213230620.A7DD69A1F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce8a7d50557d8f4a8dd3ae8a2259cc8996a38c57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk        |    3 +--
 package/multimedia/ffmpeg/ffmpeg.mk   |    3 +--
 package/multimedia/mplayer/mplayer.mk |    2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 2e9e930..1f053e3 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -142,8 +142,7 @@ else
 LIBEVAS_CONF_OPT += --disable-cpu-altivec
 endif
 
-ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
-# NEON is optional for A9
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 LIBEVAS_CONF_OPT += --enable-cpu-neon
 else
 LIBEVAS_CONF_OPT += --disable-cpu-neon
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 994c7cd..90c1f1b 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -143,8 +143,7 @@ endif
 ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s)$(BR2_cortex_a8)$(BR2_cortex_a9),y)
 FFMPEG_CONF_OPT += --enable-armvfp
 endif
-# NEON is optional for A9
-ifeq ($(BR2_cortex_a8),y)
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 FFMPEG_CONF_OPT += --enable-neon
 endif
 # Set powerpc altivec appropriately
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 17680b6..4a1abf4 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -112,7 +112,7 @@ ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv6j)
 MPLAYER_CONF_OPTS += --enable-armv6
 endif
 
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 MPLAYER_CONF_OPTS += --enable-neon
 endif
 
