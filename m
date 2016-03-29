From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 00:17:17 +0200
Subject: [Buildroot] [PATCH 4/6] package/ffmpeg: default to --cpu=generic
	for MIPS architecture
In-Reply-To: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459289839-6230-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459289839-6230-4-git-send-email-bernd.kuhls@t-online.de>
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
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 49fc0d9..2a0a155 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -452,6 +452,11 @@ else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
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
2.8.0.rc3
