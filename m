From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Oct 2014 19:22:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Really disable dri3 support
Message-ID: <1412356970-17758-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/49c/49c5ee7a8a0adff325f4cb484b91347de9e36ebb/
http://autobuild.buildroot.net/results/b02/b02f1c42ac9467626a21242770440e52baf9e4d2/
http://autobuild.buildroot.net/results/01a/01a3a3da833cbe8268af55320c6f354ef5b4f863/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ec76872..a53ce07 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -75,7 +75,7 @@ endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
-	--without-dri-drivers --without-dri
+	--without-dri-drivers --without-dri --disable-dri3
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
-- 
1.7.10.4
