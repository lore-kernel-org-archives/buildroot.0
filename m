From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 22:37:19 +0100
Subject: [Buildroot] [git commit] lttng-tools: fix build on musl
Message-ID: <20161207213811.3188F80D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=041c717ec8c251b7bca675086510840f02274967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to add a missing <pthread.h> include to fix the build on musl.

Fixes:

  http://autobuild.buildroot.net/results/ce0b438ca4dcf7ccef95c7050305d8cd58fbb24a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-Add-missing-pthread.h-include.patch   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch b/package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch
new file mode 100644
index 0000000..29706af
--- /dev/null
+++ b/package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch
@@ -0,0 +1,29 @@
+From c948391121f2eb411bc7d2049d96f267bfa643d8 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 5 Dec 2016 15:39:26 -0500
+Subject: [PATCH] Fix: Add missing pthread.h include
+
+Some libc like musl and uClibc requires explicit includes of pthread.h
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+[Thomas: taken from lttng mailing list.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/common/defaults.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/defaults.h b/src/common/defaults.h
+index 27f1ddc..37d222a 100644
+--- a/src/common/defaults.h
++++ b/src/common/defaults.h
+@@ -20,6 +20,7 @@
+ #ifndef _DEFAULTS_H
+ #define _DEFAULTS_H
+ 
++#include <pthread.h>
+ #include <src/common/macros.h>
+ 
+ /* Default unix group name for tracing. */
+-- 
+2.7.4
+
