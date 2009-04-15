From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 13:42:13 +0000 (UTC)
Subject: [Buildroot] svn commit: [26114] trunk/buildroot/target/generic
Message-ID: <20090415134213.58D4D7767F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-15 13:42:12 +0000 (Wed, 15 Apr 2009)
New Revision: 26114

Log:
target/generic: support for busybox >= 1.14.x speed=0 handling

Modified:
   trunk/buildroot/target/generic/Config.in


Changeset:
Modified: trunk/buildroot/target/generic/Config.in
===================================================================
--- trunk/buildroot/target/generic/Config.in	2009-04-15 13:42:08 UTC (rev 26113)
+++ trunk/buildroot/target/generic/Config.in	2009-04-15 13:42:12 UTC (rev 26114)
@@ -163,6 +163,8 @@
 	help
 	  Select a baudrate to use.
 
+config BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
+       bool "keep kernel default"
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600
 	bool "9600"
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200
@@ -177,6 +179,7 @@
 
 config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	string
+	default "0"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP
 	default "9600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600
 	default "19200"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200
 	default "38400"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400
