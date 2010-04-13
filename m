From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:06 +0200
Subject: [Buildroot] [PATCH 33/41] libsoup: bump to 2.28.2
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-34-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Also, remove --disable-gtk-doc (it's already in package/Makefile.in)
and fix libsoup dependencies. When compiled with ssl support it
requires libgnutls and libgcrypt.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libsoup/Config.in  |    1 +
 package/libsoup/libsoup.mk |   13 ++++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 6bccd11..596a638 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
+        select BR2_PACKAGE_LIBGNUTLS
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 3829a81..2f16408 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-LIBSOUP_MAJOR_VERSION:=2.26
-LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
-LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
-LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
+LIBSOUP_MAJOR_VERSION = 2.28
+LIBSOUP_VERSION = $(LIBSOUP_MAJOR_VERSION).2
+LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.bz2
+LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
 LIBSOUP_AUTORECONF = YES
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_INSTALL_TARGET = YES
@@ -23,9 +23,8 @@ LIBSOUP_CONF_OPT = \
 	--enable-static		\
 	--disable-explicit-deps \
 	--disable-glibtest	\
-	--without-gnome		\
-	--disable-gtk-doc
+	--without-gnome
 
-LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2 libgnutls libgcrypt
 
 $(eval $(call AUTOTARGETS,package,libsoup))
-- 
1.7.0.4
