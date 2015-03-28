From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Sat, 28 Mar 2015 14:15:38 +0100
Subject: [Buildroot] [PATCH 1/1] allow xserver without the systemd login
	daemon.
Message-ID: <1427548538-7789-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Noel Vellemans for the hint.
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bb5381c..db2e653 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -64,6 +64,11 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
 	--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
+ifneq ($(BR2_INIT_SYSTEMD),y)
+	XSERVER_XORG_SERVER_CONF_OPTS += \
+	--disable-systemd-logind
+endif
+
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
-- 
2.3.3
