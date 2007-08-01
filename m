From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:54:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20070801085458.AD9E2A5E34@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:54:56 -0700 (Wed, 01 Aug 2007)
New Revision: 19382

Log:
Revert bad patch of mpg123

Modified:
   trunk/buildroot/package/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-08-01 08:41:45 UTC (rev 19381)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-08-01 08:54:56 UTC (rev 19382)
@@ -56,9 +56,7 @@
 mpg123:	uclibc $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
 mpg123-clean:
-	@if [ -d $(MPG123_DIR)/Makefile ] ; then \
-		$(MAKE) -C $(MPG123_DIR) clean ; \
-	fi;
+	-$(MAKE) -C $(MPG123_DIR) clean
 
 mpg123-dirclean:
 	rm -rf $(MPG123_DIR) $(MPG123_DIR)
