From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:36:36 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: Add support for DRI3
Message-ID: <20140729213816.919729D321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3880b98ffe9b6344e481190dd0bdee47149a8ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 9188411..22f56a4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -170,8 +170,12 @@ ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
 endif
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
+XSERVER_XORG_SERVER_CONF_OPT += --enable-dri3
+endif
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-dri2
+XSERVER_XORG_SERVER_CONF_OPT += --disable-dri2 --disable-dri3
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
