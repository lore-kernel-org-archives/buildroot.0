From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  8 Jul 2007 21:26:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070709042652.DB46A30046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-08 21:26:49 -0700 (Sun, 08 Jul 2007)
New Revision: 19048

Log:
sh needs '-c' to run a binary

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-08 20:51:19 UTC (rev 19047)
+++ trunk/buildroot/Makefile	2007-07-09 04:26:49 UTC (rev 19048)
@@ -78,11 +78,11 @@
 ifndef HOSTLD
 HOSTLD:=ld
 endif
-HOSTAR:=$(shell $(CONFIG_SHELL) which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
-HOSTAS:=$(shell $(CONFIG_SHELL) which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTCC:=$(shell $(CONFIG_SHELL) which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
-HOSTCXX:=$(shell $(CONFIG_SHELL) which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
-HOSTLD:=$(shell $(CONFIG_SHELL) which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+HOSTAR :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)"  || type -p $(HOSTAR)  || echo ar)
+HOSTAS :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)"  || type -p $(HOSTAS)  || echo as)
+HOSTCC :=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)"  || type -p $(HOSTCC)  || echo gcc)
+HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p $(HOSTCXX) || echo g++)
+HOSTLD :=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)"  || type -p $(HOSTLD)  || echo ld)
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif
