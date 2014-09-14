From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Sep 2014 00:27:52 +0200
Subject: [Buildroot] [git commit] dialog: Override ncurses config script
Message-ID: <20140914223201.2250F9D65E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47e4c68f51c9cc1b7aab9e16f5b5a5dee36bc3d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without the override, systemwide ncurses6-config can be found instead
of ncurses5-config from staging.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/dialog.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index fb00c9c..9af56e7 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -17,4 +17,6 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES += libiconv
 endif
 
+DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/ncurses5-config
+
 $(eval $(autotools-package))
