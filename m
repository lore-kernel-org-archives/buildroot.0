From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Mar 2011 14:39:57 +0100
Subject: [Buildroot] [git commit master 1/1] xorg-server: point
	localstatedir to /var
Message-ID: <20110310134139.9C24E8FE1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=723f276ffdb2308323649b74401270b7f3451673
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't want logs to end up in /usr/var/log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6dc1705..0311483 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -60,7 +60,7 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
 		--with-builder-addr=buildroot at uclibc.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
-		--with-fontdir=/usr/share/fonts/X11/
+		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg
-- 
1.7.3.4
