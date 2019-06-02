From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Jun 2019 12:03:21 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/x11r7/xserver_xorg-server:
 bump version to 1.20.5
Message-ID: <20190602100321.7601-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-modesettings-needs-dri2.patch                 |  0
 ...02-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
 .../0003-Remove-check-for-useSIGIO-option.patch        |  0
 .../0004-include-misc.h-fix-uClibc-build.patch         |  0
 ...hw-xwayland-Makefile.am-fix-build-without-glx.patch |  0
 package/x11r7/xserver_xorg-server/Config.in            |  4 ++--
 .../x11r7/xserver_xorg-server/xserver_xorg-server.hash | 10 +++++-----
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0001-modesettings-needs-dri2.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0003-Remove-check-for-useSIGIO-option.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0004-include-misc.h-fix-uClibc-build.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.20.4 => 1.20.5}/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch (100%)

diff --git a/package/x11r7/xserver_xorg-server/1.20.4/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.5/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.4/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.5/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.4/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.5/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.4/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.5/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.4/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.5/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.4/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.5/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.4/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.5/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.4/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.5/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/1.20.5/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/1.20.5/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index ed238d570b..ec4ba91502 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.4"
+	bool "1.20.5"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.5" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 5c1beb1379..f79dc0c4eb 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,8 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2019-February/002957.html
-md5 c4841cc24b79420205d082fe82e0a650  xorg-server-1.20.4.tar.bz2
-sha1 1a79da92122124cb782a4eebfd83fd33d5c0d7d4  xorg-server-1.20.4.tar.bz2
-sha256 fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee  xorg-server-1.20.4.tar.bz2
-sha512 f1c92ef6d7613e0636973d3395b48dfdad42230847ab1c8b1cea84647a968f649f9aba97bdb01c10ee8351cbe954d4e6ca4a0fc84bb8fa662d49c8ba2aee00a8  xorg-server-1.20.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-May/002993.html
+md5 c9fc7e21e11286dbedd22c00df652130  xorg-server-1.20.5.tar.bz2
+sha1 fea6fd34c7f48b3c69fbecd8fb294eaa1498e69c  xorg-server-1.20.5.tar.bz2
+sha256 a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d  xorg-server-1.20.5.tar.bz2
+sha512 625f0626b122cf95600abe382c3217348999357a0e2d2443092f1b67cff1c98d7ef09303884ceaeac181e0555dc56b0d4d44bda45cc464dac2d9a50c5b32d631  xorg-server-1.20.5.tar.bz2
-- 
2.20.1
