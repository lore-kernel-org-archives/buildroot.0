From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 08:49:53 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/mediastreamer:
 resample needs speex and speexdsp
Message-ID: <20210129075004.630D183E5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bdb0ea0130f41413b2982bf9c554a9fd94a367c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

resample needs speex and speexdsp as spotted by Thomas Petazzoni during
review of https://patchwork.ozlabs.org/patch/1252391/

Fixes:
 - http://autobuild.buildroot.org/results/32d06517a5470f71d9b7dc99139f6c3071e7d77d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fda55709d245e948b80e57c2179790326967cdb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mediastreamer/mediastreamer.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 691eaddb52..982eadf099 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -113,6 +113,12 @@ else
 MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
+MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=ON
+else
+MEDIASTREAMER_CONF_OPTS += -DENABLE_RESAMPLE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
 MEDIASTREAMER_CONF_OPTS += -DENABLE_FFMPEG=ON
 MEDIASTREAMER_DEPENDENCIES += ffmpeg
