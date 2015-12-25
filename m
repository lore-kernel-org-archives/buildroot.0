From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:50 +0100
Subject: [Buildroot] [PATCH 21/84 RFC] package/ola: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <a76b6dff8629c48b08d9888ec1fa861cd5333cc6.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since there were multiple sub-menus, their prompts are turned into
comments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ola/Config.in | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index fd693de..fb96e11 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -3,7 +3,7 @@ comment "ola needs a toolchain w/ C++, threads, wchar, dynamic library"
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 
-config BR2_PACKAGE_OLA
+menuconfig BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -24,7 +24,7 @@ config BR2_PACKAGE_OLA
 
 if BR2_PACKAGE_OLA
 
-menu "bindings and interface"
+comment "bindings and interface"
 
 config BR2_PACKAGE_OLA_WEB
 	bool "http interface"
@@ -44,9 +44,7 @@ config BR2_PACKAGE_OLA_SLP
 	help
 	  Build OLA with slp tools.
 
-endmenu
-
-menu "tests and examples"
+comment "tests and examples"
 
 config BR2_PACKAGE_OLA_EXAMPLES
 	bool "examples"
@@ -60,9 +58,7 @@ config BR2_PACKAGE_OLA_RDM_TESTS
 	help
 	  Build OLA RDM tests.
 
-endmenu
-
-menu "plugin selections"
+comment "plugin selections"
 
 config BR2_PACKAGE_OLA_PLUGIN_E131
 	bool "acn E131"
@@ -132,6 +128,4 @@ config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	help
 	  Build UsbPro plugin for OLA.
 
-endmenu
-
 endif
-- 
1.9.1
