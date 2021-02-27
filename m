From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Feb 2021 10:04:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to version
 2.66.7
Message-ID: <20210227090424.429843-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2021-27218: An issue was discovered in GNOME GLib before
  2.66.7 and 2.67.x before 2.67.4. If g_byte_array_new_take() was called
  with a buffer of 4GB or more on a 64-bit platform, the length would be
  truncated modulo 2**32, causing unintended length truncation.
- Fix CVE-2021-27219: An issue was discovered in GNOME GLib before
  2.66.6 and 2.67.x before 2.67.3. The function g_bytes_new has an
  integer overflow on 64-bit platforms due to an implicit cast from 64
  bits to 32 bits. The overflow could potentially lead to memory
  corruption.

https://gitlab.gnome.org/GNOME/glib/-/blob/2.66.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 72304fa4b1..25cb23c239 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.66.3',
+   version : '2.66.7',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index ac32f1b14b..7886bb5c59 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.66/glib-2.66.3.sha256sum
-sha256  79f31365a99cb1cc9db028625635d1438890702acde9e2802eae0acebcf7b5b1  glib-2.66.3.tar.xz
+# https://download.gnome.org/sources/glib/2.66/glib-2.66.7.sha256sum
+sha256  09f158769f6f26b31074e15b1ac80ec39b13b53102dfae66cfe826fb2cc65502  glib-2.66.7.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c738415216..ffbb4c96b5 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.66
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).7
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.30.0
