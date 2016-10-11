From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 11:21:58 +0200
Subject: [Buildroot] [git commit] Revert "Revert "libglib2: bump to version
	2.50.0""
Message-ID: <20161011092220.A3E407FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bce311efcfa69bfe28eb7ed12a5c1b61f625d80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 40da5b434d0d25662b447f14b724245da04ed90d.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/Config.in     | 2 ++
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 84ee816..80c7d67 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 35728e2..3bc4021 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.48/glib-2.48.2.sha256sum
-sha256  f25e751589cb1a58826eac24fbd4186cda4518af772806b666a3f91f66e6d3f4  glib-2.48.2.tar.xz
+# https://download.gnome.org/sources/glib/2.50/glib-2.50.0.sha256sum
+sha256  830b551fa626bda06e12729205b3c5bb0d82b924a8cf64d948945878f01b7d70  glib-2.50.0.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6b1a387..5bc6ed5 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.48
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.50
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
@@ -102,7 +102,7 @@ HOST_LIBGLIB2_CONF_OPTS = \
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 host-gettext \
-	libffi pcre zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
+	libffi pcre util-linux zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
 	host-gettext host-libffi host-pcre host-pkgconf host-zlib
