From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:57:35 +0100
Subject: [Buildroot] [git commit] package/gstreamer: move comment around,
	to keep proper indentation
Message-ID: <20151228165834.DFB217F8EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac295c45883e9349a65c5e7bf50a0e03fef03739
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Kconfig, when there is an item (like a comment) between a symbol and
its dependees, then the indentation is not in effect.

Move the symbol to the top of the file to guarantee the indentation in
menuconfig.

In this case, it means the gstremaer plugins are not indented below
the main gstreamer prompt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer/gstreamer/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index b833c96..eb1249a 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -1,3 +1,7 @@
+comment "gstreamer 0.10 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer 0.10"
 	depends on BR2_USE_WCHAR # glib2
@@ -30,7 +34,3 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
 	  the launch-time for a GStreamer application.
 
 endif
-
-comment "gstreamer 0.10 needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
