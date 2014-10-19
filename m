From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 20:51:34 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Change default to
	X.org modular server on supported platforms
Message-ID: <1413744694-27659-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on IRC.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 5581240..52ced84 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -62,6 +62,7 @@ if BR2_PACKAGE_XSERVER_XORG_SERVER
 
 choice
 	prompt "X Window System server type"
+	default BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR if (BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
 	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
 	  Select the X Window System server to use
-- 
1.7.10.4
