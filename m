From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 23:48:52 +0100
Subject: [Buildroot] [git commit] stress-ng: fix build without swapcontext
Message-ID: <20181208225511.54ED085434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=411cd189f1ebd209d6b9db3c17ab5e4309f8e3a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/f2d3b06afa6e31527a71c03671c8f08eb3f46c36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-stress-stackmmap-needs-swapcontext.patch  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch b/package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch
new file mode 100644
index 0000000000..8c1bf6025b
--- /dev/null
+++ b/package/stress-ng/0002-stress-stackmmap-needs-swapcontext.patch
@@ -0,0 +1,29 @@
+From 748ac7e88833472211ccce82563beb5050528e00 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 4 Dec 2018 21:52:49 +0100
+Subject: [PATCH] stress-stackmmap: needs swapcontext
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f2d3b06afa6e31527a71c03671c8f08eb3f46c36
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ stress-stackmmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stress-stackmmap.c b/stress-stackmmap.c
+index c2f4c31d..eb31d084 100644
+--- a/stress-stackmmap.c
++++ b/stress-stackmmap.c
+@@ -24,7 +24,7 @@
+  */
+ #include "stress-ng.h"
+ 
+-#if defined(__linux__)
++#if defined(HAVE_SWAPCONTEXT)
+ 
+ #include <ucontext.h>
+ 
+-- 
+2.14.1
+
