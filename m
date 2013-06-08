From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Jun 2013 22:52:01 +0200
Subject: [Buildroot] [git commit] libsoup: bump to version 2.43.1
Message-ID: <20130608224115.7AEC49AA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dca8781610115458f76589e6fd9a19c5ed5971b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
