From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 04:57:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061117125721.E4CA2485FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 04:57:21 -0800 (Fri, 17 Nov 2006)
New Revision: 16561

Log:
- Adjust the install prefix for current busybox.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-11-17 12:47:50 UTC (rev 16560)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-11-17 12:57:21 UTC (rev 16561)
@@ -40,6 +40,11 @@
 	if [ -f $(BUSYBOX_DIR)/Rules.mak ]; then \
 		$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\
 		PREFIX=$(TARGET_DIR),;" $(BUSYBOX_DIR)/Rules.mak ; \
+	else \
+		$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
+			$(BUSYBOX_DIR)/.config ; \
+		$(SED) s,^PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
+			$(BUSYBOX_DIR)/.config ; \
 	fi
 ifeq ($(BR2_LARGEFILE),y)
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=y/;" $(BUSYBOX_DIR)/.config
