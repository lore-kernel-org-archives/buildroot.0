From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  4 Jun 2014 13:14:08 +0200
Subject: [Buildroot] [PATCH v5 2/2] rpi-userland: cleanup *_CONF_OPT
In-Reply-To: <1401880448-2496-1-git-send-email-s.martin49@gmail.com>
References: <1401880448-2496-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1401880448-2496-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
changes v4 -> v5:
- rebase
- extend commit log (ThomasP)

changes v3 -> v4:
- rebase

changes v2 -> v3:
- new patch
---
 package/rpi-userland/rpi-userland.mk | 2 +-
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
1.9.2
