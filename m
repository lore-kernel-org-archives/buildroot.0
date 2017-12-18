From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Dec 2017 21:56:09 +0100
Subject: [Buildroot] [PATCH 4/4] package/lib{va, va-intel-driver,
 va-utils}: bump version to 2.0.0
In-Reply-To: <20171218205609.17653-1-bernd.kuhls@t-online.de>
References: <20171218205609.17653-1-bernd.kuhls@t-online.de>
Message-ID: <20171218205609.17653-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EGL API support was removed upstream:
https://github.com/01org/libva/commit/fc277b8f5eb92a94b4a9112eba591f87072786ce#diff-67e997bcfdac55191033d57a16d1408a

GLX support now depends on X11:
https://github.com/01org/libva/commit/b9a72b9d8ca14e159a67c368d966ed6276f49bc9#diff-67e997bcfdac55191033d57a16d1408aR247

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash |  5 +++--
 package/libva-intel-driver/libva-intel-driver.mk   |  2 +-
 package/libva-utils/libva-utils.hash               |  5 +++--
 package/libva-utils/libva-utils.mk                 |  2 +-
 package/libva/libva.hash                           |  5 +++--
 package/libva/libva.mk                             | 21 ++++++---------------
 6 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 75c1e95712..4ffc60cab5 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,4 +1,5 @@
 # From https://github.com/01org/intel-vaapi-driver/releases
-sha1 b0cfc0807993aafe78e209dd28cdceb4dfa57e78 intel-vaapi-driver-1.8.3.tar.bz2
+sha1 19e83c084a404817263c04371c42345b617900ff intel-vaapi-driver-2.0.0.tar.bz2
 # Locally computed
-sha256 54411d9e579300ed63f8b9b06152a1a9ec95b7699507d7ffa014cd7b2aeaff6f  intel-vaapi-driver-1.8.3.tar.bz2
+sha256 10f6b0a91f34715d8d4d9a9e0fb3cc0afe5fcf85355db1272bd5fff31522f469  intel-vaapi-driver-2.0.0.tar.bz2
+sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 7a064659de..0255038b0a 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.8.3
+LIBVA_INTEL_DRIVER_VERSION = 2.0.0
 LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
 	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 737b246a01..3429fb53a6 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,4 +1,5 @@
 # From https://github.com/01org/libva-utils/releases
-sha1 8684aa2b28fc08bf62b1fa5acf95d23fab5faf9a libva-utils-1.8.3.tar.bz2
+sha1 b4dc39459f8539c1ea16e7ca957a853fb7735ec4 libva-utils-2.0.0.tar.bz2
 # Locally computed
-sha256 c59de4fb6f1021c435b3f49e2410760692324ee5bb464c716d674fcb626a7e03  libva-utils-1.8.3.tar.bz2
+sha256 a921df31311d8f49d2e392a5fc2a068d79f89aeb588309fbff24365310dbc5f6  libva-utils-2.0.0.tar.bz2
+sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 80ab529fb5..275d599606 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 1.8.3
+LIBVA_UTILS_VERSION = 2.0.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/01org/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 232adeeeeb..1736575447 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,4 +1,5 @@
 # From https://github.com/01org/libva/releases
-sha1 8eee9e28b0ae3bfbe8cd44a91396207714967204  libva-1.8.3.tar.bz2
+sha1 762a49f8925ca1d0531c5071afbd629ffea93b90  libva-2.0.0.tar.bz2
 # Locally computed
-sha256 56ee129deba99b06eb4a8d4f746b117c5d1dc2ec5b7a0bfc06971fca1598ab9b  libva-1.8.3.tar.bz2
+sha256 bb0601f9a209e60d8d0b867067323661a7816ff429021441b775452b8589e533  libva-2.0.0.tar.bz2
+sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 61e31801be..5f9de903f4 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.8.3
+LIBVA_VERSION = 2.0.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
@@ -17,18 +17,16 @@ LIBVA_CONF_OPTS = \
 	--enable-drm \
 	--with-drivers-path="/usr/lib/va"
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-LIBVA_DEPENDENCIES += mesa3d
-LIBVA_CONF_OPTS += --enable-glx
-else
-LIBVA_CONF_OPTS += --disable-glx
-endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+LIBVA_DEPENDENCIES += mesa3d
+LIBVA_CONF_OPTS += --enable-glx
+endif
 else
-LIBVA_CONF_OPTS += --disable-x11
+LIBVA_CONF_OPTS += --disable-glx --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
@@ -38,11 +36,4 @@ else
 LIBVA_CONF_OPTS += --disable-wayland
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-LIBVA_DEPENDENCIES += libegl
-LIBVA_CONF_OPTS += --enable-egl
-else
-LIBVA_CONF_OPTS += --disable-egl
-endif
-
 $(eval $(autotools-package))
-- 
2.11.0
