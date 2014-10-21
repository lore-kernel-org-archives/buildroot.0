From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:26:50 +0200
Subject: [Buildroot] [PATCH v2 03/30] ffmpeg: fix ARM condition for
	--{enable, disable}-vfp
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As noted by Arnout, not all ARMv6 have the VFP FPU, therefore instead
of using a condition on ARMv6 or ARMv7-A, this commit changes to use a
condition on BR2_ARM_CPU_HAS_VFPV2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 349bac9..0990f18 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -285,7 +285,7 @@ FFMPEG_CONF_OPTS += --enable-armv6
 else
 FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
 endif
-ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
+ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
 FFMPEG_CONF_OPTS += --enable-vfp
 else
 FFMPEG_CONF_OPTS += --disable-vfp
-- 
2.0.0
