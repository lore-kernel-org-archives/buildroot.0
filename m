From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:15 +0100
Subject: [Buildroot] [PATCH 23/80 v1] package/tcl: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <09a7b6db8b206e571ba393fe2c66d36c1c66aa3e.1452983019.git.yann.morin.1998@free.fr>
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
index 531b1a0..b7c5813 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -548,12 +548,6 @@ endif
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
1.9.1
