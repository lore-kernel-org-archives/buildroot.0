From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  1 May 2008 07:11:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/festival: lexicons
	voices
Message-ID: <20080501141131.27DF83C669@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-01 07:11:30 -0700 (Thu, 01 May 2008)
New Revision: 21907

Log:
fix festival file downloaders

Modified:
   trunk/buildroot/package/festival/lexicons/festlex.mk
   trunk/buildroot/package/festival/voices/festvox.mk


Changeset:
Modified: trunk/buildroot/package/festival/lexicons/festlex.mk
===================================================================
--- trunk/buildroot/package/festival/lexicons/festlex.mk	2008-05-01 14:07:11 UTC (rev 21906)
+++ trunk/buildroot/package/festival/lexicons/festlex.mk	2008-05-01 14:11:30 UTC (rev 21907)
@@ -12,13 +12,13 @@
 $(FESTLEX_STATUS_DIR)/.downloaded:
 	mkdir -p $(FESTLEX_STATUS_DIR)
 ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX1)
+	$(Q)test -e $(DL_DIR)/$(LEX1) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX1)
 endif
 ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX2)
+	$(Q)test -e $(DL_DIR)/$(LEX2) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX2)
 endif
 ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX3)
+	$(Q)test -e $(DL_DIR)/$(LEX3) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX3)
 endif
 	touch $@
 

Modified: trunk/buildroot/package/festival/voices/festvox.mk
===================================================================
--- trunk/buildroot/package/festival/voices/festvox.mk	2008-05-01 14:07:11 UTC (rev 21906)
+++ trunk/buildroot/package/festival/voices/festvox.mk	2008-05-01 14:11:30 UTC (rev 21907)
@@ -21,35 +21,35 @@
 $(FESTVOX_STATUS_DIR)/.downloaded:
 	mkdir -p $(FESTVOX_STATUS_DIR)
 ifeq ($(BR2_PACKAGE_FESTVOX_AWB),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE1)
+	$(Q)test -e $(DL_DIR)/$(VOICE1) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE1)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_BDL),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE2)
+	$(Q)test -e $(DL_DIR)/$(VOICE2) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE2)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_JMK),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE3)
+	$(Q)test -e $(DL_DIR)/$(VOICE3) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE3)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_SLT),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE4)
+	$(Q)test -e $(DL_DIR)/$(VOICE4) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE4)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_AWB_MULTISYN),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE5)
+	$(Q)test -e $(DL_DIR)/$(VOICE5) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE5)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_JMK_MULTISYN),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE6)
+	$(Q)test -e $(DL_DIR)/$(VOICE6) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE6)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_KAL_SIXTEENK),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE7)
+	$(Q)test -e $(DL_DIR)/$(VOICE7) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE7)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_KED_EIGHTK),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE8)
+	$(Q)test -e $(DL_DIR)/$(VOICE8) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE8)
 endif
 ifeq ($(BR2_PACKAGE_FESTVOX_KED_SIXTEENK),y)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE9)
+	$(Q)test -e $(DL_DIR)/$(VOICE9) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE9)
 endif
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND1)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND2)
-	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND3)
+	$(Q)test -e $(DL_DIR)/$(FRONTEND1) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND1)
+	$(Q)test -e $(DL_DIR)/$(FRONTEND2) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND2)
+	$(Q)test -e $(DL_DIR)/$(FRONTEND3) || $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND3)
 
 	touch $@
 
