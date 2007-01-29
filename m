From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 12:15:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20070129201524.B29A04857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 12:15:24 -0800 (Mon, 29 Jan 2007)
New Revision: 17644

Log:
- it misses Carp/Heavy.pm but is unable to diagnose this fact and just throws "unknown error".
  Now automake at least fails with an explicit error..


Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2007-01-29 20:06:00 UTC (rev 17643)
+++ trunk/buildroot/package/microperl/microperl.mk	2007-01-29 20:15:24 UTC (rev 17644)
@@ -16,7 +16,7 @@
 ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
 MICROPERL_MODS+=File/Basename.pm Errno.pm Config.pm IO/File.pm Symbol.pm \
 	SelectSaver.pm IO/Seekable.pm IO/Handle.pm IO.pm XSLoader.pm \
-	DynaLoader.pm AutoLoader.pm
+	DynaLoader.pm AutoLoader.pm Carp/Heavy.pm
 endif
 $(DL_DIR)/$(MICROPERL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MICROPERL_SITE)/$(MICROPERL_SOURCE)
