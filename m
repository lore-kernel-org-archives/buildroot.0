From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:32 +0200
Subject: [Buildroot] [PATCH 21/83 v2] package/tcl: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <350a8dbcf35ccaa7a70733737e3f3ddf2bef7542.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move inclusion of Tcl libraries/modules to Tcl's Config.in so that they
appear in Tcl's sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in     | 6 ------
 package/tcl/Config.in | 7 ++++++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dcf1525..ebc8f6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,12 +576,6 @@ endif
 	source "package/python3/Config.in"
 	source "package/ruby/Config.in"
 	source "package/tcl/Config.in"
-if BR2_PACKAGE_TCL
-menu "Tcl libraries/modules"
-	source "package/expect/Config.in"
-	source "package/tcllib/Config.in"
-endmenu
-endif
 endmenu
 
 menu "Libraries"
diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index f1fa054..dacd1a8 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -2,7 +2,7 @@ comment "tcl needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_TCL
+menuconfig BR2_PACKAGE_TCL
 	bool "tcl"
 	# fork()
 	depends on BR2_USE_MMU
@@ -36,4 +36,9 @@ config BR2_PACKAGE_TCL_SHLIB_ONLY
 
 	  Saves ~14kb.
 
+comment "Tcl libraries/modules"
+
+source "package/expect/Config.in"
+source "package/tcllib/Config.in"
+
 endif
-- 
2.7.4
