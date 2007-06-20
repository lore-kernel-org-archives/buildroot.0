From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Jun 2007 06:18:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libevent
Message-ID: <20070620131856.2F7EF4860C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-20 06:18:53 -0700 (Wed, 20 Jun 2007)
New Revision: 18868

Log:
- you have to escape the asterisk


Modified:
   trunk/buildroot/package/libevent/libevent.mk


Changeset:
Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-06-20 12:42:03 UTC (rev 18867)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-06-20 13:18:53 UTC (rev 18868)
@@ -19,7 +19,7 @@
 libevent-unpacked: $(LIBEVENT_DIR)/.unpacked
 $(LIBEVENT_DIR)/.unpacked: $(DL_DIR)/$(LIBEVENT_SOURCE)
 	$(LIBEVENT_CAT) $(DL_DIR)/$(LIBEVENT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBEVENT_DIR) package/libevent/ *.patch
+	toolchain/patch-kernel.sh $(LIBEVENT_DIR) package/libevent/ \*.patch
 	touch $(LIBEVENT_DIR)/.unpacked
 
 $(LIBEVENT_DIR)/.configured: $(LIBEVENT_DIR)/.unpacked
