From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:25:58 +0200
Subject: [Buildroot] [git commit] package/fluidsynth: bump to version 2.1.3
Message-ID: <20200604212709.82405839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b49f91aada601704be799afcb920bc3899ca316c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since v2.1.2:
https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.3
- fix a cross-compilation failure from Win32 to WinARM
- fix issues while fluid_player is seeking
- fix a NULL pointer dereference if synth.dynamic-sample-loading is enabled
- fix a NULL pointer dereference in delete_rvoice_mixer_threads()
- fix a NULL pointer dereference in the soundfont loader
- fix dsound driver playing garbage when terminating fluidsynth
- avoid memory leaks when using libinstpatch

./utils/test-pkg --package fluidsynth
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index f7b1b6696a..70bbebf63c 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9206d83b8d2f7e1ec259ee01e943071de67e419aabe142b51312f8edb39c5503  fluidsynth-2.1.2.tar.gz
+sha256  645fbfd7c04543c6d3bf415eab8250527813b8dc8e6d6972dbcc8cb525e1d409  fluidsynth-2.1.3.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 2bd792dbaf..452ab7e497 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.2
+FLUIDSYNTH_VERSION = 2.1.3
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
