From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 05:24:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20070919122408.6EC48A6064@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 05:24:07 -0700 (Wed, 19 Sep 2007)
New Revision: 19889

Log:
- do away with SUSv3 legacy functions


Added:
   trunk/buildroot/package/vpnc/vpnc-0.5.1-susv3-legacy.patch


Changeset:
Added: trunk/buildroot/package/vpnc/vpnc-0.5.1-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/vpnc/vpnc-0.5.1-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/vpnc/vpnc-0.5.1-susv3-legacy.patch	2007-09-19 12:24:07 UTC (rev 19889)
@@ -0,0 +1,12 @@
+diff -rdup vpnc-0.5.1.oorig/config.c vpnc-0.5.1/config.c
+--- vpnc-0.5.1.oorig/config.c	2007-09-10 22:39:48.000000000 +0200
++++ vpnc-0.5.1/config.c	2007-09-19 14:19:46.000000000 +0200
+@@ -538,7 +538,7 @@ static char *get_config_filename(const c
+ {
+ 	char *realname;
+ 	
+-	asprintf(&realname, "%s%s%s", index(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
++	asprintf(&realname, "%s%s%s", strchr(name, '/') ? "" : "/etc/vpnc/", name, add_dot_conf ? ".conf" : "");
+ 	return realname;
+ }
+ 
