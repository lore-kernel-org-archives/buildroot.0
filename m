From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 13:39:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/fluidsynth: add systemd optional
 dependency
In-Reply-To: <20200424113928.213441-1-fontaine.fabrice@gmail.com>
References: <20200424113928.213441-1-fontaine.fabrice@gmail.com>
Message-ID: <20200424113928.213441-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd is an optional dependency (enabled by default) since version
2.0.5 and
https://github.com/FluidSynth/fluidsynth/commit/099369f8b7f39afe08b6a518195948b05a937af3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluidsynth/fluidsynth.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 98eb1ad30c..22ba59669c 100644
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
-- 
2.25.1
