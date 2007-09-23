From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 23 Sep 2007 07:12:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070923141259.2E51730092@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-23 07:12:58 -0700 (Sun, 23 Sep 2007)
New Revision: 19970

Log:
- search env for BUILDROOT_CONFIG for use as a config file; defaults to .config


Modified:
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch


Changeset:
Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2007-09-23 14:06:59 UTC (rev 19969)
+++ trunk/buildroot/package/config/confdata.c	2007-09-23 14:12:58 UTC (rev 19970)
@@ -37,7 +37,7 @@
 
 const char *conf_get_configname(void)
 {
-	char *name = getenv("KCONFIG_CONFIG");
+	char *name = getenv("BUILDROOT_CONFIG");
 
 	return name ? name : ".config";
 }

Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-23 14:06:59 UTC (rev 19969)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-23 14:12:58 UTC (rev 19970)
@@ -1292,3 +1292,14 @@
  		     "\t$(deps_config)\n\n"
  		     "$(deps_config): ;\n");
  	fclose(out);
+--- kernel-config/confdata.c	2007-09-23 15:33:26.000000000 +0200
++++ config/confdata.c	2007-09-23 16:10:52.000000000 +0200
+@@ -37,7 +37,7 @@
+ 
+ const char *conf_get_configname(void)
+ {
+-	char *name = getenv("KCONFIG_CONFIG");
++	char *name = getenv("BUILDROOT_CONFIG");
+ 
+ 	return name ? name : ".config";
+ }
