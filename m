From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 27 Mar 2010 14:36:21 +0100
Subject: [Buildroot] libcrypt is old..
Message-ID: <C6BCD100D28544B39631404B23D05B40@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Here is my patch for libgcrypt (against 2010-02 )
 
 
diff -rupN
buildroot-2010.02/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore
.patch
buildroot/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
---
buildroot-2010.02/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore
.patch 2010-02-26 15:52:48.000000000 +0100
+++
buildroot/package/libgcrypt/libgcrypt-00-ac_cv_sys_symbol_underscore.patch
1970-01-01 01:00:00.000000000 +0100
@@ -1,24 +0,0 @@
-diff -u libgcrypt-1.2.4.oorig/acinclude.m4 libgcrypt-1.2.4/acinclude.m4
---- libgcrypt-1.2.4.oorig/acinclude.m4 2005-07-29 15:45:48.000000000 +0200
-+++ libgcrypt-1.2.4/acinclude.m4 2007-09-19 13:33:19.000000000 +0200
-@@ -99,12 +99,14 @@
-     i386-emx-os2 | i[3456]86-pc-os2*emx | i386-pc-msdosdjgpp)
-         ac_cv_sys_symbol_underscore=yes
-         ;;
--    *)
--      if test "$cross_compiling" = yes; then
--         ac_cv_sys_symbol_underscore=yes
--      else
--         tmp_do_check="yes"
--      fi
-+    *) if test -z "$ac_cv_sys_symbol_underscore"; then
-+         if test "$cross_compiling" = yes && 
-+         then
-+           ac_cv_sys_symbol_underscore=yes
-+         else
-+           tmp_do_check="yes"
-+         fi
-+        fi
-        ;;
- esac
- if test "$tmp_do_check" = "yes"; then
diff -rupN
buildroot-2010.02/package/libgcrypt/libgcrypt-01-reconfigure.patch
buildroot/package/libgcrypt/libgcrypt-01-reconfigure.patch
--- buildroot-2010.02/package/libgcrypt/libgcrypt-01-reconfigure.patch
2010-02-26 15:52:48.000000000 +0100
+++ buildroot/package/libgcrypt/libgcrypt-01-reconfigure.patch 1970-01-01
01:00:00.000000000 +0100
@@ -1,17 +0,0 @@
---- libgcrypt-1.2.4.oorig/configure 2007-09-19 13:40:48.000000000 +0200
-+++ libgcrypt-1.2.4/configure 2007-09-19 13:41:44.000000000 +0200
-@@ -27370,12 +27370,13 @@
-     i386-emx-os2 | i345686-pc-os2*emx | i386-pc-msdosdjgpp)
-         ac_cv_sys_symbol_underscore=yes
-         ;;
--    *)
-+    *)if test -z "$ac_cv_sys_symbol_underscore";then
-       if test "$cross_compiling" = yes; then
-          ac_cv_sys_symbol_underscore=yes
-       else
-          tmp_do_check="yes"
-       fi
-+      fi
-        ;;
- esac
- if test "$tmp_do_check" = "yes"; then
diff -rupN buildroot-2010.02/package/libgcrypt/libgcrypt.mk
buildroot/package/libgcrypt/libgcrypt.mk
--- buildroot-2010.02/package/libgcrypt/libgcrypt.mk 2010-02-26
15:52:48.000000000 +0100
+++ buildroot/package/libgcrypt/libgcrypt.mk 2010-03-27 14:26:47.000000000
+0100
@@ -3,7 +3,7 @@
 # libgcrypt
 #
 #############################################################
-LIBGCRYPT_VERSION:=1.2.4
+LIBGCRYPT_VERSION:=1.4.5
 LIBGCRYPT_SOURCE:=libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
 LIBGCRYPT_DIR:=$(BUILD_DIR)/libgcrypt-$(LIBGCRYPT_VERSION)
 
 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100327/cebc53e7/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_libgcrypt.patch
Type: application/octet-stream
Size: 2758 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100327/cebc53e7/attachment.obj>
