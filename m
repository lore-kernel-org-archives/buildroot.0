From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Mar 2020 19:01:20 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/mediastreamer: portaudio needs speexdsp
Message-ID: <20200323180121.688647-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8f5562ed7c227f29dbfa6897f54dccda0dfbf656 wrongly removed speexdsp
dependency from portaudio

Fixes:
 - http://autobuild.buildroot.org/results/e6adf151141ae56f5194165fd5b74b52164bfb17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - portaudio only needs speexdsp, not speex

 package/mediastreamer/mediastreamer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index dcec66dfcd..691eaddb52 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -80,7 +80,8 @@ else
 MEDIASTREAMER_CONF_OPTS += -DENABLE_OPUS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+# portaudio backend needs speexdsp as well
+ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEXDSP),yy)
 MEDIASTREAMER_CONF_OPTS += \
 	-DENABLE_PORTAUDIO=ON \
 	-DENABLE_SOUND=ON
-- 
2.25.1
