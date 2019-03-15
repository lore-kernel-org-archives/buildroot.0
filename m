From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:08 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump
 version to 1.20.4
Message-ID: <20190315203119.D585383480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88e0f214dcb7c2a99a4425a70673d2aa5f48d720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{1.20.3 => 1.20.4}/0001-modesettings-needs-dri2.patch      |  0
 .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch      |  0
 .../0003-Remove-check-for-useSIGIO-option.patch                |  0
 .../0004-include-misc.h-fix-uClibc-build.patch                 |  0
 package/x11r7/xserver_xorg-server/Config.in                    |  4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash     | 10 +++++-----
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.20.3/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.4/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.3/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.4/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.4/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.4/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.3/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.4/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.3/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.4/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.3/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.4/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.3/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.4/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 7ccb2bd9cf..ed238d570b 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.3"
+	bool "1.20.4"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 4cde15e5d4..5c1beb1379 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,8 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2018-October/002928.html
-md5 8ee29e8b24cef6b3cfa747ec01b9155a  xorg-server-1.20.3.tar.bz2
-sha1 a522cd543606b4d0509d821b8061904951171c50  xorg-server-1.20.3.tar.bz2
-sha256 1b3ce466c12cacbe2252b3ad5b0ed561972eef9d09e75900d65fb1e21f9201de  xorg-server-1.20.3.tar.bz2
-sha512 ee44554f86df4297f54c5871fe7a18954eeef4338775a25f36d6577b279c4775f61128da71b86cfaeadcc080838d6749dede138d4db178866579da2056543fba  xorg-server-1.20.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002957.html
+md5 c4841cc24b79420205d082fe82e0a650  xorg-server-1.20.4.tar.bz2
+sha1 1a79da92122124cb782a4eebfd83fd33d5c0d7d4  xorg-server-1.20.4.tar.bz2
+sha256 fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee  xorg-server-1.20.4.tar.bz2
+sha512 f1c92ef6d7613e0636973d3395b48dfdad42230847ab1c8b1cea84647a968f649f9aba97bdb01c10ee8351cbe954d4e6ca4a0fc84bb8fa662d49c8ba2aee00a8  xorg-server-1.20.4.tar.bz2
