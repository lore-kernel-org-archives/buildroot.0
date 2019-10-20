From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:15:35 +0200
Subject: [Buildroot] [git commit] package/libdvdnav: bump version to 6.0.1
Message-ID: <20191020133507.8FBCB82BCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baaf6786cbe49ac18ad164184dbc061f5301de8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://code.videolan.org/videolan/libdvdnav/blob/master/ChangeLog

Removed patch after upstream added a different detection code for OS/2:
https://code.videolan.org/videolan/libdvdnav/commit/ed3d4c31e16d976b8b95822570d7ea1f921e26ac

Build-tested using
support/config-fragments/autobuild/br-nios2-glibc.config

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdvdnav/0001-do-not-match-nios2-as-os2.patch | 16 ----------------
 package/libdvdnav/libdvdnav.hash                       |  8 ++++++--
 package/libdvdnav/libdvdnav.mk                         |  4 +---
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/package/libdvdnav/0001-do-not-match-nios2-as-os2.patch b/package/libdvdnav/0001-do-not-match-nios2-as-os2.patch
deleted file mode 100644
index 27030bb239..0000000000
--- a/package/libdvdnav/0001-do-not-match-nios2-as-os2.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix misdetection while nios2 cross-compile
-
-Signed-off-bye: Waldemar Brodkorb <wbx@openadk.org>
- 
-diff -Nur libdvdnav-5.0.3.orig/configure.ac libdvdnav-5.0.3/configure.ac
---- libdvdnav-5.0.3.orig/configure.ac	2015-01-27 16:57:43.000000000 +0100
-+++ libdvdnav-5.0.3/configure.ac	2016-07-31 11:48:09.312947473 +0200
-@@ -73,7 +73,7 @@
-   [*mingw32* | *cygwin*], [AC_CHECK_FUNCS(gettimeofday)])
- 
- AS_CASE([$host],
--  [*os2*], [LDFLAGS="$LDFLAGS -no-undefined"])
-+  [*-os2*], [LDFLAGS="$LDFLAGS -no-undefined"])
- 
- dnl ---------------------------------------------
- dnl threads
diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index c251d0af27..8de6debfeb 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,5 +1,9 @@
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.0/libdvdnav-6.0.0.tar.bz2.sha256
-sha256	f0a2711b08a021759792f8eb14bb82ff8a3c929bf88c33b64ffcddaa27935618	libdvdnav-6.0.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.1/libdvdnav-6.0.1.tar.bz2.md5
+md5 3a28d2cc7e25c1cbcb06443f3114f0b1 libdvdnav-6.0.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.1/libdvdnav-6.0.1.tar.bz2.sha1
+sha1 258b82156e13803f2b0dbaec74e15475b4341d2f libdvdnav-6.0.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdnav/6.0.1/libdvdnav-6.0.1.tar.bz2.sha256
+sha256 e566a396f1950017088bfd760395b0565db44234195ada5413366c9d23926733 libdvdnav-6.0.1.tar.bz2
 
 # Hash for license file:
 sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 549a31829f..450f8f687d 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 6.0.0
+LIBDVDNAV_VERSION = 6.0.1
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 LIBDVDNAV_LICENSE = GPL-2.0+
 LIBDVDNAV_LICENSE_FILES = COPYING
-# 0001-do-not-match-nios2-as-os2.patch
-LIBDVDNAV_AUTORECONF = YES
 
 $(eval $(autotools-package))
