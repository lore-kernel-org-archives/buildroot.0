From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080804190848.BE9373C913@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:48 -0700 (Mon, 04 Aug 2008)
New Revision: 23042

Log:
Makefile.autotools.in: remove extra newlines in MESSAGE macro

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-08-04 19:08:45 UTC (rev 23041)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-08-04 19:08:48 UTC (rev 23042)
@@ -110,9 +110,7 @@
 INFLATE.tar = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE = @echo $(TERM_BOLD); \
-	echo ">>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)"; \
-	echo $(TERM_RESET)
+MESSAGE = @echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
 TERM_BOLD = #$(shell tput bold)
 TERM_RESET = #$(shell tput rmso)
 
