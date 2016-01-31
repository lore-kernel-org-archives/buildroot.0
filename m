From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:48:00 +0100
Subject: [Buildroot] [git commit] package/mtdev2tuio: fix musl build
Message-ID: <20160201224701.497887F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=392362ed487713e621229d931990f311cecc2c29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/aee/aee411047265bf205f8990a3d0d2310decb5fd19/
http://autobuild.buildroot.net/results/9a9/9a96fdd2b52a75b348b46696c7f8b427f2d987c2/
http://autobuild.buildroot.net/results/2e1/2e155f2f57fd035362ad1b414f42e1c2b5de844b/
http://autobuild.buildroot.net/results/f62/f62d3830c594d9169fa9b9df5212f190d676fab9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../mtdev2tuio/0001-Fix-build-with-musl-libc.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch b/package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..810b66c
--- /dev/null
+++ b/package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch
@@ -0,0 +1,30 @@
+From f974bb1f92603973711bea36a7869dfa8358aae0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 31 Jan 2016 09:04:46 +0100
+Subject: [PATCH 1/1] Fix build with musl libc
+
+Include missing header to prevent build error detected by buildroot:
+http://autobuild.buildroot.net/results/aee/aee411047265bf205f8990a3d0d2310decb5fd19/build-end.log
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Patch sent upstream: https://github.com/olivopaolo/mtdev2tuio/pull/2
+
+ mtdev2tuio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mtdev2tuio.c b/mtdev2tuio.c
+index 3a9174f..f2c98d5 100644
+--- a/mtdev2tuio.c
++++ b/mtdev2tuio.c
+@@ -41,6 +41,7 @@
+ #include <getopt.h>
+ #include <signal.h>
+ #include <sys/utsname.h>
++#include <sys/file.h>
+ 
+ #define NSEC_PER_USEC   1000L
+ #define NSEC_PER_SEC    1000000000L
+-- 
+2.7.0.rc3
+
