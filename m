From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:16:34 +0200
Subject: [Buildroot] [git commit] package/fluidsynth: bump to version 2.1.2
Message-ID: <20200408201014.DAE138E0E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5334d9a200f0b3c8df5db7ad7d609aeb32f62ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since v2.1.1:
https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.2
- fluidsynth now exits with error when user-provided command-line arguments are out-of-range
- add verbose error logging to opensles and oboe drivers
- fix a memory leak in oboe driver
- fix a NULL dereference in the fluidsynth commandline program

./utils/test-pkg --package fluidsynth
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index f7c9c88cd2..f7b1b6696a 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  966d0393591b505d694e51cbf653387007144e9ae0b8705d82ec7d943d31d348  fluidsynth-2.1.1.tar.gz
+sha256  9206d83b8d2f7e1ec259ee01e943071de67e419aabe142b51312f8edb39c5503  fluidsynth-2.1.2.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index b06db23cc8..2bd792dbaf 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.1
+FLUIDSYNTH_VERSION = 2.1.2
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
