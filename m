From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:10:53 +0200
Subject: [Buildroot] [git commit] rpi-userland: cleanup *_CONF_OPT
Message-ID: <20140608131255.3725C9CB8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74ef77c4325a4a77b5585158f1c093becb741bee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change reverts the commit 5e3b1f31b3f82e3b163567f10d7131c9d649a2cf
because rpi-userland is correctly built whatever the value of the
BUILD_SHARED_LIBS CMake flags.

The cset 5e3b1f31b3f82e3b163567f10d7131c9d649a2cf originally intends to
fix linkage/runtime failure in xbmc package because of missing flags in
xbmc LIBS env. var. This has been fixed in the previous patch.

So, for rpi-userland package, BUILD_SHARED_LIBS does no longer need to
be forced to OFF, and can safely be driven by the CMake infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 8b225ba..2de6b92 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -9,7 +9,7 @@ RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
-RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF
+RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
