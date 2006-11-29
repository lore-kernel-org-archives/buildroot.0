From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 11:02:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20061129190247.046F448591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 11:02:47 -0800 (Wed, 29 Nov 2006)
New Revision: 16724

Log:
- use the HOSTCC as set by the user.


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-11-29 18:59:43 UTC (rev 16723)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-11-29 19:02:47 UTC (rev 16724)
@@ -20,6 +20,7 @@
 	chmod a+x $(GENEXT2_DIR)/configure
 	(cd $(GENEXT2_DIR); rm -rf config.cache; \
 		./configure \
+		CC="$(HOSTCC)" \
 		--prefix=$(STAGING_DIR) \
 	);
 	touch  $(GENEXT2_DIR)/.configured
