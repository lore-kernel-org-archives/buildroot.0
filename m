From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed, 18 Apr 2007 19:04:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/external-toolchain
Message-ID: <20070419020416.B726648562@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-04-18 19:04:15 -0700 (Wed, 18 Apr 2007)
New Revision: 18495

Log:
Some 'find' commands get a little picky.


Modified:
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk


Changeset:
Modified: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2007-04-19 00:09:34 UTC (rev 18494)
+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2007-04-19 02:04:15 UTC (rev 18495)
@@ -18,7 +18,7 @@
 	fi;											\
 												\
 	LIB="$(strip $1)";									\
-	for FILE in `find $${LIB_DIR} -type l -name "$${LIB}*" -maxdepth 1`; do			\
+	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name "$${LIB}*"`; do			\
 		LIB=`basename $${FILE}`;							\
 		while test \! -z "$${LIB}"; do							\
 			echo "copy_toolchain_lib_root lib=$${LIB} dst=$${DST}";			\
