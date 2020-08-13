From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 22:41:25 +0200
Subject: [Buildroot] [git commit] package/fluidsynth: bump to version 2.1.4
Message-ID: <20200813203530.0A1DE85388@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b367a00337e8a85e81e3faf24793249bc214bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since v2.1.3:
https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.4
- fix an uninitialized memory access possibly triggering an FPE trap
- fix several regressions introduced in 2.1.3:
  - fluid_synth_start() failed for certain presets
  - fix a NULL dereference in jack driver
  - fix a stack-based overflow when creating the synth

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 70bbebf63c..9469305cdc 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  645fbfd7c04543c6d3bf415eab8250527813b8dc8e6d6972dbcc8cb525e1d409  fluidsynth-2.1.3.tar.gz
+sha256  6e4f3e4a957d03812765bd0e400f61cd6c9fdb4bf10970e5cdaea8487d54b250  fluidsynth-2.1.4.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 452ab7e497..828a5cab8f 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.3
+FLUIDSYNTH_VERSION = 2.1.4
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
