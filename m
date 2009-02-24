From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Feb 2009 08:56:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openswan
Message-ID: <20090224085615.C64597669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-24 08:56:14 +0000 (Tue, 24 Feb 2009)
New Revision: 25435

Log:
openswan: mark as BROKEN as it doesn't build with current kernel headers

It WILL get removed after 2009.05 unless someone steps up to fix it.

Modified:
   trunk/buildroot/package/openswan/Config.in


Changeset:
Modified: trunk/buildroot/package/openswan/Config.in
===================================================================
--- trunk/buildroot/package/openswan/Config.in	2009-02-24 07:20:53 UTC (rev 25434)
+++ trunk/buildroot/package/openswan/Config.in	2009-02-24 08:56:14 UTC (rev 25435)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSWAN
         bool "openswan"
+        depends on BROKEN # doesn't compile with current kernel headers
         select BR2_PACKAGE_LIBGMP
         select BR2_PACKAGE_MICROPERL
         help
