From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 17 Oct 2008 03:19:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic:
	target_skeleton/etc
Message-ID: <20081017101942.1EBA13C8EA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-17 03:19:41 -0700 (Fri, 17 Oct 2008)
New Revision: 23701

Log:
Add Xilinx UARTLITE and MPC5200 PSC device files (serial ports)

From: Grant Likely <grant.likely@secretlab.ca>

The Xilinx UART Lite and MPC5200 Programmable Serial Controller (PSC)
devices have dedicated major/minor numbers.  Add them to the device
table data file so they get are present in the root filesystem

Modified:
   trunk/buildroot/target/generic/device_table.txt
   trunk/buildroot/target/generic/target_skeleton/etc/securetty


Changeset:
Modified: trunk/buildroot/target/generic/device_table.txt
===================================================================
--- trunk/buildroot/target/generic/device_table.txt	2008-10-17 10:19:38 UTC (rev 23700)
+++ trunk/buildroot/target/generic/device_table.txt	2008-10-17 10:19:41 UTC (rev 23701)
@@ -72,6 +72,8 @@
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
 #/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyPSC	c	666	0	0	204	148	0	1	4
+/dev/ttyUL	c	666	0	0	204	187	0	1	4
 
 # Input stuff
 /dev/input		d	755	0	0	-	-	-	-	-

Modified: trunk/buildroot/target/generic/target_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/securetty	2008-10-17 10:19:38 UTC (rev 23700)
+++ trunk/buildroot/target/generic/target_skeleton/etc/securetty	2008-10-17 10:19:41 UTC (rev 23701)
@@ -14,3 +14,7 @@
 ttyUL1
 ttyUL2
 ttyUL3
+ttyPSC0
+ttyPSC1
+ttyPSC2
+ttyPSC3
