From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:20:22 +0200
Subject: [Buildroot] [PATCH 8/8] package/x11r7/xserver_xorg-server: Update
	OpenGL check
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461586822-1003-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 617bcbc..09e4f30 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -130,7 +130,7 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
-- 
2.8.0.rc3
