From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2016 16:00:06 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/x11r7/xserver_xorg-server: Fix
	build with wayland, part I
Message-ID: <20161227150008.3277-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing dependency wayland-protocols.

Partly fixes
http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added missing 'y' (Gustavo)

 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6444a206b..7aebbc1d2 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -82,9 +82,9 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 endif
 
 # Xwayland support needs libdrm, libepoxy, wayland and libxcomposite
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyy)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS)$(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),yyyyy)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xwayland
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm libepoxy wayland xlib_libXcomposite
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm libepoxy wayland wayland-protocols xlib_libXcomposite
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xwayland
 endif
-- 
2.11.0
