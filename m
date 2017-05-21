From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 17:21:04 +0200
Subject: [Buildroot] [PATCH/next] package/apr: bump version to 1.5.2
Message-ID: <20170521152104.10126-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0001 and changed _SOURCE to .tar.bz2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr/0001-cross-compile.patch | 6 +++---
 package/apr/apr.hash                 | 4 ++--
 package/apr/apr.mk                   | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/apr/0001-cross-compile.patch b/package/apr/0001-cross-compile.patch
index 5b596fb20..559ebb74b 100644
--- a/package/apr/0001-cross-compile.patch
+++ b/package/apr/0001-cross-compile.patch
@@ -42,10 +42,10 @@ diff -uNr apr-1.5.1.org/Makefile.in apr-1.5.1/Makefile.in
  
  # get substituted into some targets
  APR_MAJOR_VERSION=@APR_MAJOR_VERSION@
-@@ -134,8 +136,13 @@
+@@ -134,8 +134,13 @@
+ 	$(APR_MKDIR) tools
+ 	$(LT_COMPILE)
  
- OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
- tools/gen_test_char.lo: make_tools_dir
 +ifdef CC_FOR_BUILD
 +tools/gen_test_char at EXEEXT@: tools/gen_test_char.c $(LOCAL_LIBS)
 +	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -DCROSS_COMPILE -o $@ $<
diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 50d657a8c..917ce5627 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,2 +1,2 @@
-# From http://archive.apache.org/dist/apr/apr-1.5.1.tar.gz.sha1
-sha1	9caa83e3f50f3abc9fab7c4a3f2739a12b14c3a3	apr-1.5.1.tar.gz
+# From http://archive.apache.org/dist/apr/apr-1.5.2.tar.bz2.sha1
+sha1 6d757fcf7c687fc300c1066076f2e8380ff8cbc0  apr-1.5.2.tar.bz2
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index f09f94368..4a97f7e65 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-APR_VERSION = 1.5.1
+APR_VERSION = 1.5.2
+APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
-- 
2.11.0
