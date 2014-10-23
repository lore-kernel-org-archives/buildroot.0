From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 22:15:12 +0200
Subject: [Buildroot] [git commit] pixman: Fix C pre-processor issues in
	LEAF_MIPS32R2
Message-ID: <20141023201525.58239B087B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05297611a6ee16ba8d7211ec4f3bc28a21c31d65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply a patch which will be upstreamed soon to fix a problem with the C
pre-processor. This fixes a build failure in MIPS32r2 architectures.

Related:
	http://lists.freedesktop.org/archives/pixman/2014-September/003419.html

Bug report:
	https://bugs.freedesktop.org/show_bug.cgi?id=83358

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x-C-pre-processor-issues-in-LEAF_MIPS32R2.patch |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/pixman/0002-Fix-C-pre-processor-issues-in-LEAF_MIPS32R2.patch b/package/pixman/0002-Fix-C-pre-processor-issues-in-LEAF_MIPS32R2.patch
new file mode 100644
index 0000000..b898fa5
--- /dev/null
+++ b/package/pixman/0002-Fix-C-pre-processor-issues-in-LEAF_MIPS32R2.patch
@@ -0,0 +1,33 @@
+pixman: Fix C pre-processor issues in LEAF_MIPS32R2
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 3a60aa8d574f4dfc4fa3ddb13aaa13c7d955105b Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 11 Sep 2014 10:24:10 +0100
+Subject: [PATCH] Fix C pre-processor issues in LEAF_MIPS32R2
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ pixman/pixman-mips-dspr2-asm.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pixman/pixman-mips-dspr2-asm.h b/pixman/pixman-mips-dspr2-asm.h
+index 11849bd..b2696d0 100644
+--- a/pixman/pixman-mips-dspr2-asm.h
++++ b/pixman/pixman-mips-dspr2-asm.h
+@@ -72,10 +72,10 @@
+ #define LEAF_MIPS32R2(symbol)                           \
+                 .globl  symbol;                         \
+                 .align  2;                              \
+-#ifdef __ELF__
++            .if __ELF__;                                \
+                 .hidden symbol;                         \
+                 .type   symbol, @function;              \
+-#endif
++            .endif;                                     \
+                 .ent    symbol, 0;                      \
+ symbol:         .frame  sp, 0, ra;                      \
+                 .set    push;                           \
+-- 
+1.7.1
