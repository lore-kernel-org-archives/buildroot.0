From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 05:16:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ed
Message-ID: <20070925121640.25C103006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 05:16:39 -0700 (Tue, 25 Sep 2007)
New Revision: 20014

Log:
- add missing ed-source target.


Modified:
   trunk/buildroot/package/ed/ed.mk


Changeset:
Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-09-25 12:01:27 UTC (rev 20013)
+++ trunk/buildroot/package/ed/ed.mk	2007-09-25 12:16:39 UTC (rev 20014)
@@ -40,6 +40,8 @@
 
 ed: uclibc $(TARGET_DIR)/$(ED_TARGET_BINARY)
 
+ed-source: $(DL_DIR)/$(ED_SOURCE)
+
 ed-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(ED_DIR) uninstall
 	-$(MAKE) -C $(ED_DIR) clean
