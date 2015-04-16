From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:13:11 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 2.11
Message-ID: <20150416061335.C3AB98184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d140d14ebb961891034c5cb988f79f9d32bd7c9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No longer needs check (hence the patch) to build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-check-requirement-we-don-t-do-unit-tests.patch |   29 --------------------
 package/radvd/radvd.hash                           |    4 +-
 package/radvd/radvd.mk                             |    2 +-
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch b/package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch
deleted file mode 100644
index 0bbbf28..0000000
--- a/package/radvd/0001-Drop-check-requirement-we-don-t-do-unit-tests.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2074114cef857f95104367c51ac9367082fc8060 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 23 Nov 2014 12:16:32 +0100
-Subject: [PATCH 1/3] Drop check requirement, we don't do unit tests
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 59b18a8..5dde3b2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,10 +50,6 @@ dnl Determine CC and preset CFLAGS
- AC_PROG_CC_C99
- AC_PROG_RANLIB
- 
--if test "$arch" = "linux" ; then
--PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
--fi
--
- dnl Determine of netlink is available
- AC_MSG_CHECKING(netlink)
- AC_TRY_COMPILE([
--- 
-2.1.0
-
diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index fe777d5..7324c31 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,2 +1,2 @@
-# From http://www.litech.org/radvd/dist/radvd-2.10.tar.gz.sha256
-sha256	76ceee8304120ae42cc38d03dd720a3db94a57e459f3184254fa523367fb9773	radvd-2.10.tar.xz
+# From http://www.litech.org/radvd/dist/radvd-2.11.tar.gz.sha256
+sha256	04636288fc79fa151260eeb2bea1b05942f59c31f01358c57f930a4eb45b5acc	radvd-2.11.tar.xz
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 184cf7a..872eac0 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.10
+RADVD_VERSION = 2.11
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
