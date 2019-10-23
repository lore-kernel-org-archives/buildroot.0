From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Oct 2019 08:22:18 +0200
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xserver_xorg-server: fix
 optional glx dependency
Message-ID: <20191023062220.5646-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typo was added by commit
https://git.buildroot.net/buildroot/commit/?id=c2856aa2857d616788684a053f1c886da00d977f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index c15047cbe4..41c82ad930 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -120,7 +120,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
 else
-- 
2.20.1
