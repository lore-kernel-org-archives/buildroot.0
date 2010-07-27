From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] xserver: tell the X server
	where fonts are installed
Message-ID: <20100727210247.38C82835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb04640649750c556916916c2745670a6254ef72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All fonts are installed in /usr/share/fonts/X11 and not in
/usr/lib/X11/fonts/ where the X server looks by default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 7c12d24..da288b1 100644
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
1.7.1
