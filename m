From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 06:14:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20080311131426.61038120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 06:14:26 -0700 (Tue, 11 Mar 2008)
New Revision: 21291

Log:
fixed typo in script

Modified:
   trunk/buildroot/scripts/copy.sh


Changeset:
Modified: trunk/buildroot/scripts/copy.sh
===================================================================
--- trunk/buildroot/scripts/copy.sh	2008-03-11 13:12:39 UTC (rev 21290)
+++ trunk/buildroot/scripts/copy.sh	2008-03-11 13:14:26 UTC (rev 21291)
@@ -11,7 +11,7 @@
 	for WILDCARD in *.a *.la; do
 		for FILE_PATH in `find ${STAGING_DIR}${LIBSDIR} -name ${WILDCARD}`; do
 			STAGING_STRIPPED=${FILE_PATH##${STAGING_DIR}}
-			EXTENDED_DIR=${PATH_FILE%/${WILDCARD}}
+			EXTENDED_DIR=${STAGING_STRIPPED%/${WILDCARD}}
 			mkdir -p ${TARGET_DIR}${EXTENDED_DIR}
 			cp ${FILE_PATH} ${TARGET_DIR}${STAGING_STRIPPED}
 			#echo ${TARGET_DIR}${STAGING_STRIPPED}
