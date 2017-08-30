From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:31:50 +0200
Subject: [Buildroot] [git commit branch/next] uclibc-ng-test: update to
	latest
Message-ID: <20170830212430.57922820F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f80572547038373ff58d2e7a0c89f9c014d12e22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../uclibc-ng-test/0001-disable-for-glibc.patch    | 40 ----------------------
 package/uclibc-ng-test/uclibc-ng-test.mk           |  2 +-
 2 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/package/uclibc-ng-test/0001-disable-for-glibc.patch b/package/uclibc-ng-test/0001-disable-for-glibc.patch
deleted file mode 100644
index 13786c9..0000000
--- a/package/uclibc-ng-test/0001-disable-for-glibc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 787e584f18afc967d91cfe1a8443df2657579ecb Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 12 May 2017 00:44:01 +0200
-Subject: [PATCH] disable for glibc
-
-uclibc-ng-test is broken with glibc 2.25 due to pthread_cond_t changes introduced by [1].
-Disable test-cond22 for glibc based toolchain.
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed19993b5b0d05d62cc883571519a67dae481a14
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- test/nptl/tst-cond22.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/test/nptl/tst-cond22.c b/test/nptl/tst-cond22.c
-index 3255cc0..23697dd 100644
---- a/test/nptl/tst-cond22.c
-+++ b/test/nptl/tst-cond22.c
-@@ -2,7 +2,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- 
--#if defined(__GLIBC__) || defined(__UCLIBC__)
-+#if defined(__UCLIBC__)
- static pthread_barrier_t b;
- static pthread_cond_t c = PTHREAD_COND_INITIALIZER;
- static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
-@@ -54,7 +54,7 @@ tf (void *arg)
- static int
- do_test (void)
- {
--#if defined(__GLIBC__) || defined(__UCLIBC__)
-+#if defined(__UCLIBC__)
-   int status = 0;
- 
-   if (pthread_barrier_init (&b, NULL, 2) != 0)
--- 
-2.9.3
-
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 93736ed..3fdfe37 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = c9b9876cefc142a23aa622b821290ed16af80058
+UCLIBC_NG_TEST_VERSION = c4d54bde7772b55df04399ecb355769c5ac31015
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPL-2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
