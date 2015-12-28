From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:57:50 +0100
Subject: [Buildroot] [git commit] package/gstreamer1: move comment around,
	to keep proper indentation
Message-ID: <20151228165834.EB54B7F8EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9b809df972adb01b94cad043e0172460ffd775c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Kconfig, when there is an item (like a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
menuconfig.

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
