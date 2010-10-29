From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] libglib2: bump version to 2.26.0
Message-ID: <20101029181143.5F1998D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1bbd03d8aaf22ce678e0469ca867dfcad5f494a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a mechanical bump, no other changes involved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libglib2-fix-clock-gettime-check.patch         |   14 +++++++++-----
 package/libglib2/libglib2-mkenums-nowarn.patch     |   14 ++++++++++----
 package/libglib2/libglib2-optional-ipv6.patch      |   12 ++++++------
 package/libglib2/libglib2.mk                       |    4 ++--
 4 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/package/libglib2/libglib2-fix-clock-gettime-check.patch b/package/libglib2/libglib2-fix-clock-gettime-check.patch
index da2e485..f336ea5 100644
--- a/package/libglib2/libglib2-fix-clock-gettime-check.patch
+++ b/package/libglib2/libglib2-fix-clock-gettime-check.patch
@@ -1,6 +1,6 @@
 Rework clock_gettime() test
 
-The test for clock_gettime() in configure.in doesn't work properly
+The test for clock_gettime() in configure.ac doesn't work properly
 when a previous package has loaded the shared configuration cache with
 informations about the availability of clock_gettime. A package such
 as ctorrent does so, which means that compiling ctorrent *then*
@@ -25,11 +25,15 @@ appropriate variables.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: glib-2.24.1/configure.in
+---
+ configure.ac |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+Index: glib-2.26.0/configure.ac
 ===================================================================
---- glib-2.24.1.orig/configure.in	2010-08-11 19:29:20.530916023 +0200
-+++ glib-2.24.1/configure.in	2010-08-11 19:46:41.308866269 +0200
-@@ -2392,13 +2392,14 @@
+--- glib-2.26.0.orig/configure.ac
++++ glib-2.26.0/configure.ac
+@@ -2379,13 +2379,14 @@
  	LIBS="$glib_save_LIBS"
  fi
  
diff --git a/package/libglib2/libglib2-mkenums-nowarn.patch b/package/libglib2/libglib2-mkenums-nowarn.patch
index 1ab6e37..d92183e 100644
--- a/package/libglib2/libglib2-mkenums-nowarn.patch
+++ b/package/libglib2/libglib2-mkenums-nowarn.patch
@@ -1,8 +1,14 @@
---- glib-2.6.5/gobject/glib-mkenums.in.orig	2006-06-15 21:28:23.436946024 -0600
-+++ glib-2.6.5/gobject/glib-mkenums.in	2006-06-15 21:28:35.417124760 -0600
+---
+ gobject/glib-mkenums.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: glib-2.26.0/gobject/glib-mkenums.in
+===================================================================
+--- glib-2.26.0.orig/gobject/glib-mkenums.in
++++ glib-2.26.0/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
 -#!@PERL_PATH@ -w
 +#!@PERL_PATH@
  
- # glib-mkenums.pl 
- # Information about the current enumeration
+ use File::Basename;
+ use Safe;
diff --git a/package/libglib2/libglib2-optional-ipv6.patch b/package/libglib2/libglib2-optional-ipv6.patch
index 7c511a3..8e7b418 100644
--- a/package/libglib2/libglib2-optional-ipv6.patch
+++ b/package/libglib2/libglib2-optional-ipv6.patch
@@ -5,10 +5,10 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  gio/ginetaddress.c |    9 +++++++++
  1 file changed, 9 insertions(+)
 
-Index: glib-2.22.4/gio/ginetaddress.c
+Index: glib-2.26.0/gio/ginetaddress.c
 ===================================================================
---- glib-2.22.4.orig/gio/ginetaddress.c
-+++ glib-2.22.4/gio/ginetaddress.c
+--- glib-2.26.0.orig/gio/ginetaddress.c
++++ glib-2.26.0/gio/ginetaddress.c
 @@ -21,6 +21,7 @@
   *          Samuel Cormier-Iijima <sciyoshi@gmail.com>
   */
@@ -17,7 +17,7 @@ Index: glib-2.22.4/gio/ginetaddress.c
  #include <config.h>
  
  #include <string.h>
-@@ -435,7 +436,11 @@ g_inet_address_new_from_string (const gc
+@@ -434,7 +435,11 @@
    return NULL;
  }
  
@@ -29,7 +29,7 @@ Index: glib-2.22.4/gio/ginetaddress.c
  
  /**
   * g_inet_address_new_from_bytes:
-@@ -484,8 +489,10 @@ g_inet_address_new_loopback (GSocketFami
+@@ -483,8 +488,10 @@
  
        return g_inet_address_new_from_bytes (addr, family);
      }
@@ -40,7 +40,7 @@ Index: glib-2.22.4/gio/ginetaddress.c
  }
  
  /**
-@@ -511,8 +518,10 @@ g_inet_address_new_any (GSocketFamily fa
+@@ -510,8 +517,10 @@
  
        return g_inet_address_new_from_bytes (addr, family);
      }
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 61e8c1c..1468af1 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.24
-LIBGLIB2_VERSION_MINOR = 1
+LIBGLIB2_VERSION_MAJOR = 2.26
+LIBGLIB2_VERSION_MINOR = 0
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.7.1
