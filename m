From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 09:28:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070209172828.98C4B486CA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 09:28:27 -0800 (Fri, 09 Feb 2007)
New Revision: 17840

Log:
- add paranoia warning about $INCLUDES


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-09 14:18:37 UTC (rev 17839)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-09 17:28:27 UTC (rev 17840)
@@ -46,6 +46,12 @@
 fi;
 echo "CFLAGS clean:					Ok"
 
+if test -n "$INCLUDES" ; then
+	echo "INCLUDES clean:					FALSE"
+	/bin/echo -e "WARNING: INCLUDES contains:\n\t'$INCLUDES'"
+else
+	echo "INCLUDES clean:				Ok"
+fi
 
 if test -n "$CXXFLAGS" ; then
 	echo "CXXFLAGS clean:					FALSE"
