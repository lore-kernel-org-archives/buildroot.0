From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Feb 2009 21:04:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090202210415.99E1B764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-02 21:04:13 +0000 (Mon, 02 Feb 2009)
New Revision: 25223

Log:
kernel-headers: 2.6.28.x: remove cris patch applied upstream

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch


Changeset:
Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch	2009-02-02 20:13:57 UTC (rev 25222)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.3-cris-klist-warnings.patch	2009-02-02 21:04:13 UTC (rev 25223)
@@ -1,12 +0,0 @@
---- a/include/linux/klist.h
-+++ b/include/linux/klist.h
-@@ -23,7 +23,7 @@ struct klist {
- 	struct list_head	k_list;
- 	void			(*get)(struct klist_node *);
- 	void			(*put)(struct klist_node *);
--};
-+} __attribute__ ((aligned (4)));
- 
- #define KLIST_INIT(_name, _get, _put)					\
- 	{ .k_lock	= __SPIN_LOCK_UNLOCKED(_name.k_lock),		\
-
