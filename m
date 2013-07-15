From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:58 -0500
Subject: [Buildroot] [PATCH 15/67] gdk-pixbuf: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-16-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gdk-pixbuf/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 33b5f7c..05de934 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -9,3 +10,6 @@ config BR2_PACKAGE_GDK_PIXBUF
 	  and the GLib, to integrate well with GNOME applications.
 
 	  http://www.gtk.org/
+
+comment "gdk-pixbuf depends on toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
