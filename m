From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 13 Jan 2009 21:02:44 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: atk iptables
	java/classpath java/jamvm
Message-ID: <20090113210244.C2A7E76C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-13 21:02:43 +0000 (Tue, 13 Jan 2009)
New Revision: 24823

Log:
Use HOST_GLIB for glib installation instead of /usr/bin

Modified:
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/iptables/iptables.mk
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/jamvm/jamvm.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-01-13 18:45:19 UTC (rev 24822)
+++ trunk/buildroot/package/atk/atk.mk	2009-01-13 21:02:43 UTC (rev 24823)
@@ -54,6 +54,8 @@
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
+ATK_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
+
 ATK_DEPENDENCIES = libglib2 pkgconfig
 
 $(eval $(call AUTOTARGETS,package,atk))

Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2009-01-13 18:45:19 UTC (rev 24822)
+++ trunk/buildroot/package/iptables/iptables.mk	2009-01-13 21:02:43 UTC (rev 24823)
@@ -13,6 +13,6 @@
 IPTABLES_AUTORECONF = YES
 IPTABLES_DEPENDENCIES =
 IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR)
-IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=/usr/bin/glib-genmarshal GLIB_MKENUMS=/usr/bin
+IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,iptables))

Modified: trunk/buildroot/package/java/classpath/classpath.mk
===================================================================
--- trunk/buildroot/package/java/classpath/classpath.mk	2009-01-13 18:45:19 UTC (rev 24822)
+++ trunk/buildroot/package/java/classpath/classpath.mk	2009-01-13 21:02:43 UTC (rev 24823)
@@ -41,7 +41,7 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
 

Modified: trunk/buildroot/package/java/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/java/jamvm/jamvm.mk	2009-01-13 18:45:19 UTC (rev 24822)
+++ trunk/buildroot/package/java/jamvm/jamvm.mk	2009-01-13 21:02:43 UTC (rev 24823)
@@ -39,7 +39,7 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
 JAMVM_CONF_OPT = \
