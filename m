From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:32 +0100
Subject: [Buildroot] [PATCH 03/84 RFC] package/gstreamer1: move comment
	around, to keep proper indentation
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <5d2b6d993c08f169be6f5b243d4a598caf08ff15.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Kconfig, when there is an item (lie a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
the menuconfig.

In this case, it means the gstremaer1 plugins are not indented below the
main gstreamer1 prompt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/gstreamer1/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 0d8dd62..c13f041 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -1,3 +1,7 @@
+comment "gstreamer 1.x needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GSTREAMER1
 	bool "gstreamer 1.x"
 	depends on BR2_USE_WCHAR # glib2
@@ -49,7 +53,3 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 	  additional space on the target.
 
 endif
-
-comment "gstreamer 1.x needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
