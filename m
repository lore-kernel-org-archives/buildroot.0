From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 16:21:27 +0100
Subject: [Buildroot] [git commit] support/dependencies: set cmake version
 min to 3.15
Message-ID: <20201225150817.C6FA088365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37f197f8634352750f169b6a287588a09b82e00e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

quazip requires cmake 3.15 since version 1.0 and
https://github.com/stachenov/quazip/commit/89e7c201f0215032d347eef6fc0c671a1845738b
https://github.com/stachenov/quazip/commit/818adc82246cefffa2e8851534016cf1db349da7

The rationale for this requirement is that "default locations for the
install(TARGETS command based on the GNUInstallDirs package were only
added in 3.14" and "3.15 is not that much of a difference from 3.14 and
it introduced a lot of useful UI improvements.":
https://github.com/stachenov/quazip/issues/82

Fixes:
 - http://autobuild.buildroot.org/results/5d848a46109aef448ea1d1b857a500d9461dc2d9

Note: we also have some patches to allow some packages to build with
cmake-3.10, and this will not be tenable over the long run.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add the "note"]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/dependencies/check-host-cmake.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 01f38da376..e1bbcd62c8 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -1,9 +1,9 @@
-# Set this to either 3.10 or higher, depending on the highest minimum
+# Set this to either 3.15 or higher, depending on the highest minimum
 # version required by any of the packages bundled in Buildroot. If a
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
-BR2_CMAKE_VERSION_MIN = 3.10
+BR2_CMAKE_VERSION_MIN = 3.15
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
