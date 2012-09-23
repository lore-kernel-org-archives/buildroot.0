From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Sep 2012 20:37:42 +0200
Subject: [Buildroot] [git commit] blackbox: fix build issue with gcc 4.6+
Message-ID: <20120923193049.BABA399649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52679e66a52461bc48188dc4c30490aba2a87595
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/e99b292047b780d379f1123e61177c234d5d3351

Patch from Debian.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...lackbox-0.70.1-gcc46-textpropertytostring.patch |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/blackbox/blackbox-0.70.1-gcc46-textpropertytostring.patch b/package/blackbox/blackbox-0.70.1-gcc46-textpropertytostring.patch
new file mode 100644
index 0000000..af03be4
--- /dev/null
+++ b/package/blackbox/blackbox-0.70.1-gcc46-textpropertytostring.patch
@@ -0,0 +1,34 @@
+[PATCH] fix build issue with gcc 4.6+
+
+Debian patch from http://patch-tracker.debian.org/patch/series/dl/blackbox/0.70.1-13/textpropertytostring-unconditional.diff
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+
+Description: Declare bt::textPropertyToString unconditionally.
+Author: Jakub Wilk <jwilk@debian.org>
+Forwarded: no
+Bug-Debian: http://bugs.debian.org/614468
+Last-Update: 2011-03-12
+
+--- a/lib/Util.hh
++++ b/lib/Util.hh
+@@ -25,6 +25,8 @@
+ #ifndef __Util_hh
+ #define __Util_hh
+ 
++#include <X11/Xutil.h>
++
+ #include <limits.h>
+ #include <string>
+ 
+@@ -94,10 +96,8 @@
+ 
+   std::string tolower(const std::string &string);
+ 
+-#ifdef _XUTIL_H_
+   std::string textPropertyToString(::Display *display,
+                                    ::XTextProperty& text_prop);
+-#endif
+ 
+ } // namespace bt
+ 
