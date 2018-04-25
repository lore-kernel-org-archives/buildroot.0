From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:36:44 +0200
Subject: [Buildroot] [git commit] udftools: add patch to fix build on musl
Message-ID: <20180425193649.1337888DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b95d260a93aa334b9333083d93f6de837cbb170d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/e77a96bd2a73c8255fd078022b11e8c47a4c712e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...up-pktsetup.c-do-not-include-bits-types.h.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch b/package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch
new file mode 100644
index 0000000000..4d842821aa
--- /dev/null
+++ b/package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch
@@ -0,0 +1,32 @@
+From 8da4dde42cc25294819ad078432d85437e4a12ee Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 22 Apr 2018 15:05:46 +0200
+Subject: [PATCH] pktsetup/pktsetup.c: do not include <bits/types.h>
+
+This header is not a standard header, and is for example not provided
+by the musl C library.
+
+This change has been tested by building udftools against glibc, uClibc
+and musl.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/pali/udftools/pull/16
+---
+ pktsetup/pktsetup.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pktsetup/pktsetup.c b/pktsetup/pktsetup.c
+index 8b3df51..81ed142 100644
+--- a/pktsetup/pktsetup.c
++++ b/pktsetup/pktsetup.c
+@@ -27,7 +27,6 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <getopt.h>
+-#include <bits/types.h>
+ #include <sys/types.h>
+ #include <string.h>
+ #include <limits.h>
+-- 
+2.14.3
+
