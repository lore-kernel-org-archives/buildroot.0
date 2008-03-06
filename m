From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:11:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20080306181151.D81EB1201F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:11:51 -0800 (Thu, 06 Mar 2008)
New Revision: 21197

Log:
cleanup grep makefile

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2008-03-06 18:11:21 UTC (rev 21196)
+++ trunk/buildroot/package/grep/grep.mk	2008-03-06 18:11:51 UTC (rev 21197)
@@ -23,7 +23,7 @@
 	$(GNUGREP_CAT) $(GNUGREP_DIR).xxx/grep_$(GNUGREP_VERSION).tar.gz | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -rf $(GNUGREP_DIR).xxx
 	$(CONFIG_UPDATE) $(GNUGREP_DIR)
-	touch $(GNUGREP_DIR)/.unpacked
+	touch $@
 
 $(GNUGREP_DIR)/.configured: $(GNUGREP_DIR)/.unpacked
 	(cd $(GNUGREP_DIR); rm -rf config.cache; \
@@ -49,7 +49,7 @@
 		--disable-perl-regexp \
 		--without-included-regex \
 	)
-	touch $(GNUGREP_DIR)/.configured
+	touch $@
 
 $(GNUGREP_DIR)/$(GNUGREP_BINARY): $(GNUGREP_DIR)/.configured
 	$(MAKE) -C $(GNUGREP_DIR)
