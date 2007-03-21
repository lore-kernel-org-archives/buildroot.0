From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 21 Mar 2007 11:15:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070321181503.E12E64807A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-21 11:15:02 -0700 (Wed, 21 Mar 2007)
New Revision: 18197

Log:
- ignore errors when looking at hostcc and hostcxx


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-03-21 17:53:00 UTC (rev 18196)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-03-21 18:15:02 UTC (rev 18197)
@@ -4,8 +4,8 @@
 
 echo ""
 echo "Checking build system dependencies:"
+export LC_ALL=C
 
-
 #############################################################
 #
 # check build system 'environment'
@@ -150,7 +150,7 @@
 # check build system 'gcc'
 #
 #############################################################
-COMPILER=$(which $HOSTCC)
+COMPILER=$(which $HOSTCC 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc)
 fi;
@@ -177,7 +177,7 @@
 
 
 # check for host CXX
-CXXCOMPILER=$(which $HOSTCXX)
+CXXCOMPILER=$(which $HOSTCXX 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++)
 fi
