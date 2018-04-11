From: Andre Renaud <andre@ignavus.net>
Date: Wed, 11 Apr 2018 04:41:27 +0000
Subject: [Buildroot] [PATCH] package/mesa3d: Add Freedreno gallium driver
Message-ID: <CAEj2-1MdHRREFJKrkMjc9U2j_x1mJjOwkeqaV_d1iLejM4q3hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added option to enable Freedreno gallium driver in mesa3d

Signed-off-by: Andre Renaud <andre@ignavus.net>
---
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f141587c4d..3d99637cc3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -63,6 +63,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
        help
          Mesa driver for Vivante GPUs.

+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+       bool "Gallium freedreno driver"
+       select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+       select BR2_PACKAGE_LIBDRM_FREEDRENO
+       help
+         Mesa driver for Freedreno GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
        bool "Gallium nouveau driver"
        depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3f907c9463..ac2f0033cc 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -67,6 +67,7 @@ endif

 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  +=
etnaviv imx
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)  +=
freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  +=
nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     +=
r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     +=
svga
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180411/f7756217/attachment.html>
