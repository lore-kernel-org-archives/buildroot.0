From: Danomi Manchego <d_mo1234@yahoo.com>
Date: Sun, 22 Apr 2012 19:18:51 -0400
Subject: [Buildroot] [PATCH] Add cortex-a8 cpu spec to ffmpeg neon config.
Message-ID: <1335136731-4509-1-git-send-email-d_mo1234@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since neon support is specific to Arm Cortex-A8, and buildroot
recognizes this by having a specific Cortex-A8 clause in ffmpeg.mk,
let's add the --cpu needed to make the ffmpeg configuration actually
report the arch as "arm (cortex-a8)", instead of just "arm (generic)".

Signed-off-by: Danomi Manchego <d_mo1234@yahoo.com>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 4cc29ee..633ec9e 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -145,7 +145,7 @@ FFMPEG_CONF_OPT += --enable-armvfp
 endif
 # NEON is optional for A9
 ifeq ($(BR2_cortex_a8),y)
-FFMPEG_CONF_OPT += --enable-neon
+FFMPEG_CONF_OPT += --enable-neon --cpu=cortex-a8
 endif
 # Set powerpc altivec appropriately
 ifeq ($(BR2_powerpc),y)
-- 
1.7.5.4
