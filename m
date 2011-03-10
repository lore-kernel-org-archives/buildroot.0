From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2011 09:25:02 -0300
Subject: [Buildroot] [PATCH 1/3] xorg-server: point localstatedir to /var
Message-ID: <1299759904-22003-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't want logs to end up in /usr/var/log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
