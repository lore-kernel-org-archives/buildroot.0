From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 23 Jun 2009 12:33:40 +0200
Subject: [Buildroot] [git commit] libsoup: bump version
Message-ID: <20090623115600.4F7D1777FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e22a39fb44e7862de517f35bcbef7acacfb7e4a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #349.

Attached patch updates libsoup to version 2.26.2.

This is relevant for bug 303 as it allows to compile gvfs with much
less patching.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsoup/libsoup.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index f9e9331..c0b85e2 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-LIBSOUP_VERSION:=2.4.1
-LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.gz
-LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/2.4
+LIBSOUP_MAJOR_VERSION:=2.26
+LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
+LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
+LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
 LIBSOUP_AUTORECONF = NO
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_INSTALL_TARGET = YES
@@ -23,6 +24,7 @@ LIBSOUP_CONF_OPT = \
 	--enable-static		\
 	--disable-explicit-deps \
 	--disable-glibtest	\
+	--without-gnome		\
 	--disable-gtk-doc --without-html-dir
 
 LIBSOUP_DEPENDENCIES = uclibc gettext libintl host-pkgconfig host-libglib2 libglib2 libxml2
-- 
1.6.0.6
