From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Jun 2019 13:47:33 -0400
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to version
 2.60.4
Message-ID: <20190623174733.73859-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Fixes critical CVE-2019-12450:
  https://nvd.nist.gov/vuln/detail/CVE-2019-12450

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch            | 2 +-
 ...0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch | 2 +-
 package/libglib2/libglib2.hash                                | 4 ++--
 package/libglib2/libglib2.mk                                  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index f0cb510c5d..e7e48f1a8b 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index c96289a..b694bb7 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.60.3',
+   version : '2.60.4',
    meson_version : '>= 0.48.0',
    default_options : [
 @@ -9,7 +9,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index e51bb6b2b1..b24fe691d1 100644
--- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -15,7 +15,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -357,6 +357,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -359,6 +359,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      '-Wno-cast-function-type',
 +    '-Wno-format-nonliteral',
      # Due to function casts through (void*) we cannot support -Wpedantic:
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 763c645b85..6cbcba702a 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.60/glib-2.60.3.sha256sum
-sha256  04ab0d560d45790d055f50db2d69974eab8b693a77390075462c56e652b760b9  glib-2.60.3.tar.xz
+# https://download.gnome.org/sources/glib/2.60/glib-2.60.4.sha256sum
+sha256  2b941ec5dcb92e5ea83fe42f9eb55a827bc8a12c153ad2489d551c31d04733dd  glib-2.60.4.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 207352fa37..28a50f96a4 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.60
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.21.0
