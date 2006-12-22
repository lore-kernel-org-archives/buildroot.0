From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 04:11:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20061222121107.1CF4048584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 04:11:06 -0800 (Fri, 22 Dec 2006)
New Revision: 17048

Log:
- add some more useful hints


Modified:
   trunk/buildroot/docs/README


Changeset:
Modified: trunk/buildroot/docs/README
===================================================================
--- trunk/buildroot/docs/README	2006-12-22 11:47:19 UTC (rev 17047)
+++ trunk/buildroot/docs/README	2006-12-22 12:11:06 UTC (rev 17048)
@@ -13,5 +13,23 @@
 
  -Erik
 
+More finegrained configuration:
+===============================
+
+You can specify a config-file for uClibc:
+$ make UCLIBC_CONFIG_FILE=/my/uClibc.config
+
+To use a non-standart host-compiler (if you do not have 'gcc'),
+make sure that the compiler is in your PATH and that the library paths are
+setup properly, if your compiler is built dynamically:
+$ make HOSTCC=gcc-4.3.orig HOSTCXX=gcc-4.3-mine
+
+Depending on your configuration, there are some targets you can use to
+use menuconfig of certain packages. This includes:
+$ make HOSTCC=gcc-4.3 linux26-menuconfig
+$ make HOSTCC=gcc-4.3 uclibc-menuconfig
+$ make HOSTCC=gcc-4.3 busybox-menuconfig
+
 Please feed suggestions, bug reports, insults, and bribes back to:
 	Erik Andersen <andersen@codepoet.org>
+or the buildroot mailing list.
