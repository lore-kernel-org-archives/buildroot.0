From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 12:46:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070928194658.EE60E3006F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 12:46:58 -0700 (Fri, 28 Sep 2007)
New Revision: 20089

Log:
Add some more host tools

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-28 19:43:26 UTC (rev 20088)
+++ trunk/buildroot/Makefile	2007-09-28 19:46:58 UTC (rev 20089)
@@ -91,18 +91,26 @@
 ifndef HOSTCXX
 HOSTCXX:=g++
 endif
+ifndef HOSTCPP
+HOSTCPP:=cpp
+endif
 ifndef HOSTLD
 HOSTLD:=ld
 endif
 ifndef HOSTLN
 HOSTLN:=ln
 endif
+ifndef HOSTNM
+HOSTNM:=nm
+endif
 HOSTAR:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)" || type -p $(HOSTAR) || echo ar)
 HOSTAS:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)" || type -p $(HOSTAS) || echo as)
 HOSTCC:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)" || type -p $(HOSTCC) || echo gcc)
 HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p $(HOSTCXX) || echo g++)
+HOSTCPP:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCPP)" || type -p $(HOSTCPP) || echo cpp)
 HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
+HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif
