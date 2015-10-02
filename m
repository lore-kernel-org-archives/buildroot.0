From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 10:43:48 -0300
Subject: [Buildroot] [PATCH 1/2] cpio: bump to version 2.12
Message-ID: <1443793429-3117-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All patches upstream so drop them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cpio/cpio.hash | 9 +--------
 package/cpio/cpio.mk   | 8 +-------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index c52e86a..962a100 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,9 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978	cpio-2.11.tar.gz
-
-# Locally calculated
-sha256 903fb87e00813daf257be5d1680ad93770d320c707ab2ec345486958b2e8a21f cpio-2.11-stdio.in.patch
-sha256 6b6505a97dda75d24627d9ba461b45ab9ea4764e1a2788d6986eb2978434f25d cpio-2.11-CVE-2014-9112.patch
-sha256 0cf7c9749f1c1610aaf46e17eacd6614c5ef8c2114236bcdd08d53e929020ae5 cpio-2.11-testsuite-CVE-2014-9112.patch
-sha256 f1f587f70a38363691cbd4dfe89f962c8c57266277f0fbc781910c6a7065be7e cpio-2.11-check_for_symlinks-CVE-2015-1197.patch
-sha256 b3d317e3c5705d7f9e503f56540baf3cb6dd1d0e9be0261151a5b08378c2d98c cpio-2.11-stat.patch
+sha256	08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73	cpio-2.12.tar.gz
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index c29305e..ca8463e 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -4,16 +4,10 @@
 #
 ################################################################################
 
-CPIO_VERSION = 2.11
+CPIO_VERSION = 2.12
 CPIO_SITE = http://ftp.gnu.org/gnu/cpio
 CPIO_LICENSE = GPLv3+
 CPIO_LICENSE_FILES = COPYING
-CPIO_PATCH = \
-	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-stdio.in.patch \
-	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-CVE-2014-9112.patch \
-	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-testsuite-CVE-2014-9112.patch \
-	https://projects.archlinux.org/svntogit/packages.git/plain/cpio/trunk/cpio-2.11-check_for_symlinks-CVE-2015-1197.patch \
-	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/cpio/files/cpio-2.11-stat.patch
 
 # cpio uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this.
-- 
2.4.9
