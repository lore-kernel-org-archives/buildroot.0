From: Karoly Kasza <kaszak@gmail.com>
Date: Wed, 17 Jun 2015 10:22:08 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: introduce SUBDIR variable
	and update patches
Message-ID: <1434529328-115195-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Open-vm-tools package is now distributed from GitHub and a new
subdirectory was introduced, which breaks the Buildroot process.

This patch adds the _SUBDIR variable in the Makefile and also updates
all distributed patches.

Fixes:

http://autobuild.buildroot.net/results/bfd10c8d454a2686ebb1c4afdb49c55e39a9dd67/

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/openvmtools/0001-has_bsd_printf.patch       |  4 ++--
 package/openvmtools/0002-no_cflags_werror.patch     | 11 ++++++-----
 package/openvmtools/0003-dont-force-cppflags.patch  |  5 ++---
 package/openvmtools/0004-uclibc_secure_getenv.patch |  4 ++--
 package/openvmtools/openvmtools.mk                  |  1 +
 5 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/openvmtools/0001-has_bsd_printf.patch b/package/openvmtools/0001-has_bsd_printf.patch
index 889f7d1..df23f00 100644
--- a/package/openvmtools/0001-has_bsd_printf.patch
+++ b/package/openvmtools/0001-has_bsd_printf.patch
@@ -6,8 +6,8 @@ this case, and they break compilation.
 
 Signed-off-by: Karoly Kasza <kaszak@gmail.com>
 
---- open-vm-tools-9.4.6-1770165.orig/lib/misc/msgList.c	2014-07-02 00:21:14.000000000 +0200
-+++ open-vm-tools-9.4.6-1770165/lib/misc/msgList.c	2014-07-29 13:40:40.000000000 +0200
+--- openvmtools-stable-9.10.0.orig/open-vm-tools/lib/misc/msgList.c	2015-06-17 10:01:00.000000000 +0200
++++ openvmtools-stable-9.10.0/open-vm-tools/lib/misc/msgList.c		2015-06-17 10:01:00.000000000 +0200
 @@ -487,6 +487,7 @@
     return messages->id;
  }
diff --git a/package/openvmtools/0002-no_cflags_werror.patch b/package/openvmtools/0002-no_cflags_werror.patch
index 96bd355..1621574 100644
--- a/package/openvmtools/0002-no_cflags_werror.patch
+++ b/package/openvmtools/0002-no_cflags_werror.patch
@@ -4,14 +4,15 @@ Disable the mandatory flag -Werror in configure.ac.
 
 Signed-off-by: Karoly Kasza <kaszak@gmail.com>
 
---- open-vm-tools-9.4.6-1770165.orig/configure.ac	2014-07-02 00:21:14.000000000 +0200
-+++ open-vm-tools-9.4.6-1770165/configure.ac	2014-09-15 16:03:47.565900402 +0200
-@@ -832,7 +832,7 @@
+--- openvmtools-stable-9.10.0.orig/open-vm-tools/configure.ac	2015-06-17 10:02:00.000000000 +0200
++++ openvmtools-stable-9.10.0/open-vm-tools/configure.ac	2015-06-17 10:02:00.000000000 +0200
+@@ -935,7 +935,7 @@
  
  ### General flags / actions
  CFLAGS="$CFLAGS -Wall"
 -CFLAGS="$CFLAGS -Werror"
 +# CFLAGS="$CFLAGS -Werror"
  
- # -Wno-unknown-pragmas is due to gcc not understanding '#pragma ident' in Xlib.h on OpenSolaris.
- for TEST_CFLAG in -Wno-pointer-sign -Wno-unused-value -fno-strict-aliasing \
+ # -Wno-unknown-pragmas is due to gcc not understanding '#pragma ident'
+ # in Xlib.h on OpenSolaris.
+
diff --git a/package/openvmtools/0003-dont-force-cppflags.patch b/package/openvmtools/0003-dont-force-cppflags.patch
index 8f904b1..c8fa6b1 100644
--- a/package/openvmtools/0003-dont-force-cppflags.patch
+++ b/package/openvmtools/0003-dont-force-cppflags.patch
@@ -4,9 +4,8 @@ This is so horribly broken for cross-compilation. :-(
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-diff -durN openvmtools-9.4.6-1770165.orig/m4/vmtools.m4 openvmtools-9.4.6-1770165/m4/vmtools.m4
---- openvmtools-9.4.6-1770165.orig/m4/vmtools.m4	2014-07-02 00:21:14.000000000 +0200
-+++ openvmtools-9.4.6-1770165/m4/vmtools.m4	2014-09-21 12:39:15.901659888 +0200
+--- openvmtools-stable-9.10.0.orig/open-vm-tools/m4/vmtools.m4	2015-06-17 10:03:00.000000000 +0200
++++ openvmtools-stable-9.10.0/open-vm-tools/m4/vmtools.m4	2015-06-17 10:03:00.000000000 +0200
 @@ -281,10 +281,10 @@
        if test "$os" = freebsd; then
           CUSTOM_$1_CPPFLAGS="-I/usr/local/include"
diff --git a/package/openvmtools/0004-uclibc_secure_getenv.patch b/package/openvmtools/0004-uclibc_secure_getenv.patch
index 28cfdc4..6fb9ebd 100644
--- a/package/openvmtools/0004-uclibc_secure_getenv.patch
+++ b/package/openvmtools/0004-uclibc_secure_getenv.patch
@@ -5,8 +5,8 @@ Android method.
 
 Signed-off-by: Karoly Kasza <kaszak@gmail.com>
 
---- open-vm-tools-9.10.0-2476743.orig/lib/misc/idLinux.c	2015-03-29 12:19:30.776922510 +0200
-+++ open-vm-tools-9.10.0-2476743/lib/misc/idLinux.c	2015-03-29 12:30:30.000000000 +0200
+--- openvmtools-stable-9.10.0.orig/open-vm-tools/lib/misc/idLinux.c	2015-06-17 10:04:00.000000000 +0200
++++ openvmtools-stable-9.10.0/open-vm-tools/lib/misc/idLinux.c		2015-06-17 10:04:00.000000000 +0200
 @@ -997,7 +997,7 @@
  static Bool
  IdIsSetUGid(void)
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 822bbf1..9819640 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -10,6 +10,7 @@ OPENVMTOOLS_LICENSE = LGPLv2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
 # Autoreconf needed or config/missing will run configure again at buildtime
 OPENVMTOOLS_AUTORECONF = YES
+OPENVMTOOLS_SUBDIR = open-vm-tools
 OPENVMTOOLS_CONF_OPTS = --with-dnet \
 	--without-icu --without-x --without-gtk2 \
 	--without-gtkmm --without-kernel-modules \
-- 
2.1.4
