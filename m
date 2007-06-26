From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 06:26:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070626132651.36A39A460C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 06:26:51 -0700 (Tue, 26 Jun 2007)
New Revision: 18937

Log:
- check for clean environment variables ARCH, CROSS_COMPILE, GREP_OPTIONS


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-06-26 06:24:37 UTC (rev 18936)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-06-26 13:26:51 UTC (rev 18937)
@@ -61,6 +61,28 @@
 fi;
 echo "CXXFLAGS clean:					Ok"
 
+if test -n "$GREP_OPTIONS" ; then
+        echo "GREP_OPTIONS clean:                               FALSE"
+        /bin/echo -e "\n\nYou must run 'unset GREP_OPTIONS' so buildroot can run with";
+        /bin/echo -e "a clean environment on your build machine\n";
+        exit 1;
+fi;
+
+if test -n "$CROSS_COMPILE" ; then
+        echo "CROSS_COMPILE clean:                               FALSE"
+        /bin/echo -e "\n\nYou must run 'unset CROSS_COMPILE' so buildroot can run with";
+        /bin/echo -e "a clean environment on your build machine\n";
+        exit 1;
+fi;
+
+if test -n "$ARCH" ; then
+        echo "ARCH clean:                               FALSE"
+        /bin/echo -e "\n\nYou must run 'unset ARCH' so buildroot can run with";
+        /bin/echo -e "a clean environment on your build machine\n";
+        exit 1;
+fi;
+
+
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
 if test $? != 0 ; then
 	echo "grep works:				FALSE"
