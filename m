From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 06:11:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20080618131157.C31973C75F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 06:11:52 -0700 (Wed, 18 Jun 2008)
New Revision: 22412

Log:
dependencies: check for awk


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2008-06-18 09:22:31 UTC (rev 22411)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2008-06-18 13:11:52 UTC (rev 22412)
@@ -234,6 +234,18 @@
 
 #############################################################
 #
+# check build system 'awk'
+#
+#############################################################
+if ! which awk > /dev/null ; then
+	echo "awk installed:		    FALSE"
+	/bin/echo -e "\n\nYou must install 'awk' on your build machine\n";
+	exit 1;
+fi;
+echo "awk installed:					Ok"
+
+#############################################################
+#
 # check build system 'bison'
 #
 #############################################################
