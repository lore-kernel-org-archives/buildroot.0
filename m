From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 23:21:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20061213072117.451F948574@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 23:21:16 -0800 (Tue, 12 Dec 2006)
New Revision: 16874

Log:
add checks for when people have foolishly set things in their enviroment
such as CC, CFLAGS, etc that will cause buildroot to break


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-13 07:19:58 UTC (rev 16873)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-13 07:21:16 UTC (rev 16874)
@@ -5,8 +5,58 @@
 echo ""
 echo "Checking build system dependencies:"
 
+
 #############################################################
 #
+# check build system 'environment'
+#
+#############################################################
+if test -n "$CC" ; then
+	echo "CC clean:					FALSE"
+	/bin/echo -e "\n\nYou must run 'unset CC' so buildroot can run with";
+	/bin/echo -e "a clean enviroment on your build machine\n";
+	exit 1;
+fi;
+echo "CC clean:					Ok"
+
+
+if test -n "$CXX" ; then
+	echo "CXX clean:				FALSE"
+	/bin/echo -e "\n\nYou must run 'unset CXX' so buildroot can run with";
+	/bin/echo -e "a clean enviroment on your build machine\n";
+	exit 1;
+fi;
+echo "CXX clean:					Ok"
+
+
+if test -n "$CPP" ; then
+	echo "CPP clean:				FALSE"
+	/bin/echo -e "\n\nYou must run 'unset CPP' so buildroot can run with";
+	/bin/echo -e "a clean enviroment on your build machine\n";
+	exit 1;
+fi;
+echo "CPP clean:					Ok"
+
+
+if test -n "$CXXFLAGS" ; then
+	echo "CXXFLAGS clean:				FALSE"
+	/bin/echo -e "\n\nYou must run 'unset CXXFLAGS' so buildroot can run with";
+	/bin/echo -e "a clean enviroment on your build machine\n";
+	exit 1;
+fi;
+echo "CXXFLAGS clean:					Ok"
+
+
+if test -n "$CXXFLAGS" ; then
+	echo "CXXFLAGS clean:				FALSE"
+	/bin/echo -e "\n\nYou must run 'unset CXXFLAGS' so buildroot can run with";
+	/bin/echo -e "a clean enviroment on your build machine\n";
+	exit 1;
+fi;
+echo "CXXFLAGS clean:					Ok"
+
+#############################################################
+#
 # check build system 'sed'
 #
 #############################################################
@@ -22,9 +72,9 @@
 echo "HELLO" > .sedtest
 $SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
 if test $? != 0 ; then
-	echo "sed works:			    No, using buildroot version instead"
+	echo "sed works:				No, using buildroot version instead"
 else
-	echo "sed works:			    Ok"
+	echo "sed works:					Ok"
 fi
 XSED=$HOST_SED_DIR/bin/sed
 
@@ -38,7 +88,7 @@
 	/bin/echo -e "\n\nYou must install 'which' on your build machine\n";
 	exit 1;
 fi;
-echo "which installed:		    Ok"
+echo "which installed:				Ok"
 
 
 #############################################################
@@ -64,7 +114,7 @@
 	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.80 is required"
 	exit 1;
 fi;
-echo "GNU make version '$MAKE_VERSION':	    Ok"
+echo "GNU make version '$MAKE_VERSION':			Ok"
 
 
 
@@ -96,7 +146,7 @@
 	exit 1;
 fi;
 echo "C compiler '$COMPILER'"
-echo "C compiler version '$COMPILER_VERSION':	    Ok"
+echo "C compiler version '$COMPILER_VERSION':			Ok"
 
 
 
@@ -110,7 +160,7 @@
 	/bin/echo -e "\n\nYou must install 'bison' on your build machine\n";
 	exit 1;
 fi;
-echo "bison installed:		    Ok"
+echo "bison installed:				Ok"
 
 
 #############################################################
@@ -123,7 +173,7 @@
 	/bin/echo -e "\n\nYou must install 'flex' on your build machine\n";
 	exit 1;
 fi;
-echo "flex installed:			    Ok"
+echo "flex installed:					Ok"
 
 
 #############################################################
@@ -136,7 +186,7 @@
 	/bin/echo -e "\n\nYou must install 'gettext' on your build machine\n"; \
 	exit 1; \
 fi;
-echo "gettext installed:		    Ok"
+echo "gettext installed:				Ok"
 
 
 
@@ -147,6 +197,6 @@
 # All done
 #
 #############################################################
-echo "Build system dependencies:	    Ok"
+echo "Build system dependencies:			Ok"
 echo ""
 
