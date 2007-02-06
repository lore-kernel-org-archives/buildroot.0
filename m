From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 10:09:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070206180955.20A5C48580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 10:09:54 -0800 (Tue, 06 Feb 2007)
New Revision: 17795

Log:
Wrong sign dufus.


Modified:
   trunk/buildroot/package/mtd/mtd.patch


Changeset:
Modified: trunk/buildroot/package/mtd/mtd.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd.patch	2007-02-06 17:38:29 UTC (rev 17794)
+++ trunk/buildroot/package/mtd/mtd.patch	2007-02-06 18:09:54 UTC (rev 17795)
@@ -15,7 +15,7 @@
  					printf ("\nSkipping bad block at 0x%08x\n", erase.start);
  				continue;
 -			} else if (ret == -EOPNOTSUPP) {
-+			} else if (errno == -EOPNOTSUPP) {
++			} else if (errno == EOPNOTSUPP) {
  				fprintf(stderr, "%s: %s: Bad block check not available\n", exe_name, mtd_device);
  				bbtest = 0;
  			} else if (ret < 0) {
