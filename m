From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:20 +0200
Subject: [Buildroot] [PATCH 11/16] xserver: tell the X server where fonts
	are installed
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <351075dd5a255e5d56c834c680501b248aa83221.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All fonts are installed in /usr/share/fonts/X11 and not in
/usr/lib/X11/fonts/ where the X server looks by default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f3ffea9..57dbc2e 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -60,7 +60,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
 		--with-builder-addr=buildroot at uclibc.org \
-		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
+		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1" \
+		--with-fontdir=/usr/share/fonts/X11/
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg --disable-glx
-- 
1.7.0.4
