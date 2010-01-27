From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:08:57 +0100
Subject: [Buildroot] [PATCH 09/19] ncurses: fix path to patch ncurses5-config
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-10-git-send-email-llandwerlin@gmail.com>
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
index a19e6c8..0568954 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -53,10 +53,10 @@ endif
 
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
1.6.6
