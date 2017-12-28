From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:24:50 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump
 version to 1.19.6
Message-ID: <20171228222458.AEB7C81461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=986eb3b611a356d466c7a7c17e7a1d962362cb6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{1.19.5 => 1.19.6}/0001-modesettings-needs-dri2.patch      |  0
 .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch      |  0
 .../0003-Remove-check-for-useSIGIO-option.patch                |  0
 package/x11r7/xserver_xorg-server/Config.in                    |  4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash     | 10 +++++-----
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.19.5/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.19.6/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.5/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.19.6/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.5/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.19.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.5/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.19.6/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.5/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.19.6/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.5/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.19.6/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 416dc7b..3107e2c 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -79,7 +79,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
-	bool "1.19.5"
+	bool "1.19.6"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
@@ -99,7 +99,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.19.5" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	default "1.19.6" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index c0feb98..10285ab 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,8 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2017-October/002814.html
-md5 4ac6feeae6790436ce9de879ca9a3bf8  xorg-server-1.19.5.tar.bz2
-sha1 307d3405f709f7e41966c850b37deefe7f83eb9b  xorg-server-1.19.5.tar.bz2
-sha256 18fffa8eb93d06d2800d06321fc0df4d357684d8d714315a66d8dfa7df251447  xorg-server-1.19.5.tar.bz2
-sha512 928dea5850b98cd815004cfa133eca23cfa9521920c934c68a92787f2cae13cca1534eee772a4fb74b8ae8cb92662b5d68b95b834c8aa8ec57cd57cb4e5dd45c  xorg-server-1.19.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-December/002830.html
+md5 3e47777ff034a331aed2322b078694a8  xorg-server-1.19.6.tar.bz2
+sha1 2dd560ac49bdbda7f67166546af43541fabf517f  xorg-server-1.19.6.tar.bz2
+sha256 a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197  xorg-server-1.19.6.tar.bz2
+sha512 38519a8d0af9dd034045fc346959496dd718fa59b6188307974797a1cd9c349deb54987f6232ea8396baf810dcc710c0ff191f76ed2186cae4d44921b3680412  xorg-server-1.19.6.tar.bz2
