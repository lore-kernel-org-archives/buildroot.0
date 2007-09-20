From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Sep 2007 09:43:16 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d
Message-ID: <20070920164316.10BD9A65C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-20 09:43:16 -0700 (Thu, 20 Sep 2007)
New Revision: 19911

Log:
Use correct board name for ngw100

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcS


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcS
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcS	2007-09-20 15:35:26 UTC (rev 19910)
+++ trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/etc/init.d/rcS	2007-09-20 16:43:16 UTC (rev 19911)
@@ -1,9 +1,11 @@
 #!/bin/sh
 
 for s in /etc/init.d/S*; do
-	$s start
+	if [ -x $s ]; then
+		$s start
+	fi
 done
 
 echo
-echo "STK1000 ready"
+echo "NGW100 ready"
 echo
