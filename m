From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:02 +0100
Subject: [Buildroot] [PATCH 10/80 v1] package/libdrm: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <d456ccac80e41e5a116decfcc79e3bcc3347f402.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Transform the menu prompt into a comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - drop the comment  (Arnout)
---
 package/libdrm/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index ad015f8..2f9ad7c 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBDRM
+menuconfig BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
@@ -9,8 +9,6 @@ config BR2_PACKAGE_LIBDRM
 
 if BR2_PACKAGE_LIBDRM
 
-menu "DRM Drivers"
-
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
 	select BR2_PACKAGE_LIBATOMIC_OPS
@@ -64,8 +62,6 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 	help
 	  Install NVIDIA Tegra driver using an experimental API.
 
-endmenu
-
 config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
 	bool "Install test programs"
 	help
-- 
1.9.1
