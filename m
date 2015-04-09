From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 11:54:01 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: fix CONF_OPTS
Message-ID: <20150409095517.B7632819C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96484d07fca60d5409e132abcc950e95a872a974
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
