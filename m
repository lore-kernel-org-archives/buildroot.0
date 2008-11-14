From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 14 Nov 2008 03:06:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20081114110602.0E1AB3C8C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-11-14 03:06:01 -0800 (Fri, 14 Nov 2008)
New Revision: 24038

Log:
Fix build. Use TARGET_CONFIGURE_OPTS as environment rather than as argument of make to avoid overwriting dropbear's CFLAGS

Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2008-11-14 10:06:44 UTC (rev 24037)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2008-11-14 11:06:01 UTC (rev 24038)
@@ -42,7 +42,7 @@
 	touch $@
 
 $(DROPBEAR_DIR)/$(DROPBEAR_BINARY): $(DROPBEAR_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LD=$(TARGET_CC) \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) LD=$(TARGET_CC) \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" \
 		MULTI=1 SCPPROGRESS=1 -C $(DROPBEAR_DIR)
 
