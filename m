From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 23:27:37 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXvMC: remove
 xlib_libXv dependency
Message-ID: <20191025212112.21C098816F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52ac6d1c6bc625d8438539a7ff0f35d2057e9acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since libXvMC 1.0.12, xv was removed from xvmc.pc [1].

[1] https://lists.x.org/archives/xorg-announce/2019-September/003023.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXvMC/Config.in       | 1 -
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
index 5cc6ec766a..4be6e01774 100644
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ b/package/x11r7/xlib_libXvMC/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XLIB_LIBXVMC
 	bool "libXvMC"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXV
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org XvMC library
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 02959c2305..442c410b57 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -10,7 +10,7 @@ XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_INSTALL_STAGING = YES
-XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xorgproto
+XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 XLIB_LIBXVMC_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
