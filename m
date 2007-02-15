From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 15 Feb 2007 06:07:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070215140709.AC39C485B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-15 06:07:08 -0800 (Thu, 15 Feb 2007)
New Revision: 17897

Log:
- warn about missing makeinfo on the host.


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-15 13:54:25 UTC (rev 17896)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-15 14:07:08 UTC (rev 17897)
@@ -248,9 +248,14 @@
 echo "gettext installed:				Ok"
 
 
+if ! which makeinfo > /dev/null ; then \
+	echo "makeinfo installed:		    FALSE"
+	/bin/echo -e "\n\nMost likely some packages will fail to build their documentation"
+	/bin/echo -e "Either install 'makeinfo' on your host or fix the respective packages"
+fi
+echo "makeinfo installed:				Ok"
 
 
-
 #############################################################
 #
 # All done
