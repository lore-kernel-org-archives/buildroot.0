From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Aug 2016 23:36:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/trousers: fix musl build
In-Reply-To: <1471815409-25953-1-git-send-email-romain.naour@gmail.com>
References: <1471815409-25953-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1471815409-25953-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The musl libc doesn't provide <bits/local_lim.h>, use <limits.h>
instead.

Fixes:
http://autobuild.buildroot.net/results/f71/f71edcf08f31029ef642415b8351ed14767c8e0e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ..._param-include-limits.h-to-fix-musl-build.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch

diff --git a/package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch b/package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch
new file mode 100644
index 0000000..f88e47a
--- /dev/null
+++ b/package/trousers/0003-tsp_tcsi_param-include-limits.h-to-fix-musl-build.patch
@@ -0,0 +1,29 @@
+From 66bbe0a87818a1e3c721780dc33b2d81fdf4a774 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 21 Aug 2016 23:32:10 +0200
+Subject: [PATCH] tsp_tcsi_param: include limits.h to fix musl build
+
+The musl libc doesn't provide <bits/local_lim.h>, use <limits.h>
+instead.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/tspi/tsp_tcsi_param.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tspi/tsp_tcsi_param.c b/src/tspi/tsp_tcsi_param.c
+index 670f86f..8f2b4e4 100644
+--- a/src/tspi/tsp_tcsi_param.c
++++ b/src/tspi/tsp_tcsi_param.c
+@@ -11,7 +11,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+-#include <bits/local_lim.h>
++#include <limits.h>
+ #include "trousers/tss.h"
+ #include "trousers/trousers.h"
+ #include "trousers_types.h"
+-- 
+2.5.5
+
-- 
2.5.5
