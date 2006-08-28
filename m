From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 28 Aug 2006 06:46:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20060828134639.628E6486A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-28 06:46:38 -0700 (Mon, 28 Aug 2006)
New Revision: 16001

Log:
- use cross strip instead of host strip; closes #773


Modified:
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk


Changeset:
Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2006-08-28 13:29:41 UTC (rev 16000)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2006-08-28 13:46:38 UTC (rev 16001)
@@ -97,8 +97,8 @@
   $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_SETKEY) \
   $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOON) \
   $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOONCTL) 
-	make -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) install
-	strip --strip-unneeded --remove-section=.comment \
+	$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) install
+	$(STRIP) --strip-unneeded --remove-section=.comment \
           --remove-section=.note \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
