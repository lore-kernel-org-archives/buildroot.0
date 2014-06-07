From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:31 +0200
Subject: [Buildroot] [PATCH v12 31/32] rpi-userland: cleanup *_CONF_OPT
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

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
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.7.10.4
