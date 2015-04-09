From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Thu,  9 Apr 2015 11:14:32 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: fix CONF_OPTS
Message-ID: <1428570872-8085-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ce4069b..f120bec 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -65,12 +65,12 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-XSERVER_XORG_CONF_OPTS += \
+XSERVER_XORG_SERVER_CONF_OPTS += \
 	--with-systemd-daemon \
 	--enable-systemd-logind
 XSERVER_XORG_SERVER_DEPENDENCIES += systemd
 else
-XSERVER_XORG_CONF_OPTS += \
+XSERVER_XORG_SERVER_CONF_OPTS += \
 	--without-systemd-daemon \
 	--disable-systemd-logind
 endif
-- 
2.3.3
