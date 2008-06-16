From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:15:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20080616111552.31873F800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:15:51 -0700 (Mon, 16 Jun 2008)
New Revision: 22369

Log:
python: fix hostpython target.

Remove invalid hyphen in front of -$(MAKE) in the middle of a subshell

Patch by Conrad Parker.


Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-06-16 11:15:31 UTC (rev 22368)
+++ trunk/buildroot/package/python/python.mk	2008-06-16 11:15:51 UTC (rev 22369)
@@ -89,7 +89,7 @@
 		$(MAKE) python Parser/pgen && \
 		mv python hostpython && \
 		mv Parser/pgen Parser/hostpgen && \
-		-$(MAKE) distclean \
+		$(MAKE) distclean \
 	) && \
 	touch $@
 
