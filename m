From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 02:06:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080331090643.CDFB93C4D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 02:06:26 -0700 (Mon, 31 Mar 2008)
New Revision: 21592

Log:
Makefile: revert broken ccache (r21525) for now.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-31 05:42:03 UTC (rev 21591)
+++ trunk/buildroot/Makefile	2008-03-31 09:06:26 UTC (rev 21592)
@@ -85,11 +85,6 @@
 
 export CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
 
-HOSTCCACHE:=$(shell $(CONFIG_SHELL) -c "which ccache")
-ifneq ($(HOSTCCACHE),)
-BR2_HAVE_HOST_CCACHE=y
-endif
-
 ifndef HOSTAR
 HOSTAR:=ar
 endif
@@ -136,12 +131,6 @@
 ifndef FCFLAGS_FOR_BUILD
 FCFLAGS_FOR_BUILD:=-g -O2
 endif
-
-ifeq ($(BR2_HAVE_HOST_CCACHE),y)
-HOSTCC:=$(HOSTCCACHE) $(HOSTCC)
-HOSTCXX:=$(HOSTCCACHE) $(HOSTCXX)
-endif
-
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 
 
