From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:30:25 +0200
Subject: [Buildroot] [git commit] package/bdwgc: re-add fix for pthread
	detection on uclinux platforms
Message-ID: <20170608193030.0FDAC7FBF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=269b21afaa5e85a4fd469f0ea98a5657566bbc49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d63/d63ee2d03421cc671455be553ab35ada7ff78267/
http://autobuild.buildroot.net/results/d8f/d8f97fd92cd971a0d125f983765ef27c5ac87acb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-configure-match-uclinux-pattern.patch     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/bdwgc/0003-configure-match-uclinux-pattern.patch b/package/bdwgc/0003-configure-match-uclinux-pattern.patch
new file mode 100644
index 0000000..b2c6198
--- /dev/null
+++ b/package/bdwgc/0003-configure-match-uclinux-pattern.patch
@@ -0,0 +1,27 @@
+From a628c90bdbf397465ac2ab2b11f14eb2e853651c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 6 Aug 2016 23:24:35 +0200
+Subject: [PATCH] configure: match uclinux pattern
+
+BDWGC does not recognize "uclinux" as a valid OS part of the target
+tuple which is used by some arm cortex-M toolchains.
+
+* configure.ac [$THREADS=pthreads] (GC_LINUX_THREADS, _REENTRANT): Define
+for hosts matching "*-*-*linux*" (instead of "*-*-linux*").
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 22353547..fa745b56 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -190,7 +190,7 @@ case "$THREADS" in
+         AC_DEFINE(THREAD_LOCAL_ALLOC)
+         AC_MSG_WARN("Explicit GC_INIT() calls may be required.");
+         ;;
+-     *-*-linux* | *-*-nacl*)
++     *-*-*linux* | *-*-nacl*)
+         AC_DEFINE(GC_LINUX_THREADS)
+         AC_DEFINE(_REENTRANT)
+         ;;
