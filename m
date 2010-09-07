From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue,  7 Sep 2010 20:37:24 +0200
Subject: [Buildroot] [PATCH] bump cups 1.3 to latest patchlevel 1.3.11
Message-ID: <1283884644-4871-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

version 1.4.x is the recent stable

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/cups/cups-no-tests-man.patch |    4 ++--
 package/cups/cups.mk                 |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cups/cups-no-tests-man.patch b/package/cups/cups-no-tests-man.patch
index 567c801..65389ec 100644
--- a/package/cups/cups-no-tests-man.patch
+++ b/package/cups/cups-no-tests-man.patch
@@ -5,9 +5,9 @@
  #
  
 -DIRS	=	cups backend berkeley cgi-bin filter locale man monitor \
--		notifier $(PDFTOPS) scheduler systemv test \
+-		notifier scheduler systemv test \
 +DIRS	=	cups backend berkeley cgi-bin filter locale monitor \
-+		notifier $(PDFTOPS) scheduler systemv \
++		notifier scheduler systemv \
  		$(PHPDIR) \
  		conf data doc $(FONTS) ppd templates
  
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 776fb57..cd854e4 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -3,7 +3,7 @@
 # cups
 #
 ################################################################################
-CUPS_VERSION = 1.3.9
+CUPS_VERSION = 1.3.11
 CUPS_NAME = cups-$(CUPS_VERSION)
 CUPS_DIR = $(BUILD_DIR)/$(CUPS_NAME)
 CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
@@ -97,7 +97,7 @@ $(CUPS_DIR)/.configured: $(CUPS_DIR)/.unpacked
 
 $(CUPS_DIR)/.compiled: $(CUPS_DIR)/.configured
 	$(MAKE) CFLAGS="$(CUPS_CFLAGS)" -C $(CUPS_DIR) cups backend berkeley cgi-bin filter \
-	locale monitor notifier pdftops scheduler systemv scripting/php \
+	locale monitor notifier scheduler systemv scripting/php \
 	conf data doc fonts ppd templates
 	touch $@
 
-- 
1.7.1
