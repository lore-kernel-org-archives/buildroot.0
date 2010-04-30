From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 30 Apr 2010 02:42:08 +0200
Subject: [Buildroot] [PATCH 2/2] ncurses: fix path to patch ncurses5-config
In-Reply-To: <1272588128-20047-1-git-send-email-llandwerlin@gmail.com>
References: <1272588128-20047-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1272588128-20047-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/ncurses/ncurses.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 944fcdb..8413672 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -52,10 +52,10 @@ endif
 
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
1.7.0.4
