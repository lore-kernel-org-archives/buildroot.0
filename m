From: Mauro Condarelli <mc5686@mclink.it>
Date: Sat, 29 Aug 2015 12:43:51 +0200
Subject: [Buildroot] [PATCH 1/1] Fix Image name not configurable (issue #28).
In-Reply-To: <1440845031-3965-1-git-send-email-mc5686@mclink.it>
References: <1440842823-1283-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-1-git-send-email-mc5686@mclink.it>
Message-ID: <1440845031-3965-2-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 ...age-name-not-appearing-in-make-menuconfig.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch

diff --git a/boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch b/boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch
new file mode 100644
index 0000000..cf72b16
--- /dev/null
+++ b/boot/at91bootstrap3/0001-fix-Image-name-not-appearing-in-make-menuconfig.patch
@@ -0,0 +1,27 @@
+From d2a65fce095242f28f263bbaba373516b6b4db43 Mon Sep 17 00:00:00 2001
+From: Mauro Condarelli <mc5686@mclink.it>
+Date: Sat, 29 Aug 2015 11:49:26 +0200
+Subject: [PATCH] trivial patch to fix Image name not appearing in 'make
+ manuconfig' (fixes issue #28).
+
+Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
+---
+ Config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Config.in b/Config.in
+index 432df26..714b05d 100644
+--- a/Config.in
++++ b/Config.in
+@@ -81,7 +81,7 @@ source "Config.in.u-boot"
+ source "Config.in.app-image"
+ 
+ config CONFIG_IMAGE_NAME
+-	string
++	string "Image name"
+ 	default "Image" if CONFIG_LINUX_IMAGE
+ 	default "u-boot.bin" if CONFIG_LOAD_UBOOT
+ 	default "softpack.bin" if CONFIG_LOAD_64KB || CONFIG_LOAD_4MB || CONFIG_LOAD_1MB
+-- 
+2.1.4
+
-- 
2.1.4
