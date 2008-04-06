From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  6 Apr 2008 03:01:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20080406100130.9F7033C399@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-06 03:01:29 -0700 (Sun, 06 Apr 2008)
New Revision: 21649

Log:
Fix bad use of symbol

Modified:
   trunk/buildroot/scripts/get_linux_config.sh


Changeset:
Modified: trunk/buildroot/scripts/get_linux_config.sh
===================================================================
--- trunk/buildroot/scripts/get_linux_config.sh	2008-04-06 08:19:58 UTC (rev 21648)
+++ trunk/buildroot/scripts/get_linux_config.sh	2008-04-06 10:01:29 UTC (rev 21649)
@@ -8,6 +8,7 @@
 LINUX26_DIR=$2
 
 cd ${TOPDIR}/${BOARD_PATH}
+mkdir -p ${LINUX26_DIR}
 for i in `ls *linux*.config` ; do
 	echo Copying $i ...
 	cp $i ${LINUX26_DIR}/.config
