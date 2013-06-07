From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Jun 2013 18:18:49 -0500
Subject: [Buildroot] [PATCH v10 04/13] libsoup: bump to version 2.43.1
In-Reply-To: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370647138-26623-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libsoup/Config.in  |    1 +
 package/libsoup/libsoup.mk |    6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 57b425f..2ed08d9 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_SQLITE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 2f7233a..c9d90e8 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSOUP_MAJOR_VERSION = 2.36
+LIBSOUP_MAJOR_VERSION = 2.43
 LIBSOUP_MINOR_VERSION = 1
 LIBSOUP_VERSION = $(LIBSOUP_MAJOR_VERSION).$(LIBSOUP_MINOR_VERSION)
-LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.bz2
+LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
 LIBSOUP_INSTALL_STAGING = YES
 
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 libglib2 libxml2 sqlite
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
-- 
1.7.1
