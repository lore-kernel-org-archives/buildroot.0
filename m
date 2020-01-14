From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 22:05:37 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump
 version to 1.20.7
Message-ID: <20200114205531.3E41082121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3988f1e3f230370be4aa1229d91e39ac49728c8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added patch to fix build error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-modesettings-needs-dri2.patch             |  0
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
 .../0003-Remove-check-for-useSIGIO-option.patch    |  0
 .../0004-include-misc.h-fix-uClibc-build.patch     |  0
 ...wayland-Makefile.am-fix-build-without-glx.patch |  0
 ...6-common-xf86Init.c-fix-build-without-glx.patch |  0
 .../0007-modesetting-explicitly-include-mi-h.patch | 31 ++++++++++++++++++++++
 package/x11r7/xserver_xorg-server/Config.in        |  4 +--
 .../xserver_xorg-server/xserver_xorg-server.hash   | 10 +++----
 9 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.20.6/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.7/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.6/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.7/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.7/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.7/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.6/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.7/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.6/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.7/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.6/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.7/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.6/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.7/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.6/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.7/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.6/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/1.20.7/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.6/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.7/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.6/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/1.20.7/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.7/0007-modesetting-explicitly-include-mi-h.patch b/package/x11r7/xserver_xorg-server/1.20.7/0007-modesetting-explicitly-include-mi-h.patch
new file mode 100644
index 0000000000..2aea7348b4
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.20.7/0007-modesetting-explicitly-include-mi-h.patch
@@ -0,0 +1,31 @@
+From f73cdeac19774c7786ae71e0b38de9b1df39ea98 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>
+Date: Tue, 14 Jan 2020 09:23:34 +0100
+Subject: [PATCH] modesetting: Explicitly #include "mi.h"
+
+For the miClearDrawable prototype. Apparently it doesn't get pulled in
+for some build configurations, breaking the build.
+
+Downloaded from upstream PR:
+https://gitlab.freedesktop.org/xorg/xserver/merge_requests/380
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ hw/xfree86/drivers/modesetting/drmmode_display.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/xfree86/drivers/modesetting/drmmode_display.c b/hw/xfree86/drivers/modesetting/drmmode_display.c
+index b826bee6a..d13cec077 100644
+--- a/hw/xfree86/drivers/modesetting/drmmode_display.c
++++ b/hw/xfree86/drivers/modesetting/drmmode_display.c
+@@ -37,6 +37,7 @@
+ #include "inputstr.h"
+ #include "xf86str.h"
+ #include "X11/Xatom.h"
++#include "mi.h"
+ #include "micmap.h"
+ #include "xf86cmap.h"
+ #include "xf86DDC.h"
+-- 
+2.24.1
+
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 982b9bcb4e..fd590a1a47 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.6"
+	bool "1.20.7"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.6" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index cd1b560162..c546f8c6b9 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,11 +3,11 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2019-November/003032.html
-md5 a98170084f2c8fed480d2ff601f8a14b  xorg-server-1.20.6.tar.bz2
-sha1 59473e72136113f3a35b1ab5a5cfcbcad955b660  xorg-server-1.20.6.tar.bz2
-sha256 6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1  xorg-server-1.20.6.tar.bz2
-sha512 9aa0ba4aee92fe628f2b8c41e4fe0134dc86154bb8787f907884ef2fd970e18e68e72ea8a1beb706d11ecf155b2abc9731f1abadff251ed592f8cca3b1240dd6  xorg-server-1.20.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-January/003036.html
+md5 d2e96355ad47244c675bce38db2b48a9  xorg-server-1.20.7.tar.bz2
+sha1 11d048431dc7582898628149ca3a758008b7d50b  xorg-server-1.20.7.tar.bz2
+sha256 bd5986f010f34f5b3d6bc99fe395ecb1e0dead15a26807e0c832701809a06ea1  xorg-server-1.20.7.tar.bz2
+sha512 c67612e379111c28c68941c0a660abf72be7669591b41ccaa3b3474c4540a03822a28d892831b12ce08bac6e5e7e33504c2d19ef2a0c2298f83bd083459f96f5  xorg-server-1.20.7.tar.bz2
 
 # Locally calculated
 sha256 4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
