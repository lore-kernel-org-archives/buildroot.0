From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  7 Dec 2017 18:29:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Fix build on
 uClibc-ng
Message-ID: <20171207172900.4758-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/6c0506423c76b61018da26c2549570e3d9eb5763/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Fix from upstream
https://github.com/linux-test-project/ltp/commit/0ee59c66f4e4930d543395fb8617e26cf8b22025
---
 .../0004-syscalls-mknodat-Fix-missing-config.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch

diff --git a/package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch b/package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch
new file mode 100644
index 0000000000..d315a948a9
--- /dev/null
+++ b/package/ltp-testsuite/0004-syscalls-mknodat-Fix-missing-config.patch
@@ -0,0 +1,28 @@
+From 0ee59c66f4e4930d543395fb8617e26cf8b22025 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Thu, 7 Dec 2017 17:37:01 +0100
+Subject: [PATCH] syscalls/mknodat: Fix missing config
+
+Found by buildroot project, where this broke build on uClibc-ng, thanks!
+http://autobuild.buildroot.net/results/6c0506423c76b61018da26c2549570e3d9eb5763/build-end.log
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ testcases/kernel/syscalls/mknodat/mknodat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/syscalls/mknodat/mknodat.h b/testcases/kernel/syscalls/mknodat/mknodat.h
+index 577d5ac9c..b4e828c5d 100644
+--- a/testcases/kernel/syscalls/mknodat/mknodat.h
++++ b/testcases/kernel/syscalls/mknodat/mknodat.h
+@@ -22,6 +22,7 @@
+ #define MKNODAT_H
+ 
+ #include <sys/types.h>
++#include "config.h"
+ #include "lapi/syscalls.h"
+ 
+ #if !defined(HAVE_MKNODAT)
+-- 
+2.15.0
+
-- 
2.15.0
