From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 29 Mar 2008 10:34:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080329173424.207703C538@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-29 10:34:23 -0700 (Sat, 29 Mar 2008)
New Revision: 21560

Log:
PentiumPro is not Pentium4 but i686


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-03-29 17:26:10 UTC (rev 21559)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-03-29 17:34:23 UTC (rev 21560)
@@ -357,6 +357,12 @@
 ifeq ($(BR2_x86_pentium_mmx),y)
 	$(SED) 's,# CONFIG_586MMX is not set,CONFIG_586MMX=y,g' $(UCLIBC_DIR)/.oldconfig
 endif 
+ifeq ($(BR2_x86_i686),y)
+	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_x86_pentiumpro),y)
+	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
+endif 
 ifeq ($(BR2_x86_pentium2),y)
 	$(SED) 's,# CONFIG_PENTIUMII is not set,CONFIG_PENTIUMII=y,g' $(UCLIBC_DIR)/.oldconfig
 endif 
@@ -369,19 +375,13 @@
 ifeq ($(BR2_x86_pentium_m),y)
 	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
 endif 
-ifeq ($(BR2_x86_pentiumpro),y)
-	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif 
 ifeq ($(BR2_x86_nocona),y)
 	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
 endif 
 ifeq ($(BR2_x86_core2),y)
 	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
 endif 
-ifeq ($(BR2_x86_i686),y)
-	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
-endif
 
 $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
