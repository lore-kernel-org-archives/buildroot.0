From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 13 Dec 2008 03:52:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20081213115254.A14C63C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-13 03:52:54 -0800 (Sat, 13 Dec 2008)
New Revision: 24403

Log:
menuconfig: don't prepend CONFIG_ to symbols in help text

Modified:
   trunk/buildroot/package/config/mconf.c


Changeset:
Modified: trunk/buildroot/package/config/mconf.c
===================================================================
--- trunk/buildroot/package/config/mconf.c	2008-12-13 11:01:21 UTC (rev 24402)
+++ trunk/buildroot/package/config/mconf.c	2008-12-13 11:52:54 UTC (rev 24403)
@@ -743,7 +743,7 @@
 	if (menu_has_help(menu))
 	{
 		if (sym->name) {
-			str_printf(&help, "CONFIG_%s:\n\n", sym->name);
+			str_printf(&help, "%s:\n\n", sym->name);
 			str_append(&help, _(menu_get_help(menu)));
 			str_append(&help, "\n");
 		}
