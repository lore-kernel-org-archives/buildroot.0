From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Mar 2015 18:10:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva-intel-driver: Fix build
Message-ID: <1427818214-14760-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package needs autoreconf to produce a working configure script,
also fix a typo in .mk file

Fixes
http://autobuild.buildroot.net/results/606/6061216fa6e2f4323117bb6cfb2b77753a89a679/
http://autobuild.buildroot.net/results/76d/76dc4b670e2131b94bd0c5cff45ccafd5e45033c/
http://autobuild.buildroot.net/results/d6f/d6f624baa3dde4fc4051d361ddaf98ecc5c84134/
http://autobuild.buildroot.net/results/91f/91f36f32ef43be897fef9352f97cc07781c4035a/
http://autobuild.buildroot.net/results/951/9517bb6d2c05c27cad0b24a4443021a34babedbd/
http://autobuild.buildroot.net/results/405/405dfffbcfdaa485d0000dad655b0c112688a58f/
http://autobuild.buildroot.net/results/925/92538fb07d5226bb8c3d3cc5e1429560b2e621f3/
http://autobuild.buildroot.net/results/d15/d154ca018da0c21762ed70acda4f224c50a1d808/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 5755207..560ca28 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -9,6 +9,7 @@ LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
+LIBVA_INTEL_DRIVER_AUTORECONF = YES
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -19,7 +20,7 @@ LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBVA_DEPENDENCIES += wayland
+LIBVA_INTEL_DRIVER_DEPENDENCIES += wayland
 LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-wayland
 else
 LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-wayland
-- 
1.7.10.4
