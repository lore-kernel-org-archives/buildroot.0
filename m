From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  7 Mar 2021 12:28:16 +0100
Subject: [Buildroot] [PATCH] package/nettle: bump to version 3.7.1
Message-ID: <20210307112816.1283116-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nettle/0001-disable-testsuite-examples.patch | 4 ++--
 package/nettle/Config.in                             | 2 +-
 package/nettle/nettle.hash                           | 4 ++--
 package/nettle/nettle.mk                             | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nettle/0001-disable-testsuite-examples.patch b/package/nettle/0001-disable-testsuite-examples.patch
index 82d97d5d2..aa37bcf8f 100644
--- a/package/nettle/0001-disable-testsuite-examples.patch
+++ b/package/nettle/0001-disable-testsuite-examples.patch
@@ -9,9 +9,9 @@ Signed-off-by:  "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN nettle-2.7.1.orig/Makefile.in nettle-2.7.1/Makefile.in
 --- nettle-2.7.1.orig/Makefile.in	2013-05-28 16:21:54.000000000 +0200
 +++ nettle-2.7.1/Makefile.in	2014-12-12 19:57:12.499805574 +0100
-@@ -16,7 +16,7 @@
+@@ -19,7 +19,7 @@
  
- OPT_ASM_SOURCES = @OPT_ASM_SOURCES@
+ FAT_TEST_LIST = @FAT_TEST_LIST@
  
 -SUBDIRS = tools testsuite examples
 +SUBDIRS = tools
diff --git a/package/nettle/Config.in b/package/nettle/Config.in
index 489097012..cf4803c7b 100644
--- a/package/nettle/Config.in
+++ b/package/nettle/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_NETTLE
 	  object-oriented languages, in applications like LSH or
 	  GNUPG, or even in kernel space
 
-	  http://www.lysator.liu.se/~nisse/nettle/
+	  https://www.lysator.liu.se/~nisse/nettle/
diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 1bbc1c6d2..5fd69200b 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.6.tar.gz.sig
-sha256  d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1  nettle-3.6.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.7.1.tar.gz.sig
+sha256  156621427c7b00a75ff9b34b770b95d34f80ef7a55c3407de94b16cbf436c42e  nettle-3.7.1.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index fef68375d..dc76fc21f 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.6
+NETTLE_VERSION = 3.7.1
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.27.0
