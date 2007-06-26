From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 23:24:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070626062438.550D8A45E2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 23:24:37 -0700 (Mon, 25 Jun 2007)
New Revision: 18936

Log:
- force DirectFB to detect PAGE_SIZE via sysconf (Ivan Kuten)


Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-06-25 22:55:34 UTC (rev 18935)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-06-26 06:24:37 UTC (rev 18936)
@@ -26,6 +26,7 @@
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	ac_cv_header_linux_wm97xx_h=no \
 	ac_cv_header_linux_sisfb_h=no \
+	ac_cv_header_asm_page_h=no \
 	./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
