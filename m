From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 18 May 2020 07:00:49 -0700
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to 10.3.23
Message-ID: <20200518140049.138333-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two spaces in hash file.

Remove patch 0002 as it has been applied upstream.

Release notes:
https://mariadb.com/kb/en/library/mariadb-10323-release-notes/

Changelog:
https://mariadb.com/kb/en/library/mariadb-10323-changelog/

Fixes the following security vulnerabilities:
CVE-2020-2752 - Vulnerability in the MySQL Client product of Oracle MySQL
(component: C API). Supported versions that are affected are 5.6.47 and
prior, 5.7.27 and prior and 8.0.17 and prior. Difficult to exploit
vulnerability allows low privileged attacker with network access via
multiple protocols to compromise MySQL Client. Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Client.

CVE-2020-2812 - Vulnerability in the MySQL Server product of Oracle MySQL
(component: Server: Stored Procedure). Supported versions that are affected
are 5.6.47 and prior, 5.7.29 and prior and 8.0.19 and prior. Easily
exploitable vulnerability allows high privileged attacker with network
access via multiple protocols to compromise MySQL Server. Successful attacks
of this vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2020-2814 - Vulnerability in the MySQL Server product of Oracle MySQL
(component: InnoDB). Supported versions that are affected are 5.6.47 and
prior, 5.7.28 and prior and 8.0.18 and prior. Easily exploitable
vulnerability allows high privileged attacker with network access via
multiple protocols to compromise MySQL Server. Successful attacks of this
vulnerability can result in unauthorized ability to cause a hang or
frequently repeatable crash (complete DOS) of MySQL Server.

CVE-2020-2760 - Vulnerability in the MySQL Server product of Oracle MySQL
(component: InnoDB). Supported versions that are affected are 5.7.29 and
prior and 8.0.19 and prior. Easily exploitable vulnerability allows high
privileged attacker with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can result in
unauthorized ability to cause a hang or frequently repeatable crash
(complete DOS) of MySQL Server as well as unauthorized update, insert or
delete access to some of MySQL Server accessible data.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 ...2-add-sysroot-path-to-mariadb_config.patch | 29 -------------------
 package/mariadb/mariadb.hash                  | 14 ++++-----
 package/mariadb/mariadb.mk                    |  2 +-
 3 files changed, 8 insertions(+), 37 deletions(-)
 delete mode 100644 package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch

diff --git a/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
deleted file mode 100644
index d19947f09a..0000000000
--- a/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7e1b6aafeb9fe6558da7506b304c0efb5ea82281 Mon Sep 17 00:00:00 2001
-From: Ryan Coe <bluemrp9@gmail.com>
-Date: Fri, 13 Dec 2019 17:13:26 -0800
-Subject: [PATCH] add sysroot path to mariadb_config
-
-Upstream: https://github.com/mariadb-corporation/mariadb-connector-c/commit/b787c0d69cc00af98cd4ee5bc205e1c7ddaf427a
-Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
----
- libmariadb/mariadb_config/mariadb_config.c.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libmariadb/mariadb_config/mariadb_config.c.in b/libmariadb/mariadb_config/mariadb_config.c.in
-index 703c9466a1d9214a85f3638d2e3b4ecfef0c7bd6..f5513333e670373f060a3c2574d1d42facfd0337 100644
---- a/libmariadb/mariadb_config/mariadb_config.c.in
-+++ b/libmariadb/mariadb_config/mariadb_config.c.in
-@@ -5,8 +5,8 @@
- 
- static char *mariadb_progname;
- 
--#define INCLUDE "-I at CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
--#define LIBS    "-L at CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
-+#define INCLUDE "-I at CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
-+#define LIBS    "-L at CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
- #define LIBS_SYS "@extra_dynamic_LDFLAGS@"
- #define CFLAGS  INCLUDE
- #define VERSION "@MARIADB_CLIENT_VERSION@"
--- 
-2.24.1
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 679643887f..9de97360a4 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.3.22
-md5 f712a5e6fde038d0c9c6d2a2cd88b84e  mariadb-10.3.22.tar.gz
-sha1 f92f517fc2ea893ffb3d599ade219bf0a0045265  mariadb-10.3.22.tar.gz
-sha256 3200055dbdc27746981b3bb4bc182e2cb79dcf28ea88014b641a5b81280ccec7  mariadb-10.3.22.tar.gz
-sha512 57a6551b8939f54742963202d50a537e69e8ab9b2dca42ce3d2a09c0f7af368fded71f36af26f6cbd956d54fe43853981ba8fe28b7a3ba97c7d52ea4a0d233f6  mariadb-10.3.22.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.23
+md5  473950893d29805d9384ec0ed5d7c276  mariadb-10.3.23.tar.gz
+sha1  c95b6d4cff5e6d63eed05da20561802b9c83e717  mariadb-10.3.23.tar.gz
+sha256  fc405022457d8eec5991b870cc1c9a07b83b551d6165c414c4d8f31523aa86ae  mariadb-10.3.23.tar.gz
+sha512  535cd2ce80a95b6c0a1aa559cc3275dfcd559c3a4f958fab3382923190a16e6bc5b4ad79acaa518244512ff618568c239c0edef8a701d958362ede19a29c2986  mariadb-10.3.23.tar.gz
 
 # Hash for license files
-sha256 a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
-sha256 240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
+sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
+sha256  240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d5f4ef6bb5..1d0be060df 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.22
+MARIADB_VERSION = 10.3.23
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.25.1
