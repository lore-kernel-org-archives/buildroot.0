From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 08:49:40 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/mediastreamer:
 portaudio needs speexdsp
Message-ID: <20210129075004.58F7D803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc0d1d63a0d9c27130ea81dbf1098b0d8a0b7989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 8f5562ed7c227f29dbfa6897f54dccda0dfbf656 wrongly removed speexdsp
dependency from portaudio

Fixes:
 - http://autobuild.buildroot.org/results/e6adf151141ae56f5194165fd5b74b52164bfb17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 242811a5473624d6d2139901aa6a8739aed54bc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
