From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 06:45:13 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gzip
Message-ID: <20061117144513.33922485DF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 06:45:12 -0800 (Fri, 17 Nov 2006)
New Revision: 16564

Log:
- fix typo introduced in my global search and replace.


Modified:
   trunk/buildroot/package/gzip/Config.in
   trunk/buildroot/package/gzip/gzip.mk


Changeset:
Modified: trunk/buildroot/package/gzip/Config.in
===================================================================
--- trunk/buildroot/package/gzip/Config.in	2006-11-17 13:54:29 UTC (rev 16563)
+++ trunk/buildroot/package/gzip/Config.in	2006-11-17 14:45:12 UTC (rev 16564)
@@ -3,6 +3,6 @@
 	default n
 	help
 	  Standard GNU compressor.  Provides things like gzip, 
-	  gunzip, g$(ZCAT), etc...
+	  gunzip, gzcat, etc...
 
 	  http://www.gnu.org/software/gzip/gzip.html

Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2006-11-17 13:54:29 UTC (rev 16563)
+++ trunk/buildroot/package/gzip/gzip.mk	2006-11-17 14:45:12 UTC (rev 16564)
@@ -57,7 +57,7 @@
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	(cd $(TARGET_DIR)/bin; \
 	ln -snf gzip gunzip; \
-	ln -snf gzip $(ZCAT); \
+	ln -snf gzip zcat; \
 	ln -snf zdiff zcmp; \
 	ln -snf zgrep zegrep; \
 	ln -snf zgrep zfgrep;)
