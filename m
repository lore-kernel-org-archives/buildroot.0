From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 9 Jan 2011 22:52:14 +0100
Subject: [Buildroot] [PATCH 1/1] add new package : GNU Scientific Library
Message-ID: <B1F40891A0554597B22DB61CA2FC21CC@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
Adding the GNU scientific library to buildroot    packages->   libraries ->
other
Regards Johan
 
 
 
--- buildroot-2010.11/package/Config.in 2010-11-30 16:52:43.000000000 +0100
+++ buildroot/package/Config.in 2011-01-09 22:12:09.000000000 +0100
@@ -322,6 +322,7 @@ source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
 source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
+source "package/libgsl/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
 
 
 
diff -rupN buildroot-2010.11/package/libgsl/Config.in
buildroot/package/libgsl/Config.in
--- buildroot-2010.11/package/libgsl/Config.in 1970-01-01 01:00:00.000000000
+0100
+++ buildroot/package/libgsl/Config.in 2011-01-09 22:27:03.000000000 +0100
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBGSL
+ bool "libgsl"
+ help
+   The gnu scientific library 
+   http://www.gnu.org/software/gsl
diff -rupN buildroot-2010.11/package/libgsl/gsl.mk
buildroot/package/libgsl/gsl.mk
--- buildroot-2010.11/package/libgsl/gsl.mk 1970-01-01 01:00:00.000000000
+0100
+++ buildroot/package/libgsl/gsl.mk 2011-01-09 22:11:37.000000000 +0100
@@ -0,0 +1,12 @@
+#############################################################
+#
+# gnu gsl
+#
+#############################################################
+LIBGSL_VERSION=1.14
+LIBGSL_SOURCE=gsl-$(LIBGSL_VERSION).tar.gz
+LIBGSL_SITE=ftp://ftp.gnu.org/gnu/gsl/
+LIBGSL_INSTALL_STAGING = YES
+
+
+$(eval $(call AUTOTARGETS,package,libgsl))
