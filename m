From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:23 +0200
Subject: [Buildroot] [PATCH 12/83 v2] package/nodejs: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <1148baed8dcb73a640d3c6fb65afe57762d153e6.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1;
  - drop the comment  (Arnout)
---
 package/nodejs/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 432792f..f0b1f0e 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -6,7 +6,7 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8,
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
-config BR2_PACKAGE_NODEJS
+menuconfig BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -46,8 +46,6 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
 	default "6.2.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.45"
 
-menu "Module Selection"
-
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
 	select BR2_PACKAGE_OPENSSL
@@ -102,6 +100,4 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 	  'libcurl' here, to ensure that buildroot builds the libcurl package,
 	  and does so before building your node modules.
 
-endmenu
-
 endif
-- 
2.7.4
