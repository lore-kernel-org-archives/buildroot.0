From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Jan 2020 23:02:35 +0100
Subject: [Buildroot] [PATCH 1/5] package/fluidsynth: install to staging
Message-ID: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install fluidsynth to staging to be able to use it in vlc, sdl2_mixer
and gst1-plugins-bad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.1
