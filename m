From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:34 +0100
Subject: [Buildroot] [PATCH 05/84 RFC] package/tcl: move comment around,
	to keep proper indentation
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <bb98e5bb1e1b79f0251121a1247d3a34748f649f.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Kconfig, when there is an item (like a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
the menuconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tcl/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 63d1b25..f1fa054 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -1,3 +1,7 @@
+comment "tcl needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_TCL
 	bool "tcl"
 	# fork()
@@ -11,10 +15,6 @@ config BR2_PACKAGE_TCL
 
 	  http://www.tcl.tk
 
-comment "tcl needs a toolchain w/ threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
 if BR2_PACKAGE_TCL
 
 config BR2_PACKAGE_TCL_DEL_ENCODINGS
-- 
1.9.1
