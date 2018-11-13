From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:21:23 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 package/x11r7/xserver_xorg-server: security bump to version 1.20.3
Message-ID: <20181113221928.A296C8256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35a7f20a8fb4e8bb7e2d0245edc3617af7ba7047
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes CVE-2018-14665:
https://lists.x.org/archives/xorg-announce/2018-October/002927.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2bb862927653e4dc6c4ffc59997e4604b70e4518)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{1.20.2 => 1.20.3}/0001-modesettings-needs-dri2.patch      |  0
 .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch      |  0
 .../0003-Remove-check-for-useSIGIO-option.patch                |  0
 .../0004-include-misc.h-fix-uClibc-build.patch                 |  0
 package/x11r7/xserver_xorg-server/Config.in                    |  4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash     | 10 +++++-----
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.20.2/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.20.3/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.2/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.20.3/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.2/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.20.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.2/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.20.3/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.2/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.20.3/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.2/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.20.3/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.2/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/1.20.3/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.2/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/1.20.3/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index a491f5f9f0..7ccb2bd9cf 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,7 +61,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.2"
+	bool "1.20.3"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 
@@ -79,7 +79,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.20.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
+	default "1.20.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 549150fcce..4cde15e5d4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,8 +3,8 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2018-October/002924.html
-md5 e9853601de22454c8d36ca3425e65ce3  xorg-server-1.20.2.tar.bz2
-sha1 68636544ad25062eca4c681a031be5a35b548078  xorg-server-1.20.2.tar.bz2
-sha256 0ed5f7bc48f22f54e1ae0229ad6f35a521da4232d9d5529d7cebb5e79b3ccee2  xorg-server-1.20.2.tar.bz2
-sha512 1c87d78b14529dd4b438ef038118c8540d1d17bdd58bf08ec5408a2ddbe8d0dda48033a9a9477cfc2c4c304dd1078fa40968a03c4d0cd3398359dd0fadb8e7c7  xorg-server-1.20.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-October/002928.html
+md5 8ee29e8b24cef6b3cfa747ec01b9155a  xorg-server-1.20.3.tar.bz2
+sha1 a522cd543606b4d0509d821b8061904951171c50  xorg-server-1.20.3.tar.bz2
+sha256 1b3ce466c12cacbe2252b3ad5b0ed561972eef9d09e75900d65fb1e21f9201de  xorg-server-1.20.3.tar.bz2
+sha512 ee44554f86df4297f54c5871fe7a18954eeef4338775a25f36d6577b279c4775f61128da71b86cfaeadcc080838d6749dede138d4db178866579da2056543fba  xorg-server-1.20.3.tar.bz2
