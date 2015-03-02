From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:18 -0000
Subject: [Buildroot] [git commit]
	package/x11r7/xdriver_xf86-video-siliconmotion: bump version
Message-ID: <20150302222717.5AE01807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cb0d907387467f99837b928d1d0c1c9d55bf7b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use git snapshot for compatibility with xorg xserver 1.17.0,
remove patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-smi_driver.patch                          |   27 --------------------
 .../xdriver_xf86-video-siliconmotion.mk            |    6 ++--
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/0001-smi_driver.patch b/package/x11r7/xdriver_xf86-video-siliconmotion/0001-smi_driver.patch
deleted file mode 100644
index 493edbb..0000000
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/0001-smi_driver.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f19d7e463c30f1364e82e8c9f87b8a8407d53680 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Thu, 10 Jan 2013 03:59:39 +0000
-Subject: Remove miInitializeBackingStore()
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
-Fetch from:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-siliconmotion/commit/?id=f19d7e463c30f1364e82e8c9f87b8a8407d53680
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff --git a/src/smi_driver.c b/src/smi_driver.c
-index 4794571..134db79 100644
---- a/src/smi_driver.c
-+++ b/src/smi_driver.c
-@@ -1750,8 +1750,6 @@ SMI_ScreenInit(SCREEN_INIT_ARGS_DECL)
- 		   "Done writing mode.  Register dump:\n");
-     SMI_PrintRegs(pScrn);
- 
--    miInitializeBackingStore(pScreen);
--
- #ifdef HAVE_XMODES
-     xf86DiDGAInit(pScreen, (unsigned long)(pSmi->FBBase + pScrn->fbOffset));
- #endif
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 635e9b8..ef4fc30 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.7
-XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = c31d7f853d7469085f96f1e37923c260884c611c
+XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-siliconmotion
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(autotools-package))
