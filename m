From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 28 Jan 2007 05:34:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20070128133403.B88E8485BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-28 05:34:02 -0800 (Sun, 28 Jan 2007)
New Revision: 17596

Log:
- correct improper prerequisite of -source target


Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-01-28 13:16:58 UTC (rev 17595)
+++ trunk/buildroot/package/readline/readline.mk	2007-01-28 13:34:02 UTC (rev 17596)
@@ -75,7 +75,7 @@
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-readline-source:  $(DL_DIR)/$(READLINE_SOURCE)   $(READLINE_DIR)/.unpacked
+readline-source:  $(DL_DIR)/$(READLINE_SOURCE)
 
 ifeq ($(strip $(BR2_READLINE)),y)
 TARGETS+=readline
