From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 28 Apr 2007 10:09:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070428170944.E18AD48086@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-04-28 10:09:44 -0700 (Sat, 28 Apr 2007)
New Revision: 18528

Log:
Create symlink for 'usr/include' in the staging directory so that packages like zlib and others who expect that to exist will install properly.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-04-28 17:08:57 UTC (rev 18527)
+++ trunk/buildroot/Makefile	2007-04-28 17:09:44 UTC (rev 18528)
@@ -107,6 +107,7 @@
 	@mkdir -p $(STAGING_DIR)/include
 	@mkdir -p $(STAGING_DIR)/usr
 	@mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)
+	@ln -snf ../include $(STAGING_DIR)/usr/include
 	@ln -snf ../lib $(STAGING_DIR)/usr/lib
 	@ln -snf ../lib $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib
 
