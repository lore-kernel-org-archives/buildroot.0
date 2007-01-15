From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 15 Jan 2007 09:34:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070115173459.72C3648581@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-15 09:34:58 -0800 (Mon, 15 Jan 2007)
New Revision: 17314

Log:
- andersee, why was this duplicated and hardcoded here?


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.mk


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.mk
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.mk	2007-01-15 16:02:45 UTC (rev 17313)
+++ trunk/buildroot/target/device/x86/i386/linux26.mk	2007-01-15 17:34:58 UTC (rev 17314)
@@ -6,13 +6,16 @@
 ifneq ($(filter $(TARGETS),linux26),)
 
 
+ifeq ($(LINUX_HEADERS_VERSION),)
 # Version of Linux to download and then apply patches to
 DOWNLOAD_LINUX26_VERSION=2.6.19.1
 # Version of Linux after applying any patches
 LINUX26_VERSION=2.6.19.1
+else
+DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
+LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
+endif
 
-
-
 LINUX26_SOURCE=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
 LINUX26_BZCAT:=$(BZCAT)
 LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
