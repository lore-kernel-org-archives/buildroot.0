From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 23:27:10 +0100
Subject: [Buildroot] [git commit] linenoise: patch was merged on upstream
Message-ID: <20130301101140.950DC9ADCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4992307bd1d76ef7fd88978896675d57fa62e663
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linenoise/linenoise-get-columns.patch |   20 --------------------
 package/linenoise/linenoise.mk                |    2 +-
 2 files changed, 1 insertions(+), 21 deletions(-)

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
