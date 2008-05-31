From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:27:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080531072753.DF93B3C8CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:27:52 -0700 (Sat, 31 May 2008)
New Revision: 22134

Log:
Makefile: honor silent (-s) flag


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-05-31 07:27:47 UTC (rev 22133)
+++ trunk/buildroot/package/Makefile.in	2008-05-31 07:27:52 UTC (rev 22134)
@@ -9,6 +9,12 @@
 MAKE1:=$(HOSTMAKE) MAKE="$(firstword $(HOSTMAKE)) -j1"
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
+# honor silent mode
+ifeq (s,$(findstring s,$(MAKEFLAGS)))
+MAKE1+= -s
+MAKE+= -s
+endif
+
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION=-O0
 endif
