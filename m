From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:45 +0100
Subject: [Buildroot] [PATCH 16/84 RFC] package/libdrm: use 'menuconfig'
	instad of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <c1a144f851aa93fffd93803b3ef4954009d26fe6.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Transform the menu prompt into a comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libdrm/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index ad015f8..9b75647 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBDRM
+menuconfig BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBDRM
 
 if BR2_PACKAGE_LIBDRM
 
-menu "DRM Drivers"
+comment "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
@@ -64,8 +64,6 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 	help
 	  Install NVIDIA Tegra driver using an experimental API.
 
-endmenu
-
 config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
 	bool "Install test programs"
 	help
-- 
1.9.1
