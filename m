From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 08:54:20 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xserver_xorg-server: remove optional support for tslib
Message-ID: <20210426063224.52417861FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=299908a0583cd6b9b09d222febcd201a8890d3e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Upstream removed support for tslib:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=5c7ed785e3bdb9f0fbf8fbfdc93b5fdd2b2c7dbf

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 974448aed3e54b048aa527482cfa935bbe0daeae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8bd92b7ab6..0ac34a63b5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -106,11 +106,6 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
 # Optional packages
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += tslib
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-tslib LDFLAGS="-lts"
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
