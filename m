From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Jul 2010 13:04:15 +0200
Subject: [Buildroot] [git commit master 1/1] dialog: force linking with
	ncurses
Message-ID: <20100720110515.C2F8A8295E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9de1b4c81f081a5d63a05ede3a9e829ed8c2e783
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the build breaks with:
configure: error: no curses library found

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dialog/dialog.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 7674861..e8c2a0d 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -6,7 +6,7 @@
 DIALOG_VERSION:=1.1-20100428
 DIALOG_SOURCE:=dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE:=ftp://invisible-island.net/dialog
-
+DIALOG_CONF_OPT = --with-ncurses
 DIALOG_DEPENDENCIES = ncurses
 
 define DIALOG_INSTALL_TARGET_CMDS
-- 
1.7.1
