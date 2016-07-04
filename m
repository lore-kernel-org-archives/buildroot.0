From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:19 +0200
Subject: [Buildroot] [PATCH 08/83 v2] package/libdrm: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <480ef600cac5b7e6233b663c5f779603c302d3b8.1467624132.git.yann.morin.1998@free.fr>
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
index 7bc73fd..3f39e27 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBDRM
+menuconfig BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
@@ -18,8 +18,6 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	bool
 	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4
 
-menu "DRM Drivers"
-
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
 	select BR2_PACKAGE_LIBPCIACCESS
@@ -92,8 +90,6 @@ config BR2_PACKAGE_LIBDRM_VC4
 	help
 	  Install vc4 (Raspberry Pi) driver.
 
-endmenu
-
 config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
 	bool "Install test programs"
 	help
-- 
2.7.4
