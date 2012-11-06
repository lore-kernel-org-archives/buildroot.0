From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue,  6 Nov 2012 13:14:58 +0000
Subject: [Buildroot] [PATCH] lcdproc: bump version to 0.5.6
Message-ID: <1352207698-3407-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch   |   19 -------------------
 package/lcdproc/lcdproc.mk                          |    2 +-
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch

diff --git a/package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch b/package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch
deleted file mode 100644
index f0ebe2d..0000000
--- a/package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Trying to add a menu item using menu_add_item causes a segmentation fault
-in the LCDd server. This is caused by a read beyond the end of an array.
-
-This patch adds a safety check on the size of the argument array.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/server/commands/menu_commands.c b/server/commands/menu_commands.c
---- a/server/commands/menu_commands.c	2011-08-14 13:29:16.000000000 +0100
-+++ b/server/commands/menu_commands.c	2012-10-04 22:19:07.997409193 +0100
-@@ -198,7 +198,7 @@ menu_add_item_func(Client *c, int argc,
- 
- 	/* call menu_set_item() with a temporarily allocated argv
- 	 * to process the remaining options */
--	if ((argc > 5) || (argv[4][0] == '-')) {
-+	if ((argc > 5) || ((argc == 5) && argv[4][0] == '-')) {
- 		// menu_add_item <menuid> <newitemid> <type> [<text>]
- 		// menu_set_item <menuid> <itemid> {<option>}+
- 		int i, j;
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 7914c85..aa204f1 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -3,7 +3,7 @@
 # lcdproc
 #
 #############################################################
-LCDPROC_VERSION = 0.5.5
+LCDPROC_VERSION = 0.5.6
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPLv2+
-- 
1.7.10.4
