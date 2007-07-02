From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  2 Jul 2007 07:35:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070702143512.92007A67F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-02 07:35:11 -0700 (Mon, 02 Jul 2007)
New Revision: 18992

Log:
- forgot to write out the .config.cmd


Modified:
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch


Changeset:
Modified: trunk/buildroot/package/config/confdata.c
===================================================================
--- trunk/buildroot/package/config/confdata.c	2007-07-02 09:54:18 UTC (rev 18991)
+++ trunk/buildroot/package/config/confdata.c	2007-07-02 14:35:11 UTC (rev 18992)
@@ -649,11 +649,9 @@
 	time_t now;
 	int i, l;
 
-	return 0;
-
 	sym_clear_all_valid();
 
-	file_write_dep("include/config/auto.conf.cmd");
+	file_write_dep(".config.cmd");
 
 	if (conf_split_config())
 		return 1;

Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-07-02 09:54:18 UTC (rev 18991)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-07-02 14:35:11 UTC (rev 18992)
@@ -177,15 +177,6 @@
  				break;
  			}
  		}
-@@ -655,6 +649,8 @@ int conf_write_autoconf(void)
- 	time_t now;
- 	int i, l;
- 
-+	return 0;
-+
- 	sym_clear_all_valid();
- 
- 	file_write_dep("include/config/auto.conf.cmd");
 @@ -672,22 +668,19 @@ int conf_write_autoconf(void)
  		return 1;
  	}
@@ -665,3 +656,14 @@
  
  static void conf_warning(const char *fmt, ...)
  {
+--- kconfig/config/confdata.c	2007-07-02 16:07:19.000000000 +0200
++++ Buildroot/config/confdata.c	2007-07-02 16:05:21.000000000 +0200
+@@ -651,7 +651,7 @@ int conf_write_autoconf(void)
+ 
+ 	sym_clear_all_valid();
+ 
+-	file_write_dep("include/config/auto.conf.cmd");
++	file_write_dep(".config.cmd");
+ 
+ 	if (conf_split_config())
+ 		return 1;
