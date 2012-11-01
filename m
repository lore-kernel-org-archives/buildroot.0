From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:36:16 +0100
Subject: [Buildroot] [PATCH 3 8/9] gdk-pixbuf: remove dependency on gettext
In-Reply-To: <20121101143539.8550.70150.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
Message-ID: <20121101143616.8550.78988.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

The dependency on gettext comes from libglib2, not from gdk-pixbuf
itself.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdk-pixbuf/Config.in     |    1 -
 package/gdk-pixbuf/gdk-pixbuf.mk |    1 -
 2 files changed, 2 deletions(-)

diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 33b5f7c..f205793 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4e00c40..8c785cd 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -40,7 +40,6 @@ GDK_PIXBUF_DEPENDENCIES += xlib_libX11
 endif
 
 GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkgconf libglib2
 
