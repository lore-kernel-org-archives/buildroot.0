From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Oct 2006 06:02:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/uemacs
Message-ID: <20061006130211.AD82C48568@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-06 06:02:11 -0700 (Fri, 06 Oct 2006)
New Revision: 16320

Log:
- passing the target arch in isn't useful


Modified:
   trunk/buildroot/package/uemacs/uemacs.mk


Changeset:
Modified: trunk/buildroot/package/uemacs/uemacs.mk
===================================================================
--- trunk/buildroot/package/uemacs/uemacs.mk	2006-10-06 13:01:29 UTC (rev 16319)
+++ trunk/buildroot/package/uemacs/uemacs.mk	2006-10-06 13:02:11 UTC (rev 16320)
@@ -22,7 +22,7 @@
 
 $(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
 	$(MAKE) -C $(UEMACS_DIR) \
-	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) -march=$(ARCH)" LIBS=-lcurses
+	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS=-lcurses
 	$(STRIP) $(UEMACS_DIR)/$(UEMACS_BINARY)
 
 $(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
