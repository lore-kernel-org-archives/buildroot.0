From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:51:58 +0100
Subject: [Buildroot] [git commit] package/mediastreamer: portaudio needs
 speexdsp
Message-ID: <20200324203857.AF20088126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=242811a5473624d6d2139901aa6a8739aed54bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f5562ed7c227f29dbfa6897f54dccda0dfbf656 wrongly removed speexdsp
dependency from portaudio

Fixes:
 - http://autobuild.buildroot.org/results/e6adf151141ae56f5194165fd5b74b52164bfb17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
