From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:20:19 +0200
Subject: [Buildroot] [PATCH 5/8] package/x11r7/xdriver_xf86-video-intel:
	Update OpenGL check
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461586822-1003-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index bf4f7a6..ffe4113 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -31,7 +31,7 @@ XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
 	xserver_xorg-server
 
 # X.org server support for DRI depends on a Mesa3D DRI driver
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GL),y)
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --enable-dri --enable-dri1
 # quote from configure.ac: "UXA doesn't build without DRI2 headers"
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
-- 
2.8.0.rc3
