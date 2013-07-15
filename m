From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:08 -0500
Subject: [Buildroot] [PATCH 25/67] libgtk2: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-26-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minor clean up as well.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libgtk2/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 462b0b6..c280c6a 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -14,18 +14,23 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
 
 	  http://www.gtk.org/
 
+if BR2_PACKAGE_LIBGTK2
+
 config BR2_PACKAGE_LIBGTK2_DEMO
 	bool "Install libgtk2 demo program"
-	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  The GTK+ source base contains a gtk-demo program. This
 	  option allows to install this program to the target.
 
-comment "libgtk2 requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+endif
+
+comment "libgtk2 requires a toolchain with WCHAR, threading and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
