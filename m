From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 14:54:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic:
	target_busybox_skeleton/etc target_skel etc...
Message-ID: <20081223145450.0BAD276A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-23 14:54:49 +0000 (Tue, 23 Dec 2008)
New Revision: 24528

Log:
target/generic: add ttyAMAx device nodes (E.G. for qemu-system-arm)

Modified:
   trunk/buildroot/target/generic/device_table.txt
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty
   trunk/buildroot/target/generic/target_skeleton/etc/securetty


Changeset:
Modified: trunk/buildroot/target/generic/device_table.txt
===================================================================
--- trunk/buildroot/target/generic/device_table.txt	2008-12-23 13:02:13 UTC (rev 24527)
+++ trunk/buildroot/target/generic/device_table.txt	2008-12-23 14:54:49 UTC (rev 24528)
@@ -72,6 +72,7 @@
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
 #/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyAMA	c	666	0	0	204	64	0	1	4
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
 

Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty	2008-12-23 13:02:13 UTC (rev 24527)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty	2008-12-23 14:54:49 UTC (rev 24528)
@@ -10,7 +10,15 @@
 ttyS1
 ttyS2
 ttyS3
+ttyAMA0
+ttyAMA1
+ttyAMA2
+ttyAMA3
 ttyUL0
 ttyUL1
 ttyUL2
 ttyUL3
+ttyPSC0
+ttyPSC1
+ttyPSC2
+ttyPSC3

Modified: trunk/buildroot/target/generic/target_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/securetty	2008-12-23 13:02:13 UTC (rev 24527)
+++ trunk/buildroot/target/generic/target_skeleton/etc/securetty	2008-12-23 14:54:49 UTC (rev 24528)
@@ -10,6 +10,10 @@
 ttyS1
 ttyS2
 ttyS3
+ttyAMA0
+ttyAMA1
+ttyAMA2
+ttyAMA3
 ttyUL0
 ttyUL1
 ttyUL2
