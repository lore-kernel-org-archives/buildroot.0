From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 00:26:39 +0100
Subject: [Buildroot] [PATCH/next 09/13] package/x11r7/xserver_xorg-server:
	add version 1.18.0
In-Reply-To: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447457203-27816-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Video drivers need ABI version 20 now:
http://cgit.freedesktop.org/xorg/xserver/commit/?id=a8a0f6464a33c12c1de495d74fd478c0d952643e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in                | 10 ++++++++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 84f0298..28db01a 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -61,14 +61,23 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	bool
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
+	bool
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
 	int
 	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	default 20 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 
 choice
 	bool "X Window System server version"
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	bool "1.18.0"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	bool "1.17.4"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
@@ -82,6 +91,7 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
+	default "1.18.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 0119e37..012fbaf 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -4,3 +4,6 @@ sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        x
 # From http://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha1	139c4d6795eb4c3848616cc514d134532975e49e				xorg-server-1.17.4.tar.bz2
 sha256	0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457	xorg-server-1.17.4.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-November/002655.html
+sha1	f37f9ca17d211552c775c3ce78ff03385026bf3a				xorg-server-1.18.0.tar.bz2
+sha256	195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e	xorg-server-1.18.0.tar.bz2
-- 
2.6.2
