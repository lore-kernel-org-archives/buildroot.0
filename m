From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:31:52 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump
 version to 1.20.1
Message-ID: <20180809082528.E00B58B682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f93d138dd44be12a2b0dcb88386995c0aed71a98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes for this bugfix release:
https://lists.x.org/archives/xorg-announce/2018-August/002912.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{1.20.0 => 1.20.1}/0001-modesettings-needs-dri2.patch      |  0
 .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch      |  0
 .../0003-Remove-check-for-useSIGIO-option.patch                |  0
 .../0004-include-misc.h-fix-uClibc-build.patch                 |  0
 package/x11r7/xserver_xorg-server/Config.in                    |  4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash     | 10 +++++-----
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.20.0/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.1/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.0/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.1/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.0/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.0/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.1/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.0/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.1/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.0/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.1/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.0/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.1/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5af4d09eed..c6dc010980 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.0"
+	bool "1.20.1"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 691229a834..c0d93e5580 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,8 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2018-May/002893.html
-md5 c1ca1ea0a905ea788da03c77cc38b06e  xorg-server-1.20.0.tar.bz2
-sha1 a9e999c15a2322bc423d5d6e1978ba38f9635901  xorg-server-1.20.0.tar.bz2
-sha256 9d967d185f05709274ee0c4f861a4672463986e550ca05725ce27974f550d3e6  xorg-server-1.20.0.tar.bz2
-sha512 1489e8511c9da682ef0460182dfeeddd241c72d4ef4d206d9706f1e39572c09953df851fab18cefb65a1ee4c6710c6ba13c63c9c9fc0bc1b5f12c50780412cde  xorg-server-1.20.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-August/002912.html
+md5 e525846d1d0af5732ba835f2e2ec066d  xorg-server-1.20.1.tar.bz2
+sha1 fd43367c2b7bbb1a4b1dd90b06a021e68a9db240  xorg-server-1.20.1.tar.bz2
+sha256 59c99fe86fe75b8164c6567bfc6e982aecc2e4a51e6fbac1b842d5d00549e918  xorg-server-1.20.1.tar.bz2
+sha512 ef2b93a61683c8ca8d1f14b771e70db65ba119a73db8a46e7cdbf2ac2243e3f4b2732068eb5aa5d7b76f460db995a3c04390870198a5210ec30df4360ad9f94b  xorg-server-1.20.1.tar.bz2
