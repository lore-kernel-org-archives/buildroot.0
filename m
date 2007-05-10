From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  9 May 2007 19:37:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070510023744.80F4C4800C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-09 19:37:44 -0700 (Wed, 09 May 2007)
New Revision: 18601

Log:
If we are using snapshot, don't even attempt to try and patch anything.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-05-10 02:37:16 UTC (rev 18600)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-05-10 02:37:44 UTC (rev 18601)
@@ -83,7 +83,9 @@
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
+endif
 ifneq ($(BR2_ENABLE_LOCALE),)
 	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
 endif
