From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 11 Jan 2014 20:28:59 +0100
Subject: [Buildroot] [PATCH 2/6] libdrm: Remove dependency towards X11
In-Reply-To: <1389468543-6664-1-git-send-email-berndkuhls@hotmail.com>
References: <1389468543-6664-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP65D2CBD501E06CD3715EA5D9B20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v3: rebased v2
v2: http://patchwork.ozlabs.org/patch/304116/ (Paul Cercueil)
v1: http://patchwork.ozlabs.org/patch/278297/ (Spenser Gilliland)

Tested-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libdrm/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 4d7646b..e382a3a 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
-	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
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
-- 
1.7.10.4
