From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 23:20:54 +0200
Subject: [Buildroot] [git commit] toolchain: move elf2flt option inclusion
	to toolchain-buildroot/Config.in
Message-ID: <20130915213314.CDA8782A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=859b49ed678be0f4b247a04d17ad554f54be0c96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only remaining thing in toolchain-buildroot/Config.in.2 is the
inclusion of the elf2flt option. It doesn't really make sense to have
a separate Config.in file for that, so let's move this to
toolchain-buildroot/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in                       |    1 -
 toolchain/toolchain-buildroot/Config.in   |    1 +
 toolchain/toolchain-buildroot/Config.in.2 |    9 ---------
 3 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 96713a8..17be32a 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -63,6 +63,5 @@ source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
 source "toolchain/toolchain-crosstool-ng/Config.in"
 source "toolchain/toolchain-common.in"
-source "toolchain/toolchain-buildroot/Config.in.2"
 
 endmenu
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 060b494..0ebbd6c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -68,4 +68,5 @@ source "package/uclibc/Config.in"
 
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
+source "package/elf2flt/Config.in.host"
 endif
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
deleted file mode 100644
index df26079..0000000
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ /dev/null
@@ -1,9 +0,0 @@
-# Buildroot backend specific options
-
-if BR2_TOOLCHAIN_BUILDROOT
-
-comment "Toolchain Options"
-
-source "package/elf2flt/Config.in.host"
-
-endif
