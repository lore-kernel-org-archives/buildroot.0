From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Aug 2016 17:25:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-savage:
	disable DRI support when not available
Message-ID: <1470583546-7332-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ecd/ecdb6977d282c276cbdf1f3dd0ccfaddff1d1ac5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index dc5644a..95bca7e 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -12,4 +12,8 @@ XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS = --disable-dri
+endif
+
 $(eval $(autotools-package))
-- 
2.8.1
