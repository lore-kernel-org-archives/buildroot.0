From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 16:27:09 +0200
Subject: [Buildroot] [git commit master 1/1] Remove unused X11_PREFIX option
Message-ID: <20100728152234.0A68F826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ef2c11e51a08383c4a3bbd370e12e1db4875a447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/kb9202_defconfig  |    1 -
 configs/v100sc2_defconfig |    1 -
 package/Makefile.in       |    4 ----
 package/x11r7/Config.in   |    7 -------
 4 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 2895d8a..40c6d18 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -551,7 +551,6 @@ BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_x11r7 is not set
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
-BR2_X11_PREFIX="/usr"
 
 #
 # X libraries and helper libraries
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index 80f194a..ca261ee 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -568,7 +568,6 @@ BR2_PACKAGE_QT_OPENSSL=y
 # BR2_PACKAGE_XSERVER_none is not set
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
-BR2_X11_PREFIX="/usr"
 # BR2_PACKAGE_XORG7 is not set
 
 #
diff --git a/package/Makefile.in b/package/Makefile.in
index fc53a1b..36f2f24 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -292,9 +292,5 @@ else
 ENABLE_DEBUG:=
 endif
 
-# X Windowing system
-
-X11_PREFIX:=$(call qstrip,$(BR2_X11_PREFIX))
-
 include package/Makefile.autotools.in
 include package/Makefile.package.in
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index b93cc90..c0c0043 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -29,13 +29,6 @@ config BR2_PACKAGE_XSERVER_tinyx
 
 endchoice
 
-config BR2_X11_PREFIX
-	string
-	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg
-	default "/usr"		if BR2_PACKAGE_XSERVER_tinyx
-	help
-	  X11 apps root location
-
 menu "X11R7 Servers"
 	source package/x11r7/xserver_xorg-server/Config.in
 endmenu
-- 
1.7.1
