From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jul 2012 20:49:48 +0200
Subject: [Buildroot] [PATCH 1/3] ncurses: get the post staging installation
	hook called properly
Message-ID: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was a typo in the name of the variable to register the hook,
which prevent the hook from actually being called.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 421d855..72a8030 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -57,7 +57,7 @@ define NCURSES_PATCH_NCURSES_CONFIG
 		$(STAGING_DIR)/usr/bin/ncurses5-config
 endef
 
-NCURSES_POST_STAGING_INSTALL_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
+NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define NCURSES_INSTALL_TARGET_DEVFILES
-- 
1.7.9.5
