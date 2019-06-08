From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 18:37:24 +0200
Subject: [Buildroot] [git commit] package/libubootenv: fix build with
 'nothread' toolchain
Message-ID: <20190608163712.6B85E8EC53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afc0b3838fc778523ee53ef9cc3b3bebcd720401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<pthread.h> include doesn't seem to be necessary inside the library.
So, drop the header completely.

Fixes:
 - http://autobuild.buildroot.org/results/813e8951530c093f46b38bf8c3b467ab6535c95b

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...05-uboot_env-remove-pthread.h-header-file.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch b/package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch
new file mode 100644
index 0000000000..7a7e2a019b
--- /dev/null
+++ b/package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch
@@ -0,0 +1,29 @@
+From ac4f795f2c0a81d5b55ce825f3d4c933fbc9e44c Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Tue, 4 Jun 2019 11:43:47 +0200
+Subject: [libubootenv][PATCH] uboot_env: remove <pthread.h> header file
+
+<pthread.h> include doesn't seem to be necessary inside the library.
+So, drop the header completely.
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: http://patchwork.ozlabs.org/patch/1109822/]
+---
+ src/uboot_env.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/uboot_env.c b/src/uboot_env.c
+index e8483bf..3f1bb3b 100644
+--- a/src/uboot_env.c
++++ b/src/uboot_env.c
+@@ -24,7 +24,6 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <ctype.h>
+-#include <pthread.h>
+ #include <signal.h>
+ #include <sys/file.h>
+ #include <sys/types.h>
+-- 
+2.7.4
+
