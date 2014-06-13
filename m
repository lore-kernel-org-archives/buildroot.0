From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Jun 2014 11:15:39 -0300
Subject: [Buildroot] [PATCH] dialog: bump to version 1.2-20140219
Message-ID: <1402668939-1372-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a homepage.
Ditch custom install target commands, they're not needed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dialog/Config.in | 2 ++
 package/dialog/dialog.mk | 6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index c7cd8a4..929ab46 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_DIALOG
 	  types of dialog boxes from shell scripts.  This allows a developer
 	  of a script to interact with the user in a much friendlier manner.
 
+	  http://invisible-island.net/dialog/dialog.html
+
 comment "dialog needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index e2ce09b..6dc9066 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.1-20111020
+DIALOG_VERSION = 1.2-20140219
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
 DIALOG_CONF_OPT = --with-ncurses
@@ -17,8 +17,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES += libiconv
 endif
 
-define DIALOG_INSTALL_TARGET_CMDS
-	$(INSTALL) -c $(@D)/dialog $(TARGET_DIR)/usr/bin/dialog
-endef
-
 $(eval $(autotools-package))
-- 
1.8.5.5
