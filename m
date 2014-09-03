From: Maarten ter Huurne <maarten@treewalker.org>
Date: Wed,  3 Sep 2014 02:26:42 +0200
Subject: [Buildroot] [PATCH] dialog: Override ncurses config script
Message-ID: <1409704002-30172-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without the override, systemwide ncurses6-config can be found instead
of ncurses5-config from staging.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 package/dialog/dialog.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index fb00c9c..72990a8 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -17,4 +17,6 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES += libiconv
 endif
 
+DIALOG_CONF_OPT = NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/ncurses5-config
+
 $(eval $(autotools-package))
-- 
1.8.4.5
