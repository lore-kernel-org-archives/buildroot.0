From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Oct 2008 22:19:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20081022051905.19EED3C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-21 22:19:04 -0700 (Tue, 21 Oct 2008)
New Revision: 23761

Log:
new package wizard: change bash-specific construct

Patch by Markus Heidelberg.

${VAR//-/_} which replaces - with _ aborts with "syntax error" on a
system where /bin/sh points to dash. Use tr therefor as already done in
the line above rather than changing the shebang to bash.

Modified:
   trunk/buildroot/scripts/add_new_package.wizard


Changeset:
Modified: trunk/buildroot/scripts/add_new_package.wizard
===================================================================
--- trunk/buildroot/scripts/add_new_package.wizard	2008-10-21 19:44:57 UTC (rev 23760)
+++ trunk/buildroot/scripts/add_new_package.wizard	2008-10-22 05:19:04 UTC (rev 23761)
@@ -48,8 +48,7 @@
 URL=${DOWNLOAD_LOC%/*}
 TARBALL=${DOWNLOAD_LOC##*/}
 EXTENSION=${TARBALL##*.tar.}
-NAME_UPPER=`echo ${PACKAGE_NAME} | tr [a-z] [A-Z]`
-NAME_UPPER=${NAME_UPPER//-/_}
+NAME_UPPER=`echo ${PACKAGE_NAME} | tr a-z- A-Z_`
 
 mkdir ../package/${PACKAGE_NAME}
 
