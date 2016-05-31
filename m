From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 09:13:28 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: Fix typo in wayland
	configure option
Message-ID: <20160531071421.4F82F81E9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a229c52aa4c75f1008d629c91e61cf5f0a1c0569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug was introduced in
https://git.busybox.net/buildroot/commit/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk?id=1370fcaeb7c88e958a967594596769c71a4526f9

The configure option is called --en-/disable-xwayland:
https://cgit.freedesktop.org/xorg/xserver/tree/configure.ac?id=9454cd51da9b38b974cff7c8b7125901f6403848#n630

Fixes
http://autobuild.buildroot.net/results/c32/c32a17509b070b1af497bfc54b85a944fa59ca30/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 69e9151..85d7e98 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -82,10 +82,10 @@ endif
 
 # Xwayland support needs libdrm, libepoxy, wayland and libxcomposite
 ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyy)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-wayland
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-xwayland
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm libepoxy wayland xlib_libXcomposite
 else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-wayland
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-xwayland
 endif
 
 # Present protocol only required for xserver 1.15+, but does not matter if
