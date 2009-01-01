From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  1 Jan 2009 21:20:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20090101212047.3D37C76C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-01 21:20:46 +0000 (Thu, 01 Jan 2009)
New Revision: 24642

Log:
dependencies: simplistic SHELL = bash check

Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2009-01-01 21:20:35 UTC (rev 24641)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2009-01-01 21:20:46 UTC (rev 24642)
@@ -248,6 +248,18 @@
 
 #############################################################
 #
+# check build system 'bash'
+#
+#############################################################
+if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
+	echo "bash installed:		    FALSE"
+	/bin/echo -e "\n\nYou must install 'bash' on your build machine\n";
+	exit 1;
+fi;
+echo "bash installed:					Ok"
+
+#############################################################
+#
 # check build system 'bison'
 #
 #############################################################
