From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 15:22:04 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/x11r7/xserver_xorg-server: bump
	version to 1.18.0
Message-ID: <1450534925-9099-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - removed legacy handling (Thomas, Arnout)
    - fixed option definition of
      BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20 (Thomas)

 package/x11r7/xserver_xorg-server/Config.in                | 12 ++++++------
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 84f0298..e2eec55 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -58,20 +58,20 @@ if BR2_PACKAGE_XSERVER_XORG_SERVER
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 	bool
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	bool
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
 	int
 	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
-	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	default 20 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 
 choice
 	bool "X Window System server version"
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	bool "1.17.4"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	bool "1.18.0"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
@@ -82,7 +82,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	default "1.18.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 0119e37..72c00c4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From http://lists.x.org/archives/xorg-announce/2015-October/002650.html
-sha1	139c4d6795eb4c3848616cc514d134532975e49e				xorg-server-1.17.4.tar.bz2
-sha256	0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457	xorg-server-1.17.4.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-November/002655.html
+sha1	f37f9ca17d211552c775c3ce78ff03385026bf3a				xorg-server-1.18.0.tar.bz2
+sha256	195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e	xorg-server-1.18.0.tar.bz2
-- 
2.6.4
