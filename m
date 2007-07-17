From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 05:04:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/socat
Message-ID: <20070717120437.4DB16A6AAD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 05:04:36 -0700 (Tue, 17 Jul 2007)
New Revision: 19129

Log:
Avoid constant rebuild of 'socat'

Modified:
   trunk/buildroot/package/socat/socat.mk


Changeset:
Modified: trunk/buildroot/package/socat/socat.mk
===================================================================
--- trunk/buildroot/package/socat/socat.mk	2007-07-17 12:02:44 UTC (rev 19128)
+++ trunk/buildroot/package/socat/socat.mk	2007-07-17 12:04:36 UTC (rev 19129)
@@ -57,6 +57,7 @@
 $(SOCAT_WORKDIR)/.installed: $(SOCAT_WORKDIR)/socat
 	mkdir -p $(TARGET_DIR)/usr/man/man1
 	$(MAKE) -C $(SOCAT_WORKDIR) install prefix=$(TARGET_DIR)/usr DESTDIR=$(TARGET_DIR)
+	touch $@
 
 socat:	uclibc $(SOCAT_WORKDIR)/.installed
 
