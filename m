From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:35:17 +0200
Subject: [Buildroot] [git commit] ffmpeg: fix ARM condition for --{enable,
	disable}-vfp
Message-ID: <20141025103545.55AD1AA3C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3300e00ffb4a166a7f3f27eb759c5d73df405cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noted by Arnout, not all ARMv6 have the VFP FPU, therefore instead
of using a condition on ARMv6 or ARMv7-A, this commit changes to use a
condition on BR2_ARM_CPU_HAS_VFPV2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
