From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 Aug 2016 17:03:37 +0200
Subject: [Buildroot] [PATCH/next v5 2/6] package/ffmpeg: default to
	--cpu=generic for MIPS architecture
In-Reply-To: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1471273421-12076-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

This option is needed to prevent this message from configure:

WARNING: unknown CPU. Disabling all MIPS optimizations.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: no changes
v4: no changes
v3: no changes
v2: no changes

 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a816cea..154a091 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -455,6 +455,11 @@ else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
 endif
 
+# Default to --cpu=generic for MIPS architecture
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+FFMPEG_CONF_OPTS += --cpu=generic
+endif
+
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
-- 
2.8.1
