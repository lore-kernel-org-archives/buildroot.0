From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 May 2019 19:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/xdriver_xf86-video-sis: drop
 unneeded third patch
Message-ID: <20190504173232.23401-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is not needed since version 0.10.8 and:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-sis/commit/0f50f8c3db2b9f1c9d4ecab8ad278e9db6418a92

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../xdriver_xf86-video-sis/0003-xi.patch      | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-sis/0003-xi.patch

diff --git a/package/x11r7/xdriver_xf86-video-sis/0003-xi.patch b/package/x11r7/xdriver_xf86-video-sis/0003-xi.patch
deleted file mode 100644
index 7905248163..0000000000
--- a/package/x11r7/xdriver_xf86-video-sis/0003-xi.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fetch from:
-https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/xf86-video-sis&id=7aaa7a9786ce5654df877311909244e0a6c42fd1
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
---- xf86-video-sis-0.10.7/src/sis_driver.c	2013-03-10 13:57:50.000000000 +0100
-+++ xf86-video-sis-0.10.7/src/sis_driver.c.new	2013-03-10 13:54:48.645203559 +0100
-@@ -9378,7 +9378,15 @@
-      }
-      if(doit) {
- 	sigstate = xf86BlockSIGIO();
--#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 15
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 18
-+        {
-+            double dx = x, dy = y;
-+            miPointerSetPosition(inputInfo.pointer, Absolute, &dx, &dy,
-+                NULL, NULL);
-+            x = (int)dx;
-+            y = (int)dy;
-+        }
-+#elif GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 15
-         {
-             double dx = x, dy = y;
-             miPointerSetPosition(inputInfo.pointer, Absolute, &dx, &dy);
-- 
2.20.1
