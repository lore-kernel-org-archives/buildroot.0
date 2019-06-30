From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Jun 2019 14:59:31 +0200
Subject: [Buildroot] [git commit] package/dialog: fix build with NLS
Message-ID: <20190630125901.6BA0D7FE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0953377a9ea4ea518a87a0b48169626c762b5fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9287ffbb86a7dc09cda5f99f87445fa884e77625

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
 
