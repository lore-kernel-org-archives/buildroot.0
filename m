From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 19:24:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-video-tdfx:
	Re-wrap _DEPENDENCIES
Message-ID: <1465061053-29517-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk  | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 4d0ba60..156a46d 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -10,6 +10,15 @@ XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSI
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TDFX_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
+XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
+	libdrm \
+	xproto_fontsproto \
+	xproto_randrproto \
+	xproto_renderproto \
+	xproto_videoproto \
+	xproto_xextproto \
+	xproto_xf86driproto \
+	xproto_xproto \
+	xserver_xorg-server
 
 $(eval $(autotools-package))
-- 
2.8.1
