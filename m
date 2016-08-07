From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:10:38 +0200
Subject: [Buildroot] [git commit] package/bdwgc: fix pthread detection on
	uclinux platforms
Message-ID: <20160807214242.5961D818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65f15dd57bbefd6f79ed63e51a18505fbe70afe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bdwgc does not recognize "uclinux" as a valid OS part of the target
tuple which is used by some arm cortex-M toolchains.

Fixes:
http://autobuild.buildroot.net/results/94f/94fbc1e5afe183e5b071d1e869b2d780025389e2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-configure-match-uclinux-pattern.patch     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/bdwgc/0004-configure-match-uclinux-pattern.patch b/package/bdwgc/0004-configure-match-uclinux-pattern.patch
new file mode 100644
index 0000000..78bad1c
--- /dev/null
+++ b/package/bdwgc/0004-configure-match-uclinux-pattern.patch
@@ -0,0 +1,32 @@
+From f8ecc7fb09adf34a23d324f373e667c81311fc1c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 6 Aug 2016 23:24:35 +0200
+Subject: [PATCH] configure: match uclinux pattern
+
+bdwgc does not recognize "uclinux" as a valid OS part of the target
+tuple which is used by some arm cortex-M toolchains.
+
+Fixes:
+http://autobuild.buildroot.net/results/94f/94fbc1e5afe183e5b071d1e869b2d780025389e2
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b1ce2b2..a69d101 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -186,7 +186,7 @@ case "$THREADS" in
+         AC_DEFINE(THREAD_LOCAL_ALLOC)
+         AC_MSG_WARN("Explicit GC_INIT() calls may be required.");
+         ;;
+-     *-*-linux*)
++     *-*-*linux*)
+         AC_DEFINE(GC_LINUX_THREADS)
+         AC_DEFINE(_REENTRANT)
+         ;;
+-- 
+2.5.5
+
