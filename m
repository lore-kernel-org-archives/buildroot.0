From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] webif: needs busybox (httpd)
Message-ID: <20100722110848.8CAC182DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3358928225a658c0e1a7ad8c7e990571544395f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/webif/Config.in |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 40b92c4..20294f5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,7 +24,7 @@
 	lmbench, lrzsz, ltrace, make, module-init-tools, mplayer,
 	mysql_client, nbd, ncurses, neon, netcat, netperf, ntfsprogs,
 	openssl, php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound,
-	sdl_ttf, squashfs, thttpd, tn5250, tremor, usbutils,
+	sdl_ttf, squashfs, thttpd, tn5250, tremor, usbutils, webif,
 	xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/webif/Config.in b/package/webif/Config.in
index 4ec9a26..56ed545 100644
--- a/package/webif/Config.in
+++ b/package/webif/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WEBIF
 	bool "webif - Status Console"
+	depends on BR2_PACKAGE_BUSYBOX # httpd
 	select BR2_PACKAGE_HASERL
 	help
 	  A web interface for showing different network status. This package
-- 
1.7.1
