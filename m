From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 20 Nov 2006 08:09:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lzma
Message-ID: <20061120160944.8BC0A485B7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-20 08:09:43 -0800 (Mon, 20 Nov 2006)
New Revision: 16589

Log:
- add and use a HOSTCXX variable.


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-11-20 13:37:09 UTC (rev 16588)
+++ trunk/buildroot/package/Makefile.in	2006-11-20 16:09:43 UTC (rev 16589)
@@ -23,6 +23,7 @@
 endif
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 HOSTCC:=gcc
+HOSTCXX:=g++
 
 BASE_DIR:=${shell pwd}
 

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2006-11-20 13:37:09 UTC (rev 16588)
+++ trunk/buildroot/package/lzma/lzma.mk	2006-11-20 16:09:43 UTC (rev 16589)
@@ -34,6 +34,7 @@
 $(LZMA_HOST_DIR)/.configured: $(LZMA_HOST_DIR)/.source
 	(cd $(LZMA_HOST_DIR); rm -f config.cache ;\
 		CC="$(HOSTCC)" \
+		CXX="$(HOSTCXX)" \
 		./configure \
 		--prefix=/ \
 	);
