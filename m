From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 13:41:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/trousers: fix musl build
Message-ID: <1453639266-9856-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Error log:
tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
 #include <bits/local_lim.h>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/trousers/0002-musl-limits-h.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/trousers/0002-musl-limits-h.patch

diff --git a/package/trousers/0002-musl-limits-h.patch b/package/trousers/0002-musl-limits-h.patch
new file mode 100644
index 0000000..14ecfcc
--- /dev/null
+++ b/package/trousers/0002-musl-limits-h.patch
@@ -0,0 +1,16 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr trousers-0.3.13.org/src/tspi/tsp_tcsi_param.c trousers-0.3.13/src/tspi/tsp_tcsi_param.c
+--- trousers-0.3.13.org/src/tspi/tsp_tcsi_param.c	2014-04-24 20:05:44.000000000 +0200
++++ trousers-0.3.13/src/tspi/tsp_tcsi_param.c	2016-01-24 13:38:11.764784876 +0100
+@@ -11,7 +11,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+-#include <bits/local_lim.h>
++#include <limits.h>
+ #include "trousers/tss.h"
+ #include "trousers/trousers.h"
+ #include "trousers_types.h"
-- 
2.7.0.rc3
