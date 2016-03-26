From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:54:16 +0100
Subject: [Buildroot] [git commit] libdrm: reformat patch 0001 with Git
Message-ID: <20160326175430.2F86880E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c955d784bfbcd632be4ca2065875bd9da847822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tch => 0001-Add-ARM-support-into-xf86drm.h.patch} | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/libdrm/0001-update-arm.patch b/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
similarity index 69%
rename from package/libdrm/0001-update-arm.patch
rename to package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
index 1a95a14..99a02a8 100644
--- a/package/libdrm/0001-update-arm.patch
+++ b/package/libdrm/0001-Add-ARM-support-into-xf86drm.h.patch
@@ -1,17 +1,24 @@
-[Adapted from yocto project]
+From c0950d73c8aa13f057707fb7933c65c147349376 Mon Sep 17 00:00:00 2001
+From: Lauren Post <lauren.post@freescale.com>
+Date: Tue, 22 Mar 2016 22:08:25 +0100
+Subject: [PATCH] Add ARM support into xf86drm.h
 
-Add ARM support into xf86drm.h.  This provides support for Xorg interface.
-Without this the vivante samples will hang during close requiring a reboot
+This provides support for Xorg interface.  Without this the vivante
+samples will hang during close requiring a reboot
 
+[Adapted from yocto project]
 Upstream-Status: Pending
-
 Signed-off-by: Lauren Post <lauren.post@freescale.com>
 Signed-off-by: Evan Kotara <evan.kotara@freescale.com>
+---
+ xf86drm.h | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
 
 diff --git a/xf86drm.h b/xf86drm.h
+index 481d882..1cc0075 100644
 --- a/xf86drm.h
 +++ b/xf86drm.h
-@@ -461,6 +461,23 @@ do {	register unsigned int __old __asm("
+@@ -469,6 +469,23 @@ do {	register unsigned int __old __asm("o0");		\
  		: "cr0", "memory");			\
  	} while (0)
  
@@ -35,3 +42,6 @@ diff --git a/xf86drm.h b/xf86drm.h
  #endif /* architecture */
  #endif /* __GNUC__ >= 2 */
  
+-- 
+2.6.4
+
