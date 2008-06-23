From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Jun 2008 06:47:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080623134749.009043C2B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-23 06:47:37 -0700 (Mon, 23 Jun 2008)
New Revision: 22481

Log:
Makefile: don't include .config from TOPDIR

If we ever want to support building out of tree, having the .config in the
tree is probably not what we want.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-06-23 13:40:34 UTC (rev 22480)
+++ trunk/buildroot/Makefile	2008-06-23 13:47:37 UTC (rev 22481)
@@ -44,7 +44,7 @@
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 ifeq ($(BOARD),)
 # if "make BOARD=xyz" command
--include $(TOPDIR).config
+-include .config
 else
 # if "make" command
 -include $(BR2_LOCAL)/$(BOARD)/$(BOARD).config
