From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Mar 2020 19:01:21 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/mediastreamer: resample needs speex and speexdsp
In-Reply-To: <20200323180121.688647-1-fontaine.fabrice@gmail.com>
References: <20200323180121.688647-1-fontaine.fabrice@gmail.com>
Message-ID: <20200323180121.688647-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

resample needs speex and speexdsp as spotted by Thomas Petazzoni during
review of https://patchwork.ozlabs.org/patch/1252391/

Fixes:
 - http://autobuild.buildroot.org/results/32d06517a5470f71d9b7dc99139f6c3071e7d77d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - resample needs speex and speexdsp

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
-- 
2.25.1
