From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  5 Oct 2007 04:00:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gnuconfig: patches
Message-ID: <20071005110042.3CE8FA4967@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-05 04:00:41 -0700 (Fri, 05 Oct 2007)
New Revision: 20176

Log:
- add pattern for gnuhurd-uclibc


Added:
   trunk/buildroot/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch

Modified:
   trunk/buildroot/package/gnuconfig/config.sub


Changeset:
Modified: trunk/buildroot/package/gnuconfig/config.sub
===================================================================
--- trunk/buildroot/package/gnuconfig/config.sub	2007-10-02 21:36:49 UTC (rev 20175)
+++ trunk/buildroot/package/gnuconfig/config.sub	2007-10-05 11:00:41 UTC (rev 20176)
@@ -121,6 +121,7 @@
 maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
 case $maybe_os in
   nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
+  gnu*-uclibc* | \
   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
   storm-chaos* | os2-emx* | rtmk-nova*)
     os=-$maybe_os
@@ -1237,6 +1238,7 @@
 	      | -chorusos* | -chorusrdb* \
 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
 	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
+	      | -gnu*-uclibc* \
 	      | -uxpv* | -beos* | -mpeix* | -udk* \
 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \

Added: trunk/buildroot/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch
===================================================================
--- trunk/buildroot/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch	                        (rev 0)
+++ trunk/buildroot/package/gnuconfig/patches/config.sub.gnuhurd-uclibc.patch	2007-10-05 11:00:41 UTC (rev 20176)
@@ -0,0 +1,20 @@
+Index: config.sub
+===================================================================
+--- config.sub	(revision 20153)
++++ config.sub	(working copy)
+@@ -121,6 +121,7 @@
+ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+ case $maybe_os in
+   nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
++  gnu*-uclibc* | \
+   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
+   storm-chaos* | os2-emx* | rtmk-nova*)
+     os=-$maybe_os
+@@ -1237,6 +1238,7 @@
+ 	      | -chorusos* | -chorusrdb* \
+ 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+ 	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
++	      | -gnu*-uclibc* \
+ 	      | -uxpv* | -beos* | -mpeix* | -udk* \
+ 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
+ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
