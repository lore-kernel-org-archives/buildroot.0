From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jul 2012 19:52:09 +0200
Subject: [Buildroot] [git commit branch/next] ncurses: get the post staging
	installation hook called properly
Message-ID: <20120802195301.7C9AF8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0018ec74bda9987f4f8ee56dd8e888d4009eb585
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There was a typo in the name of the variable to register the hook,
which prevent the hook from actually being called.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
