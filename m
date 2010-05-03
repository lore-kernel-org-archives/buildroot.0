From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 3 May 2010 12:01:19 +0200
Subject: [Buildroot] [git commit master] ncurses: fix path to patch
	ncurses5-config
Message-ID: <20100503100233.CD9C58F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3bb02f5ba5e81655f43b55ee3709084605542dd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 79560b1..584a969 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -57,10 +57,10 @@ endef
 
 define NCURSES_PATCH_NCURSES_CONFIG
 	$(SED) 's^prefix="^prefix="$(STAGING_DIR)^' \
-		$(STAGING_DIR)/bin/ncurses5-config
+		$(STAGING_DIR)/usr/bin/ncurses5-config
 endef
 
-NCURSES_POST_BUILD_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
+NCURSES_POST_STAGING_INSTALL_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define NCURSES_INSTALL_TARGET_DEVFILES
-- 
1.6.3.3
