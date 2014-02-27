From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 27 Feb 2014 15:18:08 -0500
Subject: [Buildroot] [PATCH 1/1] libdrm: remove useless dependencies on
	libpciaccess
Message-ID: <1393532288-14691-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the version 2.4.32, libdrm no longer requires dependencies on
the libpciaccess unless for the intel-dri.

For more information :
http://cgit.freedesktop.org/mesa/drm/commit/?id=be30d350b64c1a83473a9ffbedf8e2c680a65fcd

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 package/libdrm/Config.in | 3 ---
 package/libdrm/libdrm.mk | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 205f47c..4ac4e52 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -23,21 +23,18 @@ config BR2_PACKAGE_LIBDRM_INTEL
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	select BR2_PACKAGE_LIBATOMIC_OPS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  install AMD/ATI graphics driver
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  install Nvidia graphics driver
 
 config BR2_PACKAGE_LIBDRM_VMWGFX
 	bool "vmwgfx"
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  installs Vmware graphics driver
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f5efaf1..f2c830c 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -28,21 +28,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
 LIBDRM_CONF_OPT += --enable-radeon
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
 LIBDRM_CONF_OPT += --enable-nouveau
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-nouveau
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
 LIBDRM_CONF_OPT += --enable-vmwgfx
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-vmwgfx
 endif
-- 
1.9.0
