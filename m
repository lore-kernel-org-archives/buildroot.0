From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Feb 2013 09:29:00 +0100
Subject: [Buildroot] [PATCH] linenoise: patch was merged on upstream
Message-ID: <1361348940-21004-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/linenoise/linenoise-get-columns.patch |   20 --------------------
 package/linenoise/linenoise.mk                |    2 +-
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 package/linenoise/linenoise-get-columns.patch

diff --git a/package/linenoise/linenoise-get-columns.patch b/package/linenoise/linenoise-get-columns.patch
deleted file mode 100644
index 4fb9e40..0000000
--- a/package/linenoise/linenoise-get-columns.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-returns the default value (80) when a real value is not available
-(0 is not an acceptable value for COLUMNS, the width of the screen).
-
-see pull request on upstream : http://github.com/antirez/linenoise/pull/31
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/linenoise.c
-===================================================================
---- a/linenoise.c
-+++ b/linenoise.c
-@@ -182,7 +182,7 @@
- static int getColumns(void) {
-     struct winsize ws;
- 
--    if (ioctl(1, TIOCGWINSZ, &ws) == -1) return 80;
-+    if (ioctl(1, TIOCGWINSZ, &ws) == -1 || ws.ws_col == 0) return 80;
-     return ws.ws_col;
- }
- 
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 343a107..fb73960 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -3,7 +3,7 @@
 # linenoise
 #
 #############################################################
-LINENOISE_VERSION = g8c9b481
+LINENOISE_VERSION = g27a3b4d
 LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
-- 
1.7.9.5
