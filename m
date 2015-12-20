From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:54:54 +0100
Subject: [Buildroot] [git commit] directfb: remove cle266 and unichrome
	support
Message-ID: <20151220125457.C1FCE81F9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e3d2cad8daa59ccf64b1f47a1e1ab95b0f9b784
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They're broken for the latest version and directfb upstream is gone.

cle266 is an old chipset for AMD K7 (32 bit) athlons with integrated
graphics - very odd hardware.

unichrome is another VIA graphics standalone chip/chipset used for some
odd video cards and VIA CPUs (x86-based: C7, Nano and so on).

Add options to legacy as well. Fixes:

http://autobuild.buildroot.net/results/ab9/ab9a6dd044b5f3e8e42629a2aaf598fd0e0357ed/

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy             | 16 ++++++++++++++++
 package/directfb/Config.in   | 10 ----------
 package/directfb/directfb.mk |  2 --
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4d22527..c22e35e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,22 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_DIRECTFB_CLE266
+	bool "cle266 driver for directfb"
+	select BR2_LEGACY
+	help
+	  The cle266 directfb driver support has been removed.
+	  It doesn't build in the latest version and it's unlikely
+	  anyone has any use for it.
+
+config BR2_PACKAGE_DIRECTFB_UNICHROME
+	bool "unichrome driver for directfb"
+	select BR2_LEGACY
+	help
+	  The unichrome directfb driver support has been removed.
+	  It doesn't build in the latest version and it's unlikely
+	  anyone has any use for it.
+
 config BR2_PACKAGE_LIBEINA
 	bool "libeina package has been removed"
 	select BR2_LEGACY
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 2d09460..73425d3 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -61,11 +61,6 @@ config BR2_PACKAGE_DIRECTFB_ATI128
 	bool "compile ati128 graphics driver"
 	depends on BR2_i386 || BR2_x86_64
 
-config BR2_PACKAGE_DIRECTFB_CLE266
-	bool "compile cle266 graphics driver"
-	default y
-	depends on BR2_i386 || BR2_x86_64
-
 config BR2_PACKAGE_DIRECTFB_MATROX
 	bool "compile matrox graphics driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -89,11 +84,6 @@ config BR2_PACKAGE_DIRECTFB_EP9X
 
 	  http://cirrus.com/en/products/arm9.html
 
-config BR2_PACKAGE_DIRECTFB_UNICHROME
-	bool "compile unichrome graphics driver"
-	default y
-	depends on BR2_i386 || BR2_x86_64
-
 config BR2_PACKAGE_DIRECTFB_I830
 	bool "compile i830 graphics driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5e68b7b..d51094f 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -67,11 +67,9 @@ endif
 
 DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
-	$(if $(BR2_PACKAGE_DIRECTFB_CLE266),cle266) \
 	$(if $(BR2_PACKAGE_DIRECTFB_CYBER5K),cyber5k) \
 	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
-	$(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
 	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)	\
 	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
