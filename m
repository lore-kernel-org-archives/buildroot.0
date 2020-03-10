From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Mar 2020 20:58:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: speexdsp and
 portaudio needs speex
Message-ID: <20200310195838.2988-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8f5562ed7c227f29dbfa6897f54dccda0dfbf656 wrongly removed speex
dependency from speexdsp and portaudio

Fixes:
 - http://autobuild.buildroot.org/results/e6adf151141ae56f5194165fd5b74b52164bfb17
 - http://autobuild.buildroot.org/results/32d06517a5470f71d9b7dc99139f6c3071e7d77d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mediastreamer/mediastreamer.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index dcec66dfcd..5db0effbb4 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -80,7 +80,8 @@ else
 MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+# portaudio backend needs speex as well
+ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yyy)
 MEDIASTREAMER_CONF_OPTS += \
 	-DENABLE_PORTAUDIO=ON \
 	-DENABLE_SOUND=ON
@@ -105,7 +106,7 @@ else
 MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_CODEC=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 MEDIASTREAMER_CONF_OPTS += -DENABLE_SPEEX_DSP=ON
 MEDIASTREAMER_DEPENDENCIES += speexdsp
 else
-- 
2.25.1
