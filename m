From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Jul 2010 09:53:51 +0200
Subject: [Buildroot] [git commit master 1/1] xserver: dri support is only
	for the modular server
Message-ID: <20100721075441.77C1382A41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8bbf552993397ece696272f1f75fa47af110a005
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e32215f..f3ffea9 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -121,10 +121,14 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-composite
 endif
 
+ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
 endif
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-dri2
+endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXScrnSaver
-- 
1.7.1
