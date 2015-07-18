From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 12:25:38 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati:
	Re-wrap dependencies, no code change
Message-ID: <20150718120024.85E997FE2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81a2b4d67275ace8ee2894b289a76d0cd7777c7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-ati.mk                      |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

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
