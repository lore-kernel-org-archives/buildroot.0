From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:54 +0200
Subject: [Buildroot] [PATCH 15/15] package/x11r7/xdriver_xf86-video-ati: Add
	optional support for glamor
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xserver_xorg-server depends on libepoxy for glamor support, therefore we
use this package as an indicator whether glamor support is present.

Fixes https://bugs.busybox.net/show_bug.cgi?id=8171

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 15807c2..cba9e76 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -22,4 +22,10 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xproto_xproto \
 	xserver_xorg-server
 
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
+else
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
