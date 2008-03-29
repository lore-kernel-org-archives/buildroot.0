From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 29 Mar 2008 09:23:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080329162316.C78283C51A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-29 09:23:16 -0700 (Sat, 29 Mar 2008)
New Revision: 21558

Log:
* Fixed uClibc sub-x86 arch selection


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-03-29 16:07:46 UTC (rev 21557)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-03-29 16:23:16 UTC (rev 21558)
@@ -353,7 +353,31 @@
 endif
 ifeq ($(BR2_x86_i586),y)
 	$(SED) 's,# CONFIG_586 is not set,CONFIG_586=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
+endif 
+ifeq ($(BR2_x86_pentium_mmx),y)
+	$(SED) 's,# CONFIG_586MMX is not set,CONFIG_586MMX=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_pentium2),y)
+	$(SED) 's,# CONFIG_PENTIUMII is not set,CONFIG_PENTIUMII=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_pentium3),y)
+	$(SED) 's,# CONFIG_PENTIUMIII is not set,CONFIG_PENTIUMIII=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_pentium4),y)
+	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_pentium_m),y)
+	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_pentiumpro),y)
+	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_nocona),y)
+	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
+ifeq ($(BR2_x86_core2),y)
+	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
 ifeq ($(BR2_x86_i686),y)
 	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
