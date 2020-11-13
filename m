From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Nov 2020 23:07:38 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/radvd: bump to version 2.19
Message-ID: <20201113220738.1203247-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version) and so autoreconf

http://www.litech.org/radvd/CHANGES.txt:w

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ck-protector-the-toolchain-might-lac.patch | 27 -------------------
 package/radvd/radvd.hash                      |  6 ++---
 package/radvd/radvd.mk                        |  4 +--
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch

diff --git a/package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch b/package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
deleted file mode 100644
index 44768086cc..0000000000
--- a/package/radvd/0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 324e1ebc7b86f68f49fb4f1c34a4de60d18dd3c1 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 23 Nov 2014 12:17:11 +0100
-Subject: [PATCH 2/3] Don't force -fstack-protector, the toolchain might lack
- support for it
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 80633e7..8b5a2e4 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -43,7 +43,6 @@ DISABLE_WARNINGS = \
- 
- AM_CFLAGS = \
- 	-fno-strict-aliasing \
--	-fstack-protector \
- 	$(ENABLE_WARNINGS) \
- 	$(DISABLE_WARNINGS)
- 
--- 
-2.1.0
-
diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index 9ade027d27..a624db24ba 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,3 +1,3 @@
-# From http://www.litech.org/radvd/dist/radvd-2.18.tar.gz.sha256
-sha256	4f573e36b96ba92d03b5abbbd5f059b9c8994967812c77852f44049ac5a448fd	radvd-2.18.tar.gz
-sha256	40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80	COPYRIGHT
+# From http://www.litech.org/radvd/dist/radvd-2.19.tar.gz.sha512
+sha512  caa621fd77e34ff6858d60a41b0ee02aff967ac14f2b84c402359744f4bece5c1563419860431c328adc0385e9893ed1f2421d652247a3aa0dfc0aaad1e01233  radvd-2.19.tar.gz
+sha256  40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80  COPYRIGHT
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index ba0c78bd1e..7a650dc3c5 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.18
+RADVD_VERSION = 2.19
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf
 # We need to ignore <linux/if_arp.h>, because radvd already includes
@@ -12,8 +12,6 @@ RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf
 RADVD_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
 	ac_cv_header_linux_if_arp_h=no
-# For 0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
-RADVD_AUTORECONF = YES
 RADVD_LICENSE = BSD-4-Clause-like
 RADVD_LICENSE_FILES = COPYRIGHT
 
-- 
2.28.0
