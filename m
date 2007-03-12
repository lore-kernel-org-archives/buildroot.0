From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 12 Mar 2007 01:55:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070312085521.BAE1D4808C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-12 01:55:20 -0700 (Mon, 12 Mar 2007)
New Revision: 18069

Log:
- fix syntax


Modified:
   trunk/buildroot/toolchain/dependencies/check-host-sed.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/check-host-sed.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-03-11 23:06:39 UTC (rev 18068)
+++ trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-03-12 08:55:20 UTC (rev 18069)
@@ -19,7 +19,7 @@
 	elif test -e ".sedtest-e" ; then
 		rm -f ".sedtest-e"
 		SED=""
-	elif [ -z "${RESULT}" ] || [ "${RESULT}" != "GOODBYE"] > /dev/null ;
+	elif [ "x$RESULT" = "x" ] || [ "$RESULT" != "GOODBYE" ] > /dev/null ;
 	then
 		SED=""
 	fi
