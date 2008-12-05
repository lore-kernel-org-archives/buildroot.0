From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:27:58 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/binutils/2.18.50.0.9
Message-ID: <20081205152758.D1AB43C2C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:27:58 -0800 (Fri, 05 Dec 2008)
New Revision: 24293

Log:
toolchain/binutils/2.18.50.0.9: accept sh?-*-*

Based on 3ed6c5b5 in Bernhard's tree.

Added:
   trunk/buildroot/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.18.50.0.9/120-sh-conf.patch	2008-12-05 15:27:58 UTC (rev 24293)
@@ -0,0 +1,42 @@
+diff -rdup binutils-2.18.50.0.9.old/configure binutils-2.18.50.0.9/configure
+--- binutils-2.18.50.0.9.old/configure	2008-08-23 17:36:13.000000000 +0200
++++ binutils-2.18.50.0.9/configure	2008-10-14 14:25:22.000000000 +0200
+@@ -2281,7 +2281,7 @@ case "${target}" in
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -2606,7 +2606,7 @@ case "${target}" in
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[3456789]86-*-vsta) ;; # don't add gprof back in
+       i[3456789]86-*-go32*) ;; # don't add gprof back in
+diff -rdup binutils-2.18.50.0.9.old/configure.ac binutils-2.18.50.0.9/configure.ac
+--- binutils-2.18.50.0.9.old/configure.ac	2008-08-23 17:36:13.000000000 +0200
++++ binutils-2.18.50.0.9/configure.ac	2008-10-14 14:25:11.000000000 +0200
+@@ -530,7 +530,7 @@ case "${target}" in
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -855,7 +855,7 @@ case "${target}" in
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
+       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
