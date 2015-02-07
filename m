From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:22:55 +0100
Subject: [Buildroot] [git commit] pinenty: add missing indirect dependency
	on atomics for gtk2 support
Message-ID: <20150207202910.9591A8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=454c31103b3c42efd8b32ec3b440afa0e24879ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove redundant comment lines.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/Config.in |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index ae70257..350327a 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -18,13 +18,12 @@ config BR2_PACKAGE_PINENTRY_NCURSES
 
 config BR2_PACKAGE_PINENTRY_GTK2
 	bool "pinentry-gtk2"
-	# propagate libgtk2's dependencies
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	# select libgtk2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -32,17 +31,16 @@ config BR2_PACKAGE_PINENTRY_GTK2
 
 comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT4
 	bool "pinentry-qt4"
-	# propagate qt's dependencies
 	depends on !BR2_avr32 # lacks TLS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# select qt
 	select BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
