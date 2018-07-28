From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 23:09:26 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-sis: add
 upstream patch to fix X.org server 1.20.0 build
Message-ID: <20180728211152.402957F885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a37f15738050f0e321534bdb7aa7ed8d1487481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Remove-reference-to-virtualFrom.patch     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch b/package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch
new file mode 100644
index 0000000000..c9e05efb76
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/0002-Remove-reference-to-virtualFrom.patch
@@ -0,0 +1,33 @@
+From 4b1356a2b7fd06e9a05d134caa4033681c939737 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Thu, 16 Feb 2017 11:21:27 -0500
+Subject: [PATCH] Remove reference to ->virtualFrom
+
+The core will print this information as well anyway.
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=4b1356a2b7fd06e9a05d134caa4033681c939737
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/sis_driver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sis_driver.c b/src/sis_driver.c
+index 8f06164..513f68b 100644
+--- a/src/sis_driver.c
++++ b/src/sis_driver.c
+@@ -2738,7 +2738,7 @@ SiSPrintModes(ScrnInfoPtr pScrn)
+     float hsync, refresh = 0.0;
+     char *desc, *desc2, *prefix, *uprefix, *output;
+ 
+-    xf86DrvMsg(pScrn->scrnIndex, pScrn->virtualFrom, "Virtual size is %dx%d "
++    xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Virtual size is %dx%d "
+ 	       "(pitch %d)\n", pScrn->virtualX, pScrn->virtualY,
+ 	       pScrn->displayWidth);
+ 
+-- 
+2.17.1
+
