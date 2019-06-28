From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Jun 2019 22:32:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/dialog: fix build with NLS
Message-ID: <20190628203209.1563-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/9287ffbb86a7dc09cda5f99f87445fa884e77625

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dialog/dialog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 73fabe07cf..b1933b8836 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -9,7 +9,7 @@ DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://ftp.invisible-island.net/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
 	--disable-rpath-hack
-DIALOG_DEPENDENCIES = host-pkgconf ncurses
+DIALOG_DEPENDENCIES = host-pkgconf ncurses $(TARGET_NLS_DEPENDENCIES)
 DIALOG_LICENSE = LGPL-2.1
 DIALOG_LICENSE_FILES = COPYING
 
-- 
2.14.1
