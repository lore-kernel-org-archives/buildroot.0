From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 20 Dec 2013 16:33:44 +0100
Subject: [Buildroot] [PATCH 2/2] libdrm: Remove dependency towards X11
In-Reply-To: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
References: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
Message-ID: <1387553624-6780-3-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libdrm/Config.in | 8 +++++---
 package/libdrm/libdrm.mk | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 205f47c..51d8e58 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
-	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	help
 	  Direct Rendering Manager
 
@@ -14,6 +13,7 @@ menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
@@ -22,6 +22,7 @@ config BR2_PACKAGE_LIBDRM_INTEL
 
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
@@ -30,6 +31,7 @@ config BR2_PACKAGE_LIBDRM_RADEON
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
@@ -37,6 +39,7 @@ config BR2_PACKAGE_LIBDRM_NOUVEAU
 
 config BR2_PACKAGE_LIBDRM_VMWGFX
 	bool "vmwgfx"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
@@ -65,5 +68,4 @@ endmenu
 endif
 
 comment "libdrm needs a toolchain w/ largefile"
-	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_LARGEFILE
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f5efaf1..dd08af1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -12,7 +12,7 @@ LIBDRM_LICENSE = MIT
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
-	xlib_libpthread-stubs \
+	libpthread-stubs \
 	host-pkgconf
 
 LIBDRM_CONF_OPT = \
-- 
1.8.5.1
