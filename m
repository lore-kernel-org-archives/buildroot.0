From: Brendan Heading <brendanheading@gmail.com>
Date: Mon,  3 Aug 2015 12:51:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/imlib2: fix musl compilation issue
Message-ID: <1438602662-17214-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/a6e/a6e61bfb376946b479085f243601d6e1634adc6d/

musl is strict about including time.h when using time_t.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../0007-fix-compilation-issues-with-musl.patch    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/imlib2/0007-fix-compilation-issues-with-musl.patch

diff --git a/package/imlib2/0007-fix-compilation-issues-with-musl.patch b/package/imlib2/0007-fix-compilation-issues-with-musl.patch
new file mode 100644
index 0000000..50e88a2
--- /dev/null
+++ b/package/imlib2/0007-fix-compilation-issues-with-musl.patch
@@ -0,0 +1,31 @@
+From bdfa1169c549122a8dc848b84469458101adeb20 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Mon, 3 Aug 2015 12:44:55 +0100
+Subject: [PATCH 1/1] fix compilation issues with musl
+
+Using time_t strictly requires time.h to be included.
+
+NOTE I've stuck to the convention on this project where most of the
+files appear to pick up most of their headers by including "common.h".
+
+Upstream-status: pending
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ src/lib/common.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/common.h b/src/lib/common.h
+index 798965f..9053826 100644
+--- a/src/lib/common.h
++++ b/src/lib/common.h
+@@ -9,6 +9,7 @@
+ #include <config.h>
+ #include <string.h>
+ #include <math.h>
++#include <time.h>
+ #ifdef WITH_DMALLOC
+ #include <dmalloc.h>
+ #endif
+-- 
+2.4.3
+
-- 
2.4.3
