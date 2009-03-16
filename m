From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 20:58:08 +0000 (UTC)
Subject: [Buildroot] svn commit: [25693] trunk/buildroot/package
Message-ID: <20090316205808.F1FDE7649F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 20:58:08 +0000 (Mon, 16 Mar 2009)
New Revision: 25693

Log:
package/Makefile.in: search $(HOST_DIR) for host includes / libraries

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-16 20:58:04 UTC (rev 25692)
+++ trunk/buildroot/package/Makefile.in	2009-03-16 20:58:08 UTC (rev 25693)
@@ -185,6 +185,11 @@
 FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 
+HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
+HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib
+
+
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
