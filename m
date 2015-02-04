From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:16 +0100
Subject: [Buildroot] [PATCH 18/21] xscreensaver: add missing indirect
	dependency on atomics
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-19-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also reformat the comment lines and fix the comment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xscreensaver/Config.in | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

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
-- 
2.1.4
