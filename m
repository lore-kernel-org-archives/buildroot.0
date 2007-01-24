From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 07:52:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20070124155247.2BBCE48599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 07:52:46 -0800 (Wed, 24 Jan 2007)
New Revision: 17501

Log:
- fix spurious rebuilds caused by at


Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-01-24 15:12:12 UTC (rev 17500)
+++ trunk/buildroot/package/at/at.mk	2007-01-24 15:52:46 UTC (rev 17501)
@@ -9,6 +9,7 @@
 AT_DIR:=$(BUILD_DIR)/at-$(AT_VER)
 AT_CAT:=$(ZCAT)
 AT_TARGET_BINARY:=usr/bin/at
+AT_BINARY:=at
 
 $(DL_DIR)/$(AT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AT_SITE)/$(AT_SOURCE)
