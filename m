From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 00:09:40 +0200
Subject: [Buildroot] [git commit] dialog: fixup ncurses config script
Message-ID: <20140918195020.D357B9D6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d365364fa505e5c851fb8a6ba3d6c72708f13c3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Point the build to the proper ncurses config script by using
$(NCURSES_CONFIG_SCRIPTS) from the ncurses package directly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/dialog.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
