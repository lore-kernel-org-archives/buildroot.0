From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:16 +0200
Subject: [Buildroot] [PATCH 62/63] xserver_xorg-server: dependency to udev
	added
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-63-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index ddc03c6..ba72efc 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
+        select BR2_PACKAGE_UDEV
 	depends on !BR2_avr32
 	help
 	  xorg-server 1.7.5
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0311483..7eade57 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.7.5
+XSERVER_XORG_SERVER_VERSION = 1.9.4
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
@@ -54,7 +54,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xkeyboard-config		\
 	pixman 				\
 	openssl 			\
-	mcookie
+	mcookie                         \
+	udev
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
-- 
1.7.3.4
