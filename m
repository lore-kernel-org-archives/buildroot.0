From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri,  2 Aug 2019 22:42:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/libevent: bump to version 2.1.11
Message-ID: <1564778524-13155-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/libevent/libevent/releases

Also remove upstreamed patch (already in version)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...event_openssl.m4-fix-detection-of-openssl.patch | 36 ----------------------
 package/libevent/libevent.hash                     |  4 +--
 package/libevent/libevent.mk                       |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch

diff --git a/package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch b/package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch
deleted file mode 100644
index 0724135..0000000
--- a/package/libevent/0002-m4-libevent_openssl.m4-fix-detection-of-openssl.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0374b55942e533a3c3997439481a8d05d6c8f729 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 Jun 2019 23:44:37 +0200
-Subject: [PATCH] m4/libevent_openssl.m4: fix detection of openssl
-
-Since commit 506df426dbeb0187bbd3654bd286b4100628fb16, OPENSSL_INCS is
-added to CPPFLAGS without any white space, as a result openssl detection
-fails on:
-configure:10395: checking openssl/ssl.h usability
-configure:10395: /home/fabrice/buildroot-test/buildroot/output/host/bin/riscv32-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64-I/home/fabrice/buildroot-test/buildroot/output/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/include  conftest.c >&5
-<command-line>:0:0: warning: "_FILE_OFFSET_BITS" redefined
-<command-line>:0:0: note: this is the location of the previous definition
-<command-line>:0:23: error: division by zero in #if
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libevent/libevent/pull/830]
----
- m4/libevent_openssl.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/libevent_openssl.m4 b/m4/libevent_openssl.m4
-index 7b458134..19811981 100644
---- a/m4/libevent_openssl.m4
-+++ b/m4/libevent_openssl.m4
-@@ -40,7 +40,7 @@ case "$enable_openssl" in
- 	;;
-     esac
-     CPPFLAGS_SAVE=$CPPFLAGS
--    CPPFLAGS+=$OPENSSL_INCS
-+    CPPFLAGS="$CPPFLAGS $OPENSSL_INCS"
-     AC_CHECK_HEADERS([openssl/ssl.h], [], [have_openssl=no])
-     CPPFLAGS=$CPPFLAGS_SAVE
-     AC_SUBST(OPENSSL_INCS)
--- 
-2.20.1
-
diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 8933197..7bcb381 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,4 +1,4 @@
 # locally computed
-md5	f3eeaed018542963b7d2416ef1135ecc	libevent-2.1.8-stable.tar.gz
-sha1	609b14bd2eeb3b48272b607656fa9e1d3318c5e2	libevent-2.1.10-stable.tar.gz
+md5	7f35cfe69b82d879111ec0d7b7b1c531	libevent-2.1.11-stable.tar.gz
+sha1	a76bba0a281da9384d4be5b40f3907c07e21428c	libevent-2.1.11-stable.tar.gz
 sha256	ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670	LICENSE
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 1d4cd26..f4d2a4c 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.1.10
+LIBEVENT_VERSION = 2.1.11
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
-- 
2.7.4
