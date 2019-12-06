From: Paul Cercueil <paul@crapouillou.net>
Date: Fri,  6 Dec 2019 14:38:02 +0100
Subject: [Buildroot] [PATCH] Revert "package/dialog: bump version to
 1.3-20190808"
Message-ID: <20191206133802.127863-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 1.3-20190808 version looks extremely buggy.
For instance, if you try to open a dialog using this command:
dialog --no-shadow --msgbox "test test test" 10 32

- the --no-shadow attribute doesn't seem to work anymore, since the
  frame will sill have a shadow,
- the text shown within the frame won't be "test test test" as expected,
  but "testtesttest".

These bugs make the program completely unusable, so revert to the last
known good version.

This partly reverts commit 6a2ebcaf6a.

The license hash and URL update from ftp to https were not modified
back.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/dialog/dialog.hash | 1 +
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 98e2229ce8..5200e5cf86 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256 886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2  dialog-1.3-20190808.tgz
+sha256 2ff1ba74c632b9d13a0d0d2c942295dd4e8909694eeeded7908a467d0bcd4756  dialog-1.3-20170509.tgz
 # Locally computed
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index ae3d2d466a..0f22f033cf 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20190808
+DIALOG_VERSION = 1.3-20170509
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.24.0
