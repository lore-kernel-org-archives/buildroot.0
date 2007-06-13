From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Jun 2007 11:14:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070613181401.369AF4800C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-13 11:13:51 -0700 (Wed, 13 Jun 2007)
New Revision: 18818

Log:
- allow for patching snapshots. Files are named uClibc.*.patch which is unambiguous wrt release patches.
  sjhill, this "reverts" your r18601. I *need* to be able to test patches in a convenient manner. Please ping me if you are uncomfortable with this change so we can discuss it, thanks.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-13 16:23:59 UTC (rev 18817)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-13 18:13:51 UTC (rev 18818)
@@ -91,6 +91,8 @@
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
+else
+	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc.\*.patch
 endif
 ifneq ($(BR2_ENABLE_LOCALE),)
 	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
