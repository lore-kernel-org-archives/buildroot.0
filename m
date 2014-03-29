From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:26 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-siliconmotion: Bump
	version to 1.7.7
Message-ID: <20140329222158.B479A9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84098eec7cb475dfc8bc6a82d1978f2d25530f9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ..._xf86-video-siliconmotion-0001-smi_driver.patch |   27 ++++++++++++++++++++
 .../xdriver_xf86-video-siliconmotion.mk            |    2 +-
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion-0001-smi_driver.patch b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion-0001-smi_driver.patch
new file mode 100644
index 0000000..493edbb
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion-0001-smi_driver.patch
@@ -0,0 +1,27 @@
+From f19d7e463c30f1364e82e8c9f87b8a8407d53680 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Thu, 10 Jan 2013 03:59:39 +0000
+Subject: Remove miInitializeBackingStore()
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-siliconmotion/commit/?id=f19d7e463c30f1364e82e8c9f87b8a8407d53680
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/smi_driver.c b/src/smi_driver.c
+index 4794571..134db79 100644
+--- a/src/smi_driver.c
++++ b/src/smi_driver.c
+@@ -1750,8 +1750,6 @@ SMI_ScreenInit(SCREEN_INIT_ARGS_DECL)
+ 		   "Done writing mode.  Register dump:\n");
+     SMI_PrintRegs(pScrn);
+ 
+-    miInitializeBackingStore(pScreen);
+-
+ #ifdef HAVE_XMODES
+     xf86DiDGAInit(pScreen, (unsigned long)(pSmi->FBBase + pScrn->fbOffset));
+ #endif
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 91c8453..635e9b8 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.6
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.7
 XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
