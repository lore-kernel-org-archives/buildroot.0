From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:11:06 +0100
Subject: [Buildroot] [git commit] libethumb: add patch to fix static builds
Message-ID: <20151126211505.E2C7E81ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a36d751abd789fd54ef313c860db207bc28d3628
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/060/060c4b7303976994a13ecd286e936fee59c7a095/
http://autobuild.buildroot.net/results/d01/d0111a8524f74c6bc596d85289addbed0e77f8c6/
http://autobuild.buildroot.net/results/147/1471f8a4838369ed825da406f88aae425465e827/
http://autobuild.buildroot.net/results/a35/a35a39fee7c24abe0bbe12d71bebf92005367391/

And many more.

Ethumb includes dlfcn.h even though it isn't used, breaking builds with
purely static toolchains.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ethumb-drop-unused-dlfcn.h-include.patch  |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch b/package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch
new file mode 100644
index 0000000..834b0a8
--- /dev/null
+++ b/package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch
@@ -0,0 +1,28 @@
+From f7eeddc88ce67c248ebb1e6b8a3cb74d61de42b4 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Thu, 26 Nov 2015 22:07:24 +0100
+Subject: [PATCH] ethumb: drop unused dlfcn.h include
+
+ethumb includes dlfcn.h even though it isn't used, breaking builds with
+purely static toolchains.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/lib/ethumb.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/lib/ethumb.c b/src/lib/ethumb.c
+index d1453a0..48c6a2d 100644
+--- a/src/lib/ethumb.c
++++ b/src/lib/ethumb.c
+@@ -58,7 +58,6 @@ void *alloca (size_t);
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <dirent.h>
+-#include <dlfcn.h>
+ #include <ctype.h>
+ 
+ #ifdef HAVE_XATTR
+-- 
+2.1.4
+
