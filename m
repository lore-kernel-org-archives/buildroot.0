From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Mar 2017 20:54:53 +0100
Subject: [Buildroot] [PATCH 1/4] package/x11r7/xserver_xorg-server: bump
	version to 1.19.2
Message-ID: <20170304195456.9726-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed _SITE according to URL mentioned in upstream release note.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../{1.19.1 => 1.19.2}/0001-modesettings-needs-dri2.patch             | 0
 .../0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch             | 0
 .../{1.19.1 => 1.19.2}/0003-Remove-check-for-useSIGIO-option.patch    | 0
 package/x11r7/xserver_xorg-server/Config.in                           | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash            | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk              | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename package/x11r7/xserver_xorg-server/{1.19.1 => 1.19.2}/0001-modesettings-needs-dri2.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.19.1 => 1.19.2}/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch (100%)
 rename package/x11r7/xserver_xorg-server/{1.19.1 => 1.19.2}/0003-Remove-check-for-useSIGIO-option.patch (100%)

diff --git a/package/x11r7/xserver_xorg-server/1.19.1/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.19.2/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.1/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.19.2/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/1.19.2/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.1/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/1.19.2/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.19.2/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/1.19.2/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1c8f8cfdb..032811ea7 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -79,7 +79,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
-	bool "1.19.1"
+	bool "1.19.2"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
@@ -99,7 +99,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.19.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	default "1.19.2" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 2f13ca641..456fb8b46 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,5 +3,5 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2017-January/002754.html
-sha256 79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb        xorg-server-1.19.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-March/002779.html
+sha256 4f8ab9f4a1a885fe7550080555381b34b82858582559e8e3c4da96e3a85884bb        xorg-server-1.19.2.tar.bz2
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ef189812f..75514b4ce 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -6,7 +6,7 @@
 
 XSERVER_XORG_SERVER_VERSION = $(call qstrip,$(BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION))
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
-XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
+XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-- 
2.11.0
