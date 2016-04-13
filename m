From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:39:09 +0200
Subject: [Buildroot] [git commit] libuv: bump to version 1.9.0
Message-ID: <20160413193920.87325800F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=922e9df4f92be10e4849de9229e74880350f2383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove uClibc-ng patch applied upstream [1].

[1] https://github.com/libuv/libuv/commit/c8619721404c2a9f97adc34a8c3b5336317311bc

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-unix-fix-support-for-uClibc-ng.patch      | 30 ----------------------
 package/libuv/libuv.hash                           |  2 +-
 package/libuv/libuv.mk                             |  2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/package/libuv/0001-unix-fix-support-for-uClibc-ng.patch b/package/libuv/0001-unix-fix-support-for-uClibc-ng.patch
deleted file mode 100644
index 6aec436..0000000
--- a/package/libuv/0001-unix-fix-support-for-uClibc-ng.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 21dcb3a98feb3ae6ba862cfbf25fba3361bc8a9b Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Mon, 14 Dec 2015 21:46:17 +0000
-Subject: [PATCH] unix: fix support for uClibc-ng
-
-uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
-version test so that HAVE_IFADDRS_H is defined for uClibc versions
-after v0.9.32.
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- src/unix/linux-core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unix/linux-core.c b/src/unix/linux-core.c
-index 3ff6fb1..4735bc4 100644
---- a/src/unix/linux-core.c
-+++ b/src/unix/linux-core.c
-@@ -39,7 +39,7 @@
- #define HAVE_IFADDRS_H 1
- 
- #ifdef __UCLIBC__
--# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
-+# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
- #  undef HAVE_IFADDRS_H
- # endif
- #endif
--- 
-2.5.0
-
diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index abbbb0c..9758d76 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 906e1a5c673c95cb261adeacdb7308a65b4a8f7c9c50d85f3021364951fa9cde  libuv-v1.8.0.tar.gz
+sha256  f8b8272a0d80138b709d38fad2baf771899eed61e7f9578d17898b07a1a2a5eb  libuv-v1.9.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index bf1dead..45b301f 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.8.0
+LIBUV_VERSION = v1.9.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
