From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 11 Jul 2008 06:44:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080711134400.3064D3C6DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-11 06:43:59 -0700 (Fri, 11 Jul 2008)
New Revision: 22779

Log:
package/Makefile.in: cleanup MAKE/MAKE1

The extra stuff doesn't seem to be needed, so lets just get rid of it.

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-07-11 13:43:56 UTC (rev 22778)
+++ trunk/buildroot/package/Makefile.in	2008-07-11 13:43:59 UTC (rev 22779)
@@ -6,14 +6,9 @@
 endif
 HOSTMAKE :=$(shell $(CONFIG_SHELL) -c "which $(HOSTMAKE)" || type -p $(HOSTMAKE) || echo make)
 
-# honor silent mode
-ifeq (s,$(findstring s,$(MAKEFLAGS)))
-MAKESILENT:=-s
-endif
+MAKE1:=$(HOSTMAKE) -j1
+MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
-MAKE1:=$(HOSTMAKE) MAKE='$(firstword $(HOSTMAKE)) -j1 $(MAKESILENT)'
-MAKE:=$(HOSTMAKE) MAKE='$(firstword $(HOSTMAKE)) -j$(BR2_JLEVEL) $(MAKESILENT)'
-
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION=-O0
 endif
