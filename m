From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 18 Sep 2007 10:10:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070918171058.7CCA9A495E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-18 10:10:56 -0700 (Tue, 18 Sep 2007)
New Revision: 19878

Log:
- patch the correct dir


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-18 13:12:25 UTC (rev 19877)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-18 17:10:56 UTC (rev 19878)
@@ -129,7 +129,7 @@
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 endif
 ifeq ($(BR2_PACKAGE_OPENSWAN),y)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
+	toolchain/patch-kernel.sh $(LINUX26_DIR) package/openswan \
 		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 endif
 ifneq ($(LINUX26_PATCH_DIR),)
