From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Apr 2009 21:17:29 +0000 (UTC)
Subject: [Buildroot] svn commit: [26212] trunk/buildroot/package/busybox
Message-ID: <20090426211729.B144D77456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-26 21:17:29 +0000 (Sun, 26 Apr 2009)
New Revision: 26212

Log:
busybox: 1.14.0 dhcp fix

Added:
   trunk/buildroot/package/busybox/busybox-1.14.0-dhcp_hostname.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.14.0-dhcp_hostname.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.14.0-dhcp_hostname.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.14.0-dhcp_hostname.patch	2009-04-26 21:17:29 UTC (rev 26212)
@@ -0,0 +1,12 @@
+--- busybox-1.14.0/networking/udhcp/leases.c	Tue Apr 14 01:42:51 2009
++++ busybox-1.14.0-dhcp_hostname/networking/udhcp/leases.c	Tue Apr 21 02:41:22 2009
+@@ -63,7 +63,8 @@
+ 	if (oldest) {
+ 		oldest->hostname[0] = '\0';
+ 		if (hostname) {
+-        		hostname_length = hostname[-1]; /* look at option size byte */
++			/* option size byte, + 1 for NUL */
++        		hostname_length = hostname[-1] + 1;
+ 			if (hostname_length > sizeof(oldest->hostname))
+ 				hostname_length = sizeof(oldest->hostname);
+             		hostname = (uint8_t*) safe_strncpy((char*)oldest->hostname, (char*)hostname, hostname_length);
