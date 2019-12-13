From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:27:31 +0100
Subject: [Buildroot] [PATCH] package/dialog: bump version to 1.3-20191210
Message-ID: <20191213152732.18418-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of regressions in 1.3-20190808:

- Menu shadows are not longer (erroneously) drawn with --no-shadow
- Spaces in menu fields are now correctly handled on uClibc-ng

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 98e2229ce8..e1768588d8 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2  dialog-1.3-20190808.tgz
+sha256 10f7c02ee5dea311e61b0d3e29eb6e18bcedd6fb6672411484c1a37729cbd7a6  dialog-1.3-20191210.tgz
 # Locally computed
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index ae3d2d466a..f3b66bae09 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20190808
+DIALOG_VERSION = 1.3-20191210
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.20.1
