From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Jun 2007 05:00:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070620120056.23E99485D1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-20 05:00:54 -0700 (Wed, 20 Jun 2007)
New Revision: 18865

Log:
- add OPENMP configure handling (needed for e.g. gettext).


Modified:
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-06-20 11:26:36 UTC (rev 18864)
+++ trunk/buildroot/toolchain/Makefile.in	2007-06-20 12:00:54 UTC (rev 18865)
@@ -10,6 +10,13 @@
 MULTILIB:=--disable-multilib
 endif
 
+ifeq ($(BR2_ENABLE_OPENMP),y)
+OPENMP:=--enable-openmp
+else
+OPENMP:=--disable-openmp
+endif
+
+
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 BR2_SYSROOT_PREFIX=# nothing, straight into /usr
 BR2_SYSROOT_STAGING_DESTDIR=DESTDIR=$(STAGING_DIR)/
