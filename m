From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Sep 2007 09:46:32 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d
Message-ID: <20070920164632.A891BA6881@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-20 09:46:31 -0700 (Thu, 20 Sep 2007)
New Revision: 19913

Log:
Check if STK1002 init scripts are executable before running

Modified:
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/rcS


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/rcS
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/rcS	2007-09-20 16:44:15 UTC (rev 19912)
+++ trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/etc/init.d/rcS	2007-09-20 16:46:31 UTC (rev 19913)
@@ -1,7 +1,9 @@
 #!/bin/sh
 
 for s in /etc/init.d/S*; do
-	$s start
+	if [ -x $s ]; then
+		$s start
+	fi
 done
 
 echo
