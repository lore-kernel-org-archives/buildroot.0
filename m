From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:32:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmp
Message-ID: <20061202183233.97660485EE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:32:33 -0800 (Sat, 02 Dec 2006)
New Revision: 16759

Log:
- pass target specific settings to configure when configuring for the target.


Modified:
   trunk/buildroot/package/gmp/gmp.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2006-12-02 18:30:42 UTC (rev 16758)
+++ trunk/buildroot/package/gmp/gmp.mk	2006-12-02 18:32:33 UTC (rev 16759)
@@ -31,6 +31,8 @@
 $(GMP_DIR)/.configured: $(GMP_DIR)/.unpacked
 	(cd $(GMP_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		CC_FOR_BUILD="$(HOSTCC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(GMP_BE) \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
