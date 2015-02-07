From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:23:30 +0100
Subject: [Buildroot] [git commit] xscreensaver: add missing indirect
	dependency on atomics
Message-ID: <20150207202910.9DBB68046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef8573de1abfeda51cc6703719e2c6e7a52115f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also reformat the comment lines and fix the comment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xscreensaver/Config.in |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 6260040..59b19c5 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_XSCREENSAVER
 	bool "xscreensaver"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_INSTALL_LIBSTDCPP # libgtk2->pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2->glib2
-	depends on BR2_USE_WCHAR # libgtk2->glib2
-	depends on BR2_USE_MMU # libgtk2->glib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> glib2
+	depends on BR2_USE_WCHAR # libgtk2 -> glib2
+	depends on BR2_USE_MMU # libgtk2 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLADE
 	select BR2_PACKAGE_JPEG
@@ -24,4 +25,6 @@ config BR2_PACKAGE_XSCREENSAVER
 comment "xscreensaver needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
