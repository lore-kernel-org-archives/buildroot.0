From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Jun 2020 21:28:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: fix build with ncurses
Message-ID: <20200622192828.291026-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8d15d2a6ac25164bc79749bd9e6fd87adb45a08a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lly-revert-Tweaks-for-building-on-th.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch

diff --git a/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
new file mode 100644
index 0000000000..518639387a
--- /dev/null
+++ b/package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch
@@ -0,0 +1,42 @@
+From 22e69d77d745b42ca85fefdf8c9f7625b852b964 Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Wed, 26 Feb 2020 22:08:28 +0100
+Subject: [PATCH] gptcurses: partially revert "Tweaks for building on the
+ latest XCode for macOS"
+
+This partially reverts commit bbd6b4cc67ffcdf7b2a6bd5008d28006cb147393.
+
+Fixes:
+
+| gptcurses.cc:29:10: fatal error: ncursesw/ncurses.h: No such file or directory
+|    29 | #include <ncursesw/ncurses.h>
+|       |          ^~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Retrieved from:
+https://sourceforge.net/u/texierp/gptfdisk/ci/22e69d77d745b42ca85fefdf8c9f7625b852b964
+Upstream status (with meson build system):
+https://sourceforge.net/p/gptfdisk/code/merge-requests/21]
+---
+ gptcurses.cc | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/gptcurses.cc b/gptcurses.cc
+index 1b18cf2..4ebfde1 100644
+--- a/gptcurses.cc
++++ b/gptcurses.cc
+@@ -23,11 +23,7 @@
+ #include <iostream>
+ #include <string>
+ #include <sstream>
+-#ifdef __APPLE__
+ #include <ncurses.h>
+-#else
+-#include <ncursesw/ncurses.h>
+-#endif
+ #include "gptcurses.h"
+ #include "support.h"
+ 
+-- 
+2.26.2
+
-- 
2.26.2
