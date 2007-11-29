From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:02:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/atk
Message-ID: <20071129130259.9B05430048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:02:58 -0800 (Thu, 29 Nov 2007)
New Revision: 20585

Log:
Make atk depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/atk/Config.in


Changeset:
Modified: trunk/buildroot/package/atk/Config.in
===================================================================
--- trunk/buildroot/package/atk/Config.in	2007-11-29 13:02:38 UTC (rev 20584)
+++ trunk/buildroot/package/atk/Config.in	2007-11-29 13:02:58 UTC (rev 20585)
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
 	default n
-	select BR2_PACKAGE_LIBGLIB2
+	depends BR2_PACKAGE_LIBGLIB2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
+
+comment "atk		- disabled (requires libglib2)"
+	depends !BR2_PACKAGE_LIBGLIB2
