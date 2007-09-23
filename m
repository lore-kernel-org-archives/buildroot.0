From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 07:24:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpg123
Message-ID: <20070923142413.056BB3009F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 07:24:13 -0700 (Sun, 23 Sep 2007)
New Revision: 19973

Log:
Use correct location of mpg123 binary

Modified:
   trunk/buildroot/package/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/mpg123/mpg123.mk	2007-09-23 14:23:16 UTC (rev 19972)
+++ trunk/buildroot/package/mpg123/mpg123.mk	2007-09-23 14:24:13 UTC (rev 19973)
@@ -8,8 +8,8 @@
 MPG123_CAT:=$(BZCAT)
 MPG123_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 MPG123_DIR:=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
-MPG123_BIN:=mpg123
-MPG123_TARGET_BIN:=usr/bin/$(MPG123_BIN)
+MPG123_BIN:=src/mpg123
+MPG123_TARGET_BIN:=usr/bin/mpg123
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
@@ -50,7 +50,7 @@
 	$(MAKE) -C $(MPG123_DIR)
 
 $(TARGET_DIR)/$(MPG123_TARGET_BIN): $(MPG123_DIR)/$(MPG123_BIN)
-	$(INSTALL) -D $(MPG123_DIR)/src/$(MPG123_BIN) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
+	$(INSTALL) -D $(MPG123_DIR)/$(MPG123_BIN) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
 mpg123: uclibc $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
