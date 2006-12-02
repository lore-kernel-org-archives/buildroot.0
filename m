From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri,  1 Dec 2006 22:48:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netkitbase
Message-ID: <20061202064822.F0D6D485A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2006-12-01 22:48:22 -0800 (Fri, 01 Dec 2006)
New Revision: 16752

Log:
Remove usage of bcopy.


Added:
   trunk/buildroot/package/netkitbase/netkitbase-remove-bcopy.patch


Changeset:
Added: trunk/buildroot/package/netkitbase/netkitbase-remove-bcopy.patch
===================================================================
--- trunk/buildroot/package/netkitbase/netkitbase-remove-bcopy.patch	2006-12-02 06:42:25 UTC (rev 16751)
+++ trunk/buildroot/package/netkitbase/netkitbase-remove-bcopy.patch	2006-12-02 06:48:22 UTC (rev 16752)
@@ -0,0 +1,31 @@
+diff -ur netkit-base-0.17/inetd/builtins.c netkit-base-0.17-patched/inetd/builtins.c
+--- netkit-base-0.17/inetd/builtins.c	2000-07-22 15:13:07.000000000 -0500
++++ netkit-base-0.17-patched/inetd/builtins.c	2006-12-02 00:50:05.801209342 -0600
+@@ -140,10 +140,10 @@
+ 	text[LINESIZ + 1] = '\n';
+ 	for (rs = ring;;) {
+ 		if ((len = endring - rs) >= LINESIZ)
+-			bcopy(rs, text, LINESIZ);
++			memcpy(text, rs, LINESIZ);
+ 		else {
+-			bcopy(rs, text, len);
+-			bcopy(ring, text + len, LINESIZ - len);
++			memcpy(text, rs, len);
++			memcpy(text + len, ring, LINESIZ - len);
+ 		}
+ 		if (++rs == endring)
+ 			rs = ring;
+@@ -183,10 +183,10 @@
+ 		return;
+ 
+ 	if ((len = endring - rs) >= LINESIZ)
+-		bcopy(rs, text, LINESIZ);
++		memcpy(text, rs, LINESIZ);
+ 	else {
+-		bcopy(rs, text, len);
+-		bcopy(ring, text + len, LINESIZ - len);
++		memcpy(text, rs, len);
++		memcpy(text + len, ring, LINESIZ - len);
+ 	}
+ 	if (++rs == endring)
+ 		rs = ring;
