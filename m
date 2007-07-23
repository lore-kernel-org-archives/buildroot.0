From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 01:35:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070723083506.8CF40A65E5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 01:35:06 -0700 (Mon, 23 Jul 2007)
New Revision: 19205

Log:
Update Config of gettext subdir

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-07-23 08:33:41 UTC (rev 19204)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-07-23 08:35:06 UTC (rev 19205)
@@ -26,6 +26,7 @@
 	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
 	$(CONFIG_UPDATE) $(@D)
+	$(CONFIG_UPDATE) $(GETTEXT_DIR)/build-aux
 	touch $@
 
 ifeq ($(strip $(BR2_TOOLCHAIN_EXTERNAL)),y)
