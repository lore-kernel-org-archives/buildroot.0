From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:21 +0200
Subject: [Buildroot] [PATCH 12/16] xserver: Add xkeyboard-config as a
	dependency
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f823dc838b9f6dd45f739f8374d25d1c9939327b.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xkeyboard-config is required to install keymap files to the target,
without which the X server does not start.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    1 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 2d725e4..ddc03c6 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	depends on !BR2_avr32
 	help
 	  xorg-server 1.7.5
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 57dbc2e..9f295aa 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -53,6 +53,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xproto_xf86rushproto 		\
 	xproto_xf86vidmodeproto 	\
 	xproto_xproto 			\
+	xkeyboard-config		\
 	pixman 				\
 	openssl 			\
 	mcookie
-- 
1.7.0.4
