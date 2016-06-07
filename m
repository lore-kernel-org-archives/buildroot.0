From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:49:21 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-tdfx:
	disable DRI support when not available
Message-ID: <20160607214925.D2A757FE19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7614ca037b2f82ac8e7cca1db3bf173d3655e0e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/304/304b68d14da026755d9d9323ed60f4f86adc7a96/
http://autobuild.buildroot.net/results/2b2/2b2558661850db295e670edfb5943973e93e01e4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
