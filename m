From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 May 2007 08:41:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
Message-ID: <20070523154148.EC64048081@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-23 08:41:48 -0700 (Wed, 23 May 2007)
New Revision: 18675

Log:
Strip binaries at install. Closes #1365

Modified:
   trunk/buildroot/package/ncftp/ncftp.mk


Changeset:
Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2007-05-23 15:22:50 UTC (rev 18674)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2007-05-23 15:41:48 UTC (rev 18675)
@@ -41,6 +41,7 @@
 
 $(TARGET_DIR)/usr/bin/ncftp $(TARGET_DIR)/usr/bin/ncftp%: $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS))
 	$(INSTALL) -m 0755 $(NCFTP_DIR)/bin/$(notdir $@) $(TARGET_DIR)/usr/bin
+	$(STRIP) -s $@
 
 ncftp: uclibc $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
 
