From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:50:31 +0100
Subject: [Buildroot] [git commit branch/next] package/connman: remove
 _GNU_SOURCE patch
Message-ID: <20200307213814.D08F08FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14191cd119d2366cb0ecb2f8f363e500bb02cbed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Not needed any more.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/connman/0001-nat-build-failure.patch | 30 ----------------------------
 1 file changed, 30 deletions(-)

diff --git a/package/connman/0001-nat-build-failure.patch b/package/connman/0001-nat-build-failure.patch
deleted file mode 100644
index 0ab58501d0..0000000000
--- a/package/connman/0001-nat-build-failure.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 68f4b4f5b220f256b17ad2f084d61fe89f3632ae Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 19 Apr 2016 08:38:38 -0300
-Subject: [PATCH] nat: fix build failure
-
-_GNU_SOURCE needs to be defined so that O_CLOEXEC symbols can be found in
-system header files.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: submitted upstream
-
- src/nat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/nat.c b/src/nat.c
-index 33ae6df..62e21d4 100644
---- a/src/nat.c
-+++ b/src/nat.c
-@@ -24,6 +24,7 @@
- #include <config.h>
- #endif
- 
-+#define _GNU_SOURCE
- #include <errno.h>
- #include <sys/types.h>
- #include <sys/stat.h>
--- 
-2.7.3
-
