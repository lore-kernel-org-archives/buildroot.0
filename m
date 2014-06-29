From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Jun 2014 10:23:52 -0300
Subject: [Buildroot] [PATCH 1/2] alsa-lib: bump to version 1.0.28
Message-ID: <1404048233-6166-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-lib/alsa-lib-0002-no-mmu.patch | 7 ++++---
 package/alsa-lib/alsa-lib.mk                | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/alsa-lib/alsa-lib-0002-no-mmu.patch b/package/alsa-lib/alsa-lib-0002-no-mmu.patch
index 317676a..2ae0f67 100644
--- a/package/alsa-lib/alsa-lib-0002-no-mmu.patch
+++ b/package/alsa-lib/alsa-lib-0002-no-mmu.patch
@@ -1,11 +1,12 @@
 Don't use fork() on noMMU platforms
 
+[Gustavo: update patch for 1.0.28]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: alsa-lib-1.0.26/configure.in
+Index: alsa-lib-1.0.26/configure.ac
 ===================================================================
---- alsa-lib-1.0.26.orig/configure.in	2012-09-06 10:55:14.000000000 +0200
-+++ alsa-lib-1.0.26/configure.in	2013-03-09 16:22:08.000000000 +0100
+--- alsa-lib-1.0.26.orig/configure.ac	2012-09-06 10:55:14.000000000 +0200
++++ alsa-lib-1.0.26/configure.ac	2013-03-09 16:22:08.000000000 +0100
 @@ -66,6 +66,8 @@
  AM_CONDITIONAL(ALSA_HSEARCH_R, [test "x$HAVE_HSEARCH_R" != xyes])
  AC_CHECK_FUNCS([uselocale])
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index d7aacb6..ce5996c 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.0.26
+ALSA_LIB_VERSION = 1.0.28
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = http://alsa.cybermirror.org/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
-- 
1.8.5.5
