From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:27:31 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 13.0.0
Message-ID: <20161102162741.DBB328183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c8da7d3c669e7df62b08490588484b253095529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Udev support was removed upstream:
https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=13.0&id=f9f7e44c94f7eee4778768adf7afffba6c0581e7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 4 ++--
 package/mesa3d/mesa3d.mk                 | 9 +--------
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3080afe..b3b80eb 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 12.0.3
+MESA3D_HEADERS_VERSION = 13.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 09923fd..7dbe1ac 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2016-September/000236.html
-sha256 1dc86dd9b51272eee1fad3df65e18cda2e556ef1bc0b6e07cd750b9757f493b1  mesa-12.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2016-November/000264.html
+sha256 94edb4ebff82066a68be79d9c2627f15995e1fe10f67ab3fc63deb842027d727  mesa-13.0.0.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1aa82d8..e17db5c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 12.0.3
+MESA3D_VERSION = 13.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -41,13 +41,6 @@ MESA3D_DEPENDENCIES += libsha1
 MESA3D_CONF_OPTS += --with-sha1=libsha1
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-MESA3D_DEPENDENCIES += udev
-MESA3D_CONF_OPTS += --disable-sysfs
-else
-MESA3D_CONF_OPTS += --enable-sysfs
-endif
-
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
