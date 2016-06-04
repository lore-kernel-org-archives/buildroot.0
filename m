From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 19:24:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-video-tdfx:
	disable DRI support when not available
In-Reply-To: <1465061053-29517-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465061053-29517-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465061053-29517-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/304/304b68d14da026755d9d9323ed60f4f86adc7a96/
http://autobuild.buildroot.net/results/2b2/2b2558661850db295e670edfb5943973e93e01e4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 156a46d..942dcf3 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -21,4 +21,8 @@ XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
 	xproto_xproto \
 	xserver_xorg-server
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS = --disable-dri
+endif
+
 $(eval $(autotools-package))
-- 
2.8.1
