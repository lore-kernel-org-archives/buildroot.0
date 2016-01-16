From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:06 +0100
Subject: [Buildroot] [PATCH 14/80 v1] package/nodejs: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <69f8a298cee6ad4340690c8d0567b4523ab28338.1452983019.git.yann.morin.1998@free.fr>
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
index 3dfccac..702ea38 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -5,7 +5,7 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_NODEJS
+menuconfig BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -64,8 +64,6 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
 	default "0.10.41"	if BR2_PACKAGE_NODEJS_0_10_X
 	default "5.3.0"		if BR2_PACKAGE_NODEJS_5_X
 
-menu "Module Selection"
-
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
 	select BR2_PACKAGE_OPENSSL
@@ -120,6 +118,4 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 	  'libcurl' here, to ensure that buildroot builds the libcurl package,
 	  and does so before building your node modules.
 
-endmenu
-
 endif
-- 
1.9.1
