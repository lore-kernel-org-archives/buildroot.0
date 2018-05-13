From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun, 13 May 2018 12:36:01 +0200
Subject: [Buildroot] [PATCH] gqrx: bump to version 2.11.4
Message-ID: <20180513103601.16644-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gqrx/0001-fix_compilation_in_gcc-6.patch | 34 ------------------------
 package/gqrx/gqrx.hash                           |  4 ++-
 package/gqrx/gqrx.mk                             |  2 +-
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 package/gqrx/0001-fix_compilation_in_gcc-6.patch

diff --git a/package/gqrx/0001-fix_compilation_in_gcc-6.patch b/package/gqrx/0001-fix_compilation_in_gcc-6.patch
deleted file mode 100644
index 22ec1effe9..0000000000
--- a/package/gqrx/0001-fix_compilation_in_gcc-6.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e6baaee4968345a53e977f593362267a91041cff Mon Sep 17 00:00:00 2001
-From: Valentin Ochs <a@0au.de>
-Date: Fri, 21 Oct 2016 20:12:50 +0200
-Subject: [PATCH] Cosmetic & readability changes
-
-Backport patch from
-https://github.com/csete/gqrx/commit/e6baaee4968345a53e977f593362267a91041cff
-
-Fix compilation in gcc-6
-
-Signed-off-by: Valentin Ochs <a@0au.de>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
-diff --git a/src/qtgui/plotter.cpp b/src/qtgui/plotter.cpp
-index e491632..b877546 100644
---- a/src/qtgui/plotter.cpp
-+++ b/src/qtgui/plotter.cpp
-@@ -1336,8 +1336,11 @@ void CPlotter::drawOverlay()
- #endif
- 
-             int level = 0;
--            for (; level < nLevels && tagEnd[level] > x; level++);
--                level %= nLevels;
-+            while(level < nLevels && tagEnd[level] > x)
-+                level++;
-+            
-+            if(level == nLevels)
-+                level = 0;
- 
-             tagEnd[level] = x + nameWidth + slant - 1;
-             m_BookmarkTags.append(qMakePair<QRect, qint64>(QRect(x, level * levelHeight, nameWidth + slant, fontHeight), bookmarks[i].frequency));
--- 
-2.10.2
-
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index bb52a616d7..7c1fc9852f 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,2 +1,4 @@
 # Locally calculated:
-sha256 2736a963dac4051ca8ae91a440ee6643ef7d26c9de5b9c83a369d5fc9328d453  gqrx-v2.6.1.tar.gz
+sha256 c4e836c552dc99bf383ca84b2ddc0c67e3d05b073676318e2a011bcd463303ef  gqrx-v2.11.4.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index 2a7651c252..b51bb23eaf 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = v2.6.1
+GQRX_VERSION = v2.11.4
 GQRX_SITE = $(call github,csete,gqrx,$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-- 
2.16.1
