From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:12:48 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: bump to
	version 1.19.1
Message-ID: <20170113152114.4A7147F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f13794a07941f8d2a1258f4dc0ca95c8d6b52011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include this bugfix [1] (freeze with DRI2).
Tested using Enlightenment and Lugaru game on x86_64 target using DRI2.

[1] https://bugs.freedesktop.org/show_bug.cgi?id=99333

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{1.19.0 => 1.19.1}/0001-modesettings-needs-dri2.patch             | 0
 package/x11r7/xserver_xorg-server/Config.in                           | 4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash            | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.19.0/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.19.1/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.19.0/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.19.1/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1ee1f0b..0f1d1fe 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -74,7 +74,7 @@ choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
-	bool "1.19.0"
+	bool "1.19.1"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
@@ -94,7 +94,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.19.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	default "1.19.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 54ae0ec..2f13ca6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,5 +3,5 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2016-November/002737.html
-sha256 149a708b50befc2d5a40b98d45ddd2ebe0beec018e6d0c663c43bad6210e4da3        xorg-server-1.19.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-January/002754.html
+sha256 79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb        xorg-server-1.19.1.tar.bz2
