From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Mar 2020 22:01:13 +0100
Subject: [Buildroot] [git commit] package/systemd: drop leftover patch
Message-ID: <20200309204847.15A7A800C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a07ba73e4b5c8ef95a5de87bc90a66a776a712b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On master during the stabilisation phase, a new patch was added to
systemd; in parallel, on the next branch, systemd was bumped. Then, when
next was merged into master, there was no merge conflict, so the uneeded
patch was left unnoticed.

That patch was applied upstream, and is present in the version we now
have, so it no longer applies.

Drop that patch.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...seed-add-missing-header-for-GRND_NONBLOCK.patch | 39 ----------------------
 1 file changed, 39 deletions(-)

diff --git a/package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch b/package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
deleted file mode 100644
index e74df10e9d..0000000000
--- a/package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 806e2011a0ea684b10a07b74c4ee0f817437e8c6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sun, 1 Mar 2020 15:19:01 +0100
-Subject: [PATCH] random-seed: add missing header for GRND_NONBLOCK
-
-GRND_NONBLOCK has been introduced with the 3.17 kernel version [1]
-while adding getrandom(2) system call.
-
-The header missing_random.h is needed for random-seed.c when building
-with old toolchain, such Sourcery CodeBench ARM 2014.05.
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c6e9d6f38894798696f23c8084ca7edbf16ee895
-
-Upstream status:
-https://github.com/systemd/systemd/pull/14988
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/random-seed/random-seed.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/random-seed/random-seed.c b/src/random-seed/random-seed.c
-index 2fcbcb281a..596bff98f1 100644
---- a/src/random-seed/random-seed.c
-+++ b/src/random-seed/random-seed.c
-@@ -19,6 +19,7 @@
- #include "io-util.h"
- #include "log.h"
- #include "main-func.h"
-+#include "missing_random.h"
- #include "missing_syscall.h"
- #include "mkdir.h"
- #include "parse-util.h"
--- 
-2.24.1
-
