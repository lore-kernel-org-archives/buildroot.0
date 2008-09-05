From: hamish at uclibc.org <hamish@uclibc.org>
Date: Thu,  4 Sep 2008 18:03:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20080905010349.6D501F800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-04 18:03:45 -0700 (Thu, 04 Sep 2008)
New Revision: 23325

Log:
Version bump to 2.3.7
This package should be converted to use Makefile.autotools.in by someone who uses it..


Modified:
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2008-09-04 16:16:47 UTC (rev 23324)
+++ trunk/buildroot/package/freetype/Config.in	2008-09-05 01:03:45 UTC (rev 23325)
@@ -16,12 +16,12 @@
 	config BR2_FREETYPE_VERSION_2_2_1
 		bool "Freetype 2.2.1"
 
-	config BR2_FREETYPE_VERSION_2_3_5
-		bool "Freetype 2.3.5"
+	config BR2_FREETYPE_VERSION_2_3_7
+		bool "Freetype 2.3.7"
 
 endchoice
 
 config BR2_FREETYPE_VERSION
 	string
 	default "2.2.1"		if BR2_FREETYPE_VERSION_2_2_1
-	default "2.3.5"		if BR2_FREETYPE_VERSION_2_3_5
+	default "2.3.7"		if BR2_FREETYPE_VERSION_2_3_7

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-09-04 16:16:47 UTC (rev 23324)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-09-05 01:03:45 UTC (rev 23325)
@@ -16,7 +16,7 @@
 
 $(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
 	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ \*.patch
+	toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ freetype-$(FREETYPE_VERSION)-\*.patch
 	$(CONFIG_UPDATE) $(FREETYPE_DIR)
 	$(CONFIG_UPDATE) $(FREETYPE_DIR)/builds/unix
 	touch $@
