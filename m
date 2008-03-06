From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 11:00:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20080306190038.754A61202D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 11:00:38 -0800 (Thu, 06 Mar 2008)
New Revision: 21256

Log:
added u-boot location

Modified:
   trunk/buildroot/target/Config.in
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2008-03-06 18:59:57 UTC (rev 21255)
+++ trunk/buildroot/target/Config.in	2008-03-06 19:00:38 UTC (rev 21256)
@@ -18,6 +18,7 @@
 #source "target/x86/grub2/Config.in"
 source "target/x86/syslinux/Config.in"
 source "target/powerpc/yaboot/Config.in"
+source "target/device/Atmel/u-boot/Config.in"
 endmenu
 
 menu "Kernel"

Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2008-03-06 18:59:57 UTC (rev 21255)
+++ trunk/buildroot/target/Makefile.in	2008-03-06 19:00:38 UTC (rev 21256)
@@ -10,6 +10,8 @@
 include target/device/Makefile.in
 include target/x86/Makefile.in
 include target/powerpc/Makefile.in
+include target/device/Atmel/u-boot/u-boot.mk
+
 # and finally build the filesystems/tarballs
 include target/*/*.mk
 
