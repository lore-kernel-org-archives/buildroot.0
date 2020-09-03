From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:47:36 +0200
Subject: [Buildroot] [git commit] package/stress-ng: drop patch
Message-ID: <20200903183939.1A549821B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=986db051ba6b15861d0e3be5ab97592c42c83c12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is already in version 0.11.17

Fixes:
 - http://autobuild.buildroot.org/results/3741e47ec8bfc594aa37ac33b7927e5b73183daf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ysinval-fix-build-failure-for-getresuid32.patch | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch b/package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch
deleted file mode 100644
index 9759e8c8ba..0000000000
--- a/package/stress-ng/0002-stress-sysinval-fix-build-failure-for-getresuid32.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0c132280f973969db597b9983d4fa240f22761c4 Mon Sep 17 00:00:00 2001
-From: bybug <felxasus@gmail.com>
-Date: Thu, 2 Jul 2020 05:08:12 +0300
-Subject: [PATCH] stress-sysinval: fix build failure for getresuid32
-
-Fixing a build error for x86 architectures
-
-Signed-off-by: bybug <felxasus@gmail.com>
-Signed-off-by: Colin Ian King <colin.king@canonical.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[downloaded from upstream commit
- https://github.com/ColinIanKing/stress-ng/commit/0c132280f973969db597b9983d4fa240f22761c4]
----
- stress-sysinval.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/stress-sysinval.c b/stress-sysinval.c
-index e9108bb0..0a4f383b 100644
---- a/stress-sysinval.c
-+++ b/stress-sysinval.c
-@@ -642,8 +642,8 @@ static const stress_syscall_arg_t stress_syscall_args[] = {
- 	{ SYS(getresuid), 3, { ARG_PTR_WR, ARG_PTR_WR, ARG_PTR_WR, 0, 0, 0 } },
- #endif
- #if DEFSYS(getresuid32)
--	{ SYS(getresuid), 3, { ARG_PTR, ARG_PTR, ARG_PTR, 0, 0, 0 } },
--	{ SYS(getresuid), 3, { ARG_PTR_WR, ARG_PTR_WR, ARG_PTR_WR, 0, 0, 0 } },
-+	{ SYS(getresuid32), 3, { ARG_PTR, ARG_PTR, ARG_PTR, 0, 0, 0 } },
-+	{ SYS(getresuid32), 3, { ARG_PTR_WR, ARG_PTR_WR, ARG_PTR_WR, 0, 0, 0 } },
- #endif
- #if DEFSYS(getrlimit)
- 	{ SYS(getrlimit), 2, { ARG_RND, ARG_PTR, 0, 0, 0, 0 } },
