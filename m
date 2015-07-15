From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:52 +0200
Subject: [Buildroot] [PATCH 13/15] package/x11r7/xdriver_xf86-video-ati:
	Re-wrap dependencies, no code change
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index e392ef1..ce47e49 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -9,6 +9,16 @@ XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION)
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
+XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
+	libdrm \
+	xproto_fontsproto \
+	xproto_glproto \
+	xproto_randrproto \
+	xproto_videoproto \
+	xproto_xextproto \
+	xproto_xf86driproto \
+	xproto_xineramaproto \
+	xproto_xproto \
+	xserver_xorg-server
 
 $(eval $(autotools-package))
-- 
1.7.10.4
