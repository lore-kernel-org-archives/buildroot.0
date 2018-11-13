From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Nov 2018 23:52:14 +0100
Subject: [Buildroot] [PATCH 1/1] libsigsegv: fix build on riscv
Message-ID: <20181113225214.15957-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bd12cb3db3b46860a4ab8fb91052319dce75202a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ack-direction-for-the-RISC-V-architecture.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libsigsegv/0001-Add-stack-direction-for-the-RISC-V-architecture.patch

diff --git a/package/libsigsegv/0001-Add-stack-direction-for-the-RISC-V-architecture.patch b/package/libsigsegv/0001-Add-stack-direction-for-the-RISC-V-architecture.patch
new file mode 100644
index 0000000000..9fbe5dff8c
--- /dev/null
+++ b/package/libsigsegv/0001-Add-stack-direction-for-the-RISC-V-architecture.patch
@@ -0,0 +1,33 @@
+From c2abebc9d86429e0662b6cdbe77d022d1c81340d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 13 Nov 2018 23:17:54 +0100
+Subject: [PATCH] Add stack direction for the RISC-V architecture
+
+The stack grows downwards on RISC-V, see
+https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf:
+"In the standard RISC-V calling convention, the stack grows downward and
+the stack pointer is always kept 16-byte aligned."
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bd12cb3db3b46860a4ab8fb91052319dce75202a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index c373f1c..9504f88 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -43,6 +43,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       pdp11 | \
+       pj* | \
+       powerpc* | rs6000 | \
++      riscv* | \
+       romp | \
+       s390* | \
+       sh* | \
+-- 
+2.14.1
+
-- 
2.14.1
