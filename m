From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Feb 2009 14:30:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic:
	target_busybox_skeleton/etc target_skel etc...
Message-ID: <20090203143045.4E1B976272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-03 14:30:44 +0000 (Tue, 03 Feb 2009)
New Revision: 25227

Log:
target/generic: add ttyCPMx device nodes to device_table / securetty

Serial devices for CPM cores on ppc.

Modified:
   trunk/buildroot/target/generic/device_table.txt
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty
   trunk/buildroot/target/generic/target_skeleton/etc/securetty


Changeset:
Modified: trunk/buildroot/target/generic/device_table.txt
===================================================================
--- trunk/buildroot/target/generic/device_table.txt	2009-02-03 14:29:36 UTC (rev 25226)
+++ trunk/buildroot/target/generic/device_table.txt	2009-02-03 14:30:44 UTC (rev 25227)
@@ -72,6 +72,7 @@
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
 #/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyCPM	c	666	0	0	204	46	0	1	4
 /dev/ttyAMA	c	666	0	0	204	64	0	1	4
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4

Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty	2009-02-03 14:29:36 UTC (rev 25226)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty	2009-02-03 14:30:44 UTC (rev 25227)
@@ -22,3 +22,7 @@
 ttyPSC1
 ttyPSC2
 ttyPSC3
+ttyCPM0
+ttyCPM1
+ttyCPM2
+ttyCPM3

Modified: trunk/buildroot/target/generic/target_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/securetty	2009-02-03 14:29:36 UTC (rev 25226)
+++ trunk/buildroot/target/generic/target_skeleton/etc/securetty	2009-02-03 14:30:44 UTC (rev 25227)
@@ -22,3 +22,7 @@
 ttyPSC1
 ttyPSC2
 ttyPSC3
+ttyCPM0
+ttyCPM1
+ttyCPM2
+ttyCPM3
