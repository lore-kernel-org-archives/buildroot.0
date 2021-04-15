From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Apr 2021 08:52:43 +0200
Subject: [Buildroot] [PATCH 2/5] package/x11r7/xserver_xorg-server: remove
 xfbdev
In-Reply-To: <20210415065246.276882-1-bernd.kuhls@t-online.de>
References: <20210415065246.276882-1-bernd.kuhls@t-online.de>
Message-ID: <20210415065246.276882-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed the kdrive framebuffer device server:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=feed7e3f982a7ac14f6fe85ed2e1ec4a83700841

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 03f36f1b28..aaf3584772 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -90,14 +90,9 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE),y)
 XSERVER_XORG_SERVER_CONF_OPTS += \
 	--enable-kdrive \
-	--enable-xfbdev \
 	--disable-glx \
 	--disable-dri \
 	--disable-xsdl
-define XSERVER_CREATE_X_SYMLINK
-	ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
-endef
-XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-evdev
@@ -106,7 +101,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-evdev
 endif
 
 else # modular
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-- 
2.29.2
