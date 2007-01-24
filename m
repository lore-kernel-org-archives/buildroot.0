From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 11:12:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/argus
Message-ID: <20070124191231.2955A48599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 11:12:31 -0800 (Wed, 24 Jan 2007)
New Revision: 17505

Log:
- strip -s


Modified:
   trunk/buildroot/package/argus/argus.mk


Changeset:
Modified: trunk/buildroot/package/argus/argus.mk
===================================================================
--- trunk/buildroot/package/argus/argus.mk	2007-01-24 19:11:13 UTC (rev 17504)
+++ trunk/buildroot/package/argus/argus.mk	2007-01-24 19:12:31 UTC (rev 17505)
@@ -67,7 +67,7 @@
 
 $(TARGET_DIR)/$(ARGUS_TARGET_BINARY): $(ARGUS_DIR)/$(ARGUS_BINARY)
 	cp -dpf $(ARGUS_DIR)/$(ARGUS_BINARY) $@
-	$(STRIP) $@
+	$(STRIP) -s $@
 
 argus: uclibc libpcap $(TARGET_DIR)/$(ARGUS_TARGET_BINARY)
 
