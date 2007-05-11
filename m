From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 11 May 2007 05:50:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070511125016.3E81648007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-11 05:50:15 -0700 (Fri, 11 May 2007)
New Revision: 18607

Log:
- ignore eventual errors from which(1)


Modified:
   trunk/buildroot/toolchain/dependencies/check-host-sed.sh
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/check-host-sed.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-05-10 23:06:55 UTC (rev 18606)
+++ trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-05-11 12:50:15 UTC (rev 18607)
@@ -3,7 +3,7 @@
 for SED in $SEDLIST
 do
 	if ! test -x $SED ; then
-		SED=$(which $SED)
+		SED=$(which $SED 2> /dev/null)
 		if ! test -x "$SED" > /dev/null ; then
 			SED=""
 			continue

Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-05-10 23:06:55 UTC (rev 18606)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-05-11 12:50:15 UTC (rev 18607)
@@ -123,7 +123,7 @@
 # check build system 'make'
 #
 #############################################################
-MAKE=$(which make)
+MAKE=$(which make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
 	echo "make installed:		    FALSE"
 	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
@@ -152,7 +152,7 @@
 #############################################################
 COMPILER=$(which $HOSTCC 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
-	COMPILER=$(which cc)
+	COMPILER=$(which cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
 	echo "C Compiler installed:		    FALSE"
@@ -179,7 +179,7 @@
 # check for host CXX
 CXXCOMPILER=$(which $HOSTCXX 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER=$(which c++)
+	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
 if [ -z "$CXXCOMPILER" ] ; then
 	echo "C++ Compiler installed:		    FALSE"
