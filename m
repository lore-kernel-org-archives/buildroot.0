From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2015 08:09:34 +0200
Subject: [Buildroot] [git commit] faifa: fix musl build issue
Message-ID: <20150915061145.2388D81946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a8d49a79e8c1b0312c5523a3d45a9c41efb1dd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/17b/17bde543db253c008079b04c5e341f804160f59c/
http://autobuild.buildroot.net/results/9ee/9eeb9d1497d94dfbda710e8bcdf781bc6d4b8724/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...icitly-include-endian.h-for-BYTE_ORDER-ma.patch |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch b/package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch
new file mode 100644
index 0000000..79da360
--- /dev/null
+++ b/package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch
@@ -0,0 +1,32 @@
+From bfe43f4b4f249cee8c77059d7c89ebbc521d4d93 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 14 Sep 2015 22:25:12 +0200
+Subject: [PATCH] sha2.c: explicitly include endian.h for BYTE_ORDER macro
+
+Fixes a build issue with the musl C library, which doesn't indirectly
+include endian.h from any of the included system headers:
+
+http://autobuild.buildroot.net/results/17b/17bde543db253c008079b04c5e341f804160f59c/build-end.log
+
+Upstream-Status: submitted (https://github.com/ffainelli/faifa/pull/12)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ sha2.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sha2.c b/sha2.c
+index f2f5132..4c8a72d 100644
+--- a/sha2.c
++++ b/sha2.c
+@@ -40,6 +40,7 @@
+ #include <inttypes.h>
+ #include <string.h>
+ 
++#include "endian.h"
+ #include "sha2.h"
+ 
+ /*
+-- 
+2.1.4
+
