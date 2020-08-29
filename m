From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Aug 2020 21:32:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: add upstream patch to
 fix build failure for getresuid32
Message-ID: <20200829193207.1917510-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f13/f13d85dfec371c38229bca988cd4bffa4cb97ae5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This fix is included in version 0.11.15 so bumping the package, current
version is 0.11.19, would be a different way to fix the build error.

 ...al-fix-build-failure-for-getresuid32.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch

diff --git a/package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch b/package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch
new file mode 100644
index 0000000000..9759e8c8ba
--- /dev/null
+++ b/package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch
@@ -0,0 +1,31 @@
+From 0c132280f973969db597b9983d4fa240f22761c4 Mon Sep 17 00:00:00 2001
+From: bybug <felxasus@gmail.com>
+Date: Thu, 2 Jul 2020 05:08:12 +0300
+Subject: [PATCH] stress-sysinval: fix build failure for getresuid32
+
+Fixing a build error for x86 architectures
+
+Signed-off-by: bybug <felxasus@gmail.com>
+Signed-off-by: Colin Ian King <colin.king@canonical.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://github.com/ColinIanKing/stress-ng/commit/0c132280f973969db597b9983d4fa240f22761c4]
+---
+ stress-sysinval.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/stress-sysinval.c b/stress-sysinval.c
+index e9108bb0..0a4f383b 100644
+--- a/stress-sysinval.c
++++ b/stress-sysinval.c
+@@ -642,8 +642,8 @@ static const stress_syscall_arg_t stress_syscall_args[] = {
+ 	{ SYS(getresuid), 3, { ARG_PTR_WR, ARG_PTR_WR, ARG_PTR_WR, 0, 0, 0 } },
+ #endif
+ #if DEFSYS(getresuid32)
+-	{ SYS(getresuid), 3, { ARG_PTR, ARG_PTR, ARG_PTR, 0, 0, 0 } },
+-	{ SYS(getresuid), 3, { ARG_PTR_WR, ARG_PTR_WR, ARG_PTR_WR, 0, 0, 0 } },
++	{ SYS(getresuid32), 3, { ARG_PTR, ARG_PTR, ARG_PTR, 0, 0, 0 } },
++	{ SYS(getresuid32), 3, { ARG_PTR_WR, ARG_PTR_WR, ARG_PTR_WR, 0, 0, 0 } },
+ #endif
+ #if DEFSYS(getrlimit)
+ 	{ SYS(getrlimit), 2, { ARG_RND, ARG_PTR, 0, 0, 0, 0 } },
-- 
2.27.0
