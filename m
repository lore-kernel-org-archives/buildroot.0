From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jul 2015 21:42:56 +0200
Subject: [Buildroot] [PATCH 3/3] package/mesa3d: Fix dri config option
In-Reply-To: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438198976-25523-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438198976-25523-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option is constructed by AC_ARG_ENABLE and not AC_ARG_WITH:
http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n726

Fixes
http://autobuild.buildroot.net/results/6e3/6e313e2a4b2ff092d187ac564f25c14aaaceb0dd/
http://autobuild.buildroot.net/results/e3c/e3c3e441038b72c78c8e94370baa036ab1effb6b/
http://autobuild.buildroot.net/results/11f/11f09260428a766d1f274843a9aebe220fd0e988/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 82b1001..800d2f9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -93,7 +93,7 @@ endef
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
-	--without-dri-drivers --without-dri --disable-dri3
+	--without-dri-drivers --disable-dri --disable-dri3
 MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_PC
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
-- 
2.1.4
