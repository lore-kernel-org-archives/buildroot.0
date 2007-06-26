From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 07:02:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070626140230.4743EA4590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 07:02:29 -0700 (Tue, 26 Jun 2007)
New Revision: 18938

Log:
- pass -msoft-float if BR2_SOFT_FLOAT is set. Closes bug #1069


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-06-26 13:26:51 UTC (rev 18937)
+++ trunk/buildroot/package/Makefile.in	2007-06-26 14:02:29 UTC (rev 18938)
@@ -34,11 +34,19 @@
 TARGET_CFLAGS+=-fPIC -DPIC
 endif # PIC for dynamic objects on x86_64
 endif
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+TARGET_CFLAGS+=-msoft-float
+endif
+
+
 # else it's an external toolchain
+#########################################################################
 else
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include -I$(TOOLCHAIN_EXTERNAL_PATH)/$(TOOLCHAIN_EXTERNAL_PREFIX)/include
 TARGET_LDFLAGS=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
+#########################################################################
 
 ifndef HOSTAR
 HOSTAR:=ar
