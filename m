From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 10:08:21 -0300
Subject: [Buildroot] [PATCHv3 6/6] dialog: fixup ncurses config script
In-Reply-To: <1410959301-28053-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410959301-28053-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410959301-28053-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Point the build to the proper ncurses config script by using
$(NCURSES_CONFIG_SCRIPTS) from the ncurses package directly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dialog/dialog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 9af56e7..b5a8c60 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -17,6 +17,6 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES += libiconv
 endif
 
-DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/ncurses5-config
+DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 
 $(eval $(autotools-package))
-- 
1.8.5.5
