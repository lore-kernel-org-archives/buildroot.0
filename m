From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:21:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20081223102110.F225976A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-23 10:21:10 +0000 (Tue, 23 Dec 2008)
New Revision: 24519

Log:
toolchain: disable export-toolchain stuff as it breaks make dependencies

For some reason Ulf's export-toolchain stuff breaks the build as the
dependencies target isn't executed and SED isn't set.

Modified:
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2008-12-23 10:21:07 UTC (rev 24518)
+++ trunk/buildroot/toolchain/Makefile.in	2008-12-23 10:21:10 UTC (rev 24519)
@@ -46,6 +46,5 @@
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-
-include toolchain/export-toolchain/Makefile.in
-
+# breaks the build
+#include toolchain/export-toolchain/Makefile.in
