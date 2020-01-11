From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:46:00 +0100
Subject: [Buildroot] [git commit] package/fluidsynth: install to staging
Message-ID: <20200111144128.EA3338A542@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73ec188b79ebd0da9a50d8b986bb78dbcbc368e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install fluidsynth to staging to be able to use it in vlc, sdl2_mixer
and gst1-plugins-bad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/fluidsynth.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 4ef0a6f40d..7681e906b1 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -8,6 +8,7 @@ FLUIDSYNTH_VERSION = 2.1.0
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
+FLUIDSYNTH_INSTALL_STAGING = YES
 FLUIDSYNTH_DEPENDENCIES = libglib2
 
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
