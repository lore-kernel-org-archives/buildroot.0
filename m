From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 15:38:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070628223849.1B6BFA6107@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 15:38:48 -0700 (Thu, 28 Jun 2007)
New Revision: 18968

Log:
- fix make defconfig (Rick Foos)


Modified:
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch


Changeset:
Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2007-06-28 17:13:51 UTC (rev 18967)
+++ trunk/buildroot/package/config/confdata.c	2007-06-28 22:38:48 UTC (rev 18968)
@@ -21,7 +21,7 @@
 static const char *conf_filename;
 static int conf_lineno, conf_warnings, conf_unsaved;
 
-const char conf_defname[] = "extra/Configs/defconfigs/$ARCH";
+const char conf_defname[] = ".defconfig";
 
 static void conf_warning(const char *fmt, ...)
 {

Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-06-28 17:13:51 UTC (rev 18967)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-06-28 22:38:48 UTC (rev 18968)
@@ -652,3 +652,16 @@
  
  #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
+Index: confdata.c
+===================================================================
+--- kconfig/confdata.c	(revision 18967)
++++ /Buildroot/confdata.c	(working copy)
+@@ -21,7 +21,7 @@ static void conf_warning(const char *fmt
+ static const char *conf_filename;
+ static int conf_lineno, conf_warnings, conf_unsaved;
+ 
+-const char conf_defname[] = "extra/Configs/defconfigs/$ARCH";
++const char conf_defname[] = ".defconfig";
+ 
+ static void conf_warning(const char *fmt, ...)
+ {
