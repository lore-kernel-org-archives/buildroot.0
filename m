From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:41:57 +1300
Subject: [Buildroot] [git commit] xdriver_xf86-video-sis: use += instead of
	= for CONF_OPTS assignment
Message-ID: <20170125034240.B9E2481979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=152351143acbc19150a71c77ccf10a1742276fd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using += is always a good idea in conditional assignments, as it
prevents potential future mistakes if unconditional options are added;

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index d244749..5792f8e 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -13,7 +13,7 @@ XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_SIS_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
