From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Mon,  7 Apr 2008 12:26:05 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/festival/speech-tools
Message-ID: <20080407192606.0537F3C3AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-07 12:26:02 -0700 (Mon, 07 Apr 2008)
New Revision: 21663

Log:
another minor installer fix for festival

Modified:
   trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch


Changeset:
Modified: trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
===================================================================
--- trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch	2008-04-07 07:59:08 UTC (rev 21662)
+++ trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch	2008-04-07 19:26:02 UTC (rev 21663)
@@ -36,11 +36,12 @@
 -
 +	@$(ECHO_N) "Install Scheme Libraries:"
 +	@main=`pwd` ;\
-+	cp -a "$$main/../../lib" "$(DESTDIR)/usr/share/festival";\
++	mkdir -p "$(DESTDIR)/usr/share/festival"; cp -a "$$main/../../lib" "$(DESTDIR)/usr/share/festival";\
 +	for i in `find "$(DESTDIR)/usr/share/festival/lib" -name Makefile`;\
 +		do \
 +		rm "$$i"; \
 +	done
-+
- .link_main:
- 	@$(MAKE) MADE_FROM_ABOVE=1 --no-print-directory -C '$(PROJECT_MAIN_DIR)' BIN=TOP/$(DIRNAME) LIBDIR=MAIN/TOP/$(PROJECT_LIBRARY_DIR) MAIN='$($(PROJECT_PREFIX)_HOME)' .link_main$(S)
\ No newline at end of file
++ 
+ .link_main: 
+ 	@$(MAKE) MADE_FROM_ABOVE=1 --no-print-directory -C '$(PROJECT_MAIN_DIR)' BIN=TOP/$(DIRNAME) LIBDIR=MAIN/TOP/$(PROJECT_LIBRARY_DIR) MAIN='$($(PROJECT_PREFIX)_HOME)' .link_main$(S)
+ 
