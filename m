From: <bogus@does.not.exist.com>
Date: Wed, 23 Apr 2008 14:39:25 -0000
Subject: No subject
Message-ID: <mailman.12.1213902371.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Added:
   trunk/buildroot/package/config/check.sh


Changeset:
Added: trunk/buildroot/package/config/check.sh
===================================================================
--- trunk/buildroot/package/config/check.sh	                        (rev 0)
+++ trunk/buildroot/package/config/check.sh	2008-06-19 19:06:08 UTC (rev 22454)
@@ -0,0 +1,14 @@
+#!/bin/sh
+# Needed for systems without gettext
+$* -xc -o /dev/null - > /dev/null 2>&1 << EOF
+#include <libintl.h>
+int main()
+{
+	gettext("");
+	return 0;
+}
+EOF
+if [ ! "$?" -eq "0"  ]; then
+	echo -DKBUILD_NO_NLS;
+fi
+


Property changes on: trunk/buildroot/package/config/check.sh
___________________________________________________________________
Name: svn:executable
   + *
