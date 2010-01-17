From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 17 Jan 2010 23:40:56 +0100
Subject: [Buildroot] [PATCH 08/15] ncurses: fix path to patch ncurses5-config
In-Reply-To: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
References: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1263768063-24133-9-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/ncurses/ncurses.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index a19e6c8..7eafa87 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -53,7 +53,7 @@ endif
 
 define NCURSES_PATCH_NCURSES_CONFIG
 	$(SED) 's^prefix="^prefix="$(STAGING_DIR)^' \
-		$(STAGING_DIR)/bin/ncurses5-config
+		$(STAGING_DIR)/usr/bin/ncurses5-config
 endef
 
 NCURSES_POST_BUILD_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
-- 
1.6.5.7
