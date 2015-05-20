From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 May 2015 10:26:32 +0200
Subject: [Buildroot] [PATCH/next 1/7] package/dovecot: bump version to 2.2.18
Message-ID: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
http://hg.dovecot.org/dovecot-2.2/rev/e4ad83ed88c9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/0001-zlib.patch |   24 ------------------------
 package/dovecot/dovecot.hash    |    2 +-
 package/dovecot/dovecot.mk      |    2 +-
 3 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 package/dovecot/0001-zlib.patch

diff --git a/package/dovecot/0001-zlib.patch b/package/dovecot/0001-zlib.patch
deleted file mode 100644
index a6187bf..0000000
--- a/package/dovecot/0001-zlib.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-SQLite does not depend on zlib
-
-Fixes build error when zlib target package is not present:
-/home/br/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/../../../../arm-linux-gnueabihf/bin/ld: cannot find -lz
-
-Patch for configure.ac sent upstream:
-http://www.dovecot.org/list/dovecot/2014-November/098634.html
-
-Here we patch ./configure instead because autoreconf is broken.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr dovecot-2.2.15.org/configure dovecot-2.2.15/configure
---- dovecot-2.2.15.org/configure	2014-10-25 06:08:57.000000000 +0200
-+++ dovecot-2.2.15/configure	2014-11-08 10:08:53.430745198 +0100
-@@ -23865,7 +23865,7 @@
- 		ac_fn_c_check_header_mongrel "$LINENO" "sqlite3.h" "ac_cv_header_sqlite3_h" "$ac_includes_default"
- if test "x$ac_cv_header_sqlite3_h" = xyes; then :
- 
--			SQLITE_LIBS="$SQLITE_LIBS -lsqlite3 -lz"
-+			SQLITE_LIBS="$SQLITE_LIBS -lsqlite3"
- 
- 
- $as_echo "#define HAVE_SQLITE /**/" >>confdefs.h
diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index bcfffbb..8b6e8f5 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	56ce1287a17fa88a2083116db00200deff1a5390af5eac1c8ae3f59a2079cff0	dovecot-2.2.16.tar.gz
+sha256	b6d8468cea47f1227f47b80618f7fb872e2b2e9d3302adc107a005dd083865bb	dovecot-2.2.18.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index e8d1edb..3b4f6d1 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).16
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).18
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
-- 
1.7.10.4
