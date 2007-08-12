From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:35:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20070812233520.84CBBA6853@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:35:20 -0700 (Sun, 12 Aug 2007)
New Revision: 19477

Log:
grep depends on gettext

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2007-08-12 23:33:44 UTC (rev 19476)
+++ trunk/buildroot/package/grep/grep.mk	2007-08-12 23:35:20 UTC (rev 19477)
@@ -64,7 +64,7 @@
 	    cp -a $(GNUGREP_DIR)/src/grep $(GNUGREP_DIR)/src/egrep \
 		$(GNUGREP_DIR)/src/fgrep $(TARGET_DIR)/bin/; fi
 
-grep: uclibc grep-target_binary
+grep: uclibc gettext libintl grep-target_binary
 
 grep-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUGREP_DIR) uninstall
