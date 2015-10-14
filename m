From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:28:25 +0200
Subject: [Buildroot] [git commit] libsoup: bump to version 2.52.1
Message-ID: <20151014202845.D4109818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2a49119f8baa2f9d3f3ee4255acaa042ddd1c6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabled vala bindings since they're not used by the current buildroot
packages and it requires gobject-introspection which we don't provide
yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/libsoup.hash |    4 ++--
 package/libsoup/libsoup.mk   |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 2eb86c4..58e3eb2 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.48/libsoup-2.48.0.sha256sum
-sha256	ea34dd64fe44343445daf6dd690d0691e9d973468de44878da97371c16d89784	libsoup-2.48.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.52/libsoup-2.52.1.sha256sum
+sha256	0e19bca047ad50b28e8ed7663840f9e45a94909148822ca44dcb3e8cafb5cc48	libsoup-2.52.1.tar.xz
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 8cbd0cb..e43e25c 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.48
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+LIBSOUP_VERSION_MAJOR = 2.52
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
-LIBSOUP_CONF_OPTS = --disable-glibtest
+LIBSOUP_CONF_OPTS = --disable-glibtest --enable-vala=no
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
 	libglib2 libxml2 sqlite host-intltool
 
