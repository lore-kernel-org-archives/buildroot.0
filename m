From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:37:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090111203705.09A4276736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:37:04 +0000 (Sun, 11 Jan 2009)
New Revision: 24764

Log:
Bug fix for mkpkg script

Modified:
   trunk/buildroot/scripts/mkpkg


Changeset:
Modified: trunk/buildroot/scripts/mkpkg
===================================================================
--- trunk/buildroot/scripts/mkpkg	2009-01-11 20:36:17 UTC (rev 24763)
+++ trunk/buildroot/scripts/mkpkg	2009-01-11 20:37:04 UTC (rev 24764)
@@ -21,10 +21,10 @@
 
 function build_package ()
 {
-	printf "%-52s" "$1"
-	rm -f {LOG}
-	rm -f {LOG_OK_FILE}
-	rm -f {LOG_FAIL_FILE}
+	printf "%-31s" "$1"
+	rm -f ${LOG}
+	rm -f ${LOG_OK_FILE}
+	rm -f ${LOG_FAIL_FILE}
 	rm -f ${DEPENDENCY}
 
 	make $1-dirclean > /dev/null 2>&1
