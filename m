From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:56:09 +0100
Subject: [Buildroot] [git commit] package/gcc: remove uclibc-conf patch
Message-ID: <20181208200042.86A8986C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7e43580f57001baa7e47de2438720b0b0019b15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is present in Buildroot since a long time and has been rebased on
several version of gcc without beqing upstreamed.  Also it only concern
contrib/regression, which is not used at all during the build...

As suggested by Arnout [1], a test based on qemu_x86_defconfig has
been done without this patch and there is no regression.

[1] http://lists.busybox.net/pipermail/buildroot/2018-May/222104.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/8.2.0/0001-uclibc-conf.patch | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/package/gcc/8.2.0/0001-uclibc-conf.patch b/package/gcc/8.2.0/0001-uclibc-conf.patch
deleted file mode 100644
index dc223f9653..0000000000
--- a/package/gcc/8.2.0/0001-uclibc-conf.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 897881dfdf6a922957c40cbbe9f96bbbe5374770 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 2 May 2017 22:36:15 +0200
-Subject: [PATCH] uclibc-conf
-
-[Romain: convert to git patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- contrib/regression/objs-gcc.sh | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
-index 60b0497fea2..6dc7eadff36 100755
---- a/contrib/regression/objs-gcc.sh
-+++ b/contrib/regression/objs-gcc.sh
-@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
-  then
-   make all-gdb all-dejagnu all-ld || exit 1
-   make install-gdb install-dejagnu install-ld || exit 1
-+elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
-+ then
-+  make all-gdb all-dejagnu all-ld || exit 1
-+  make install-gdb install-dejagnu install-ld || exit 1
- elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
-   make bootstrap || exit 1
-   make install || exit 1
--- 
-2.14.3
-
