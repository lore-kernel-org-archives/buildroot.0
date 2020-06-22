From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:43:48 +0200
Subject: [Buildroot] [git commit] package/gptfdisk: fix build with ncurses
Message-ID: <20200622204147.84669841E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3bcd340bb1df2ccd5f72568b3f2862a15028487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/8d15d2a6ac25164bc79749bd9e6fd87adb45a08a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...artially-revert-Tweaks-for-building-on-th.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

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
