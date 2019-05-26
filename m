From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:18:27 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/samba4: fix build
 on mips64el
Message-ID: <20190526091607.ED53D80F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b123c139f3cc59808700227082c5fb9b04b95f76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/bae0508e84c905dc23ad7cf1153cd1e9d8e4d734

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d033c614b0c17360e8e2d9b259574103d262e945)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._regfio.c-include-stdint.h-before-cmoka.h.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/samba4/0005-test_regfio.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0005-test_regfio.c-include-stdint.h-before-cmoka.h.patch
new file mode 100644
index 0000000000..2415d57d70
--- /dev/null
+++ b/package/samba4/0005-test_regfio.c-include-stdint.h-before-cmoka.h.patch
@@ -0,0 +1,38 @@
+From bed8720dce64181c188c23a28506a88cd2e1ee4f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 May 2019 00:07:50 +0200
+Subject: [PATCH] test_regfio.c: include stdint.h before cmoka.h
+
+This fix the following build failure on mips64el:
+/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
+ typedef unsigned long int uintptr_t;
+                           ^
+In file included from ../source3/registry/tests/test_regfio.c:23:0:
+../third_party/cmocka/cmocka.h:126:28: note: previous declaration of 'uintptr_t' was here
+       typedef unsigned int uintptr_t;
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bae0508e84c905dc23ad7cf1153cd1e9d8e4d734
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/samba-team/samba/merge_requests/442]
+---
+ source3/registry/tests/test_regfio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/source3/registry/tests/test_regfio.c b/source3/registry/tests/test_regfio.c
+index 86a217661f3..f945e653708 100644
+--- a/source3/registry/tests/test_regfio.c
++++ b/source3/registry/tests/test_regfio.c
+@@ -20,6 +20,7 @@
+ #include <stdarg.h>
+ #include <stddef.h>
+ #include <setjmp.h>
++#include <stdint.h>
+ #include <cmocka.h>
+ 
+ #include <errno.h>
+-- 
+2.20.1
+
