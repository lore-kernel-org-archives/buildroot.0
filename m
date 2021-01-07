From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:24:07 +0100
Subject: [Buildroot] [git commit] package/fluidsynth: add systemd optional
 dependency
Message-ID: <20210107220624.C60B083A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8057d26600cee93d54f0cdbbd5c8c2cd05da3a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd is an optional dependency (enabled by default) since version
2.0.5 and
https://github.com/FluidSynth/fluidsynth/commit/099369f8b7f39afe08b6a518195948b05a937af3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/fluidsynth.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index c53c5d7649..dc777e0bf9 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -73,4 +73,11 @@ else
 FLUIDSYNTH_CONF_OPTS += -Denable-sdl2=0
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FLUIDSYNTH_CONF_OPTS += -Denable-systemd=1
+FLUIDSYNTH_DEPENDENCIES += systemd
+else
+FLUIDSYNTH_CONF_OPTS += -Denable-systemd=0
+endif
+
 $(eval $(cmake-package))
