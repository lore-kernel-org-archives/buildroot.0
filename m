From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Jun 2012 08:57:35 +0200
Subject: [Buildroot] [git commit] mediastreamer: portaudio backend needs
	speex
Message-ID: <20120619065922.F1C1C829FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9345f85822635291016f0b6e7cf855e07dbb028
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/27996b33a6e3080f8d96204f5c1c421b17a86d6e

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mediastreamer/mediastreamer.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index be91c44..716a733 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -12,9 +12,10 @@ else
 MEDIASTREAMER_CONF_OPT += --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+# portaudio backend needs speex as well
+ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX),yy)
 MEDIASTREAMER_CONF_OPT += --enable-portaudio
-MEDIASTREAMER_DEPENDENCIES += portaudio
+MEDIASTREAMER_DEPENDENCIES += portaudio speex
 else
 MEDIASTREAMER_CONF_OPT += --disable-portaudio
 endif
