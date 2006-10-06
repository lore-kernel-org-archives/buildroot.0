From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Oct 2006 05:59:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/makedevs
Message-ID: <20061006125934.83F6748568@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-06 05:59:33 -0700 (Fri, 06 Oct 2006)
New Revision: 16317

Log:
- use the HOSTCC given by the user.


Modified:
   trunk/buildroot/target/makedevs/makedevs.mk


Changeset:
Modified: trunk/buildroot/target/makedevs/makedevs.mk
===================================================================
--- trunk/buildroot/target/makedevs/makedevs.mk	2006-10-06 09:49:47 UTC (rev 16316)
+++ trunk/buildroot/target/makedevs/makedevs.mk	2006-10-06 12:59:33 UTC (rev 16317)
@@ -13,7 +13,7 @@
 	cp target/makedevs/makedevs.c $(MAKEDEVS_DIR)
 
 $(MAKEDEVS_DIR)/makedevs: $(MAKEDEVS_DIR)/makedevs.c
-	gcc -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $(MAKEDEVS_DIR)/makedevs
+	$(HOSTCC) -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $(MAKEDEVS_DIR)/makedevs
 	touch -c $(MAKEDEVS_DIR)/makedevs
 
 $(STAGING_DIR)/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
