From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:41:06 +1300
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-sis:
	disable DRI support when not available
Message-ID: <20170125034120.E39948189C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04c5e1ba16b168a4bec96cc6b4600907cf325425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/ad8/ad861cb34c15a91e511042d8e47e2c3132cd5898/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index b1fce83..d244749 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -12,4 +12,8 @@ XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+XDRIVER_XF86_VIDEO_SIS_CONF_OPTS = --disable-dri
+endif
+
 $(eval $(autotools-package))
