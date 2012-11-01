From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:36:21 +0100
Subject: [Buildroot] [PATCH 3 9/9] libsoup: Remove redundant dependency on
	gettext
In-Reply-To: <20121101143539.8550.70150.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
Message-ID: <20121101143621.8550.4383.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

libsoup doesn't use intl stuff directly, but uses gi18n.  libglib2
already has all required dependencies on gettext.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsoup/Config.in  |    1 -
 package/libsoup/libsoup.mk |    2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 57b425f..b79108e 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_WCHAR # glib2 and gnutls
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 2f173df..2a2d8bf 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 libxml2
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
