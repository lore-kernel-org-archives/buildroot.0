From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  5 Jun 2007 00:38:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070605073808.BB20348574@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-05 00:38:07 -0700 (Tue, 05 Jun 2007)
New Revision: 18745

Log:
- fix typo in version check


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-06-04 23:32:35 UTC (rev 18744)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-06-05 07:38:07 UTC (rev 18745)
@@ -137,7 +137,7 @@
 fi;
 MAKE_MAJOR=$(echo $MAKE_VERSION | $XSED -e "s/\..*//g")
 MAKE_MINOR=$(echo $MAKE_VERSION | $XSED -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
-if [ $MAKE_MAJOR -lt 3 -o $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 8 ] ; then
+if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 80 ] ; then
 	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.80 is required"
 	exit 1;
 fi;
