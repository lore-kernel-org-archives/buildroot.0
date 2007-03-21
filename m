From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 21 Mar 2007 03:54:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070321105424.B62F548082@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-21 03:54:24 -0700 (Wed, 21 Mar 2007)
New Revision: 18193

Log:
- stop using head and use sed -e '1d' at the end instead


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-03-21 10:35:40 UTC (rev 18192)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-03-21 10:54:24 UTC (rev 18193)
@@ -129,7 +129,7 @@
 	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
-MAKE_VERSION=$($MAKE --version 2>&1 | head -n1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g')
+MAKE_VERSION=$($MAKE --version 2>&1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$MAKE_VERSION" ] ; then
 	echo "make installed:		    FALSE"
 	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
@@ -160,7 +160,7 @@
 	exit 1;
 fi;
 
-COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
+COMPILER_VERSION=$($COMPILER --version 2>&1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g" -e '1q')
 if [ -z "$COMPILER_VERSION" ] ; then
 	echo "gcc installed:		    FALSE"
 	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n";
@@ -187,7 +187,7 @@
 	#exit 1
 fi
 if [ ! -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER_VERSION=$($CXXCOMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
+	CXXCOMPILER_VERSION=$($CXXCOMPILER --version 2>&1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g" -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ] ; then
 		echo "c++ installed:		    FALSE"
 		/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
