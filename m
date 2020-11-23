From: Maxime Brunelle <mbrunelle@distech-controls.com>
Date: Mon, 23 Nov 2020 15:13:37 -0500
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.65.3
Message-ID: <20201123201337.765168-1-mbrunelle@distech-controls.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/524
package/libglib2 reference: https://gitlab.gnome.org/GNOME/glib/-/issues/2091

Signed-off-by: Maxime Brunelle <mbrunelle@distech-controls.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 7e447a9efc..d19aa34616 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.64.4',
+   version : '2.65.3',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 55f0bb1678..41bf39435c 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.64/glib-2.64.4.sha256sum
-sha256  f7e0b325b272281f0462e0f7fff25a833820cac19911ff677251daf6d87bce50  glib-2.64.4.tar.xz
+# https://download.gnome.org/sources/glib/2.65/glib-2.65.3.sha256sum
+sha256  efd894e4693068bca945cb20d168b088510fa24d48a577f5edaf3d55912c60c2  glib-2.65.3.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6e9dbd7b26..d35f53abb6 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.64
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.65
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.29.2
