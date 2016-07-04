From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:08:25 +0200
Subject: [Buildroot] [git commit] package/ola: use 'menuconfig' instead of
	'config'+'menu'
Message-ID: <20160704210928.8C82782123@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb9340c70f32501f2a676fb404ae8a79450ec6c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since there were multiple sub-menus, their prompts are turned into
comments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ola/Config.in | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 38d744a..7b56f5c 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -3,7 +3,7 @@ comment "ola needs a toolchain w/ C++, threads, wchar, dynamic library"
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
-config BR2_PACKAGE_OLA
+menuconfig BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -22,7 +22,7 @@ config BR2_PACKAGE_OLA
 
 if BR2_PACKAGE_OLA
 
-menu "bindings and interface"
+comment "bindings and interface"
 
 config BR2_PACKAGE_OLA_WEB
 	bool "http interface"
@@ -43,9 +43,7 @@ config BR2_PACKAGE_OLA_SLP
 	help
 	  Build OLA with slp tools.
 
-endmenu
-
-menu "tests and examples"
+comment "tests and examples"
 
 config BR2_PACKAGE_OLA_EXAMPLES
 	bool "examples"
@@ -59,9 +57,7 @@ config BR2_PACKAGE_OLA_RDM_TESTS
 	help
 	  Build OLA RDM tests.
 
-endmenu
-
-menu "plugin selections"
+comment "plugin selections"
 
 config BR2_PACKAGE_OLA_PLUGIN_E131
 	bool "acn E131"
@@ -131,6 +127,4 @@ config BR2_PACKAGE_OLA_PLUGIN_USBPRO
 	help
 	  Build UsbPro plugin for OLA.
 
-endmenu
-
 endif
