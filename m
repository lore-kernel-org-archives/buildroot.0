From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 14:54:12 +0200
Subject: [Buildroot] [git commit] nodejs: fix typo for arm predefined macro
	used for atomicops
Message-ID: <20151011130244.A383B81D6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eec69cdcaff10c6221ff0be603eacb3fdb9d6448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix typo for arm predefined macrco in (__ARM_ARCH_6KZ__
vs. __ARM_ARCH_6ZK__) in atomicops_internals_arm_gcc.h

Fixes #8391: Node.js 0.12.7 fails to build on raspberry_pi defconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...or-arm-predefined-macro-in-atomicops_inte.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch b/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
new file mode 100644
index 0000000..94d9eff
--- /dev/null
+++ b/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
@@ -0,0 +1,30 @@
+From b7b69cdcdb4e2d80a85e303cc3230666d565bc39 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 11 Oct 2015 09:14:52 +0200
+Subject: [PATCH] Fix typo for arm predefined macro in
+ atomicops_internals_arm_gcc.h
+
+Fix typo  __ARM_ARCH_6KZ__ vs.  __ARM_ARCH_6ZK__, fixes
+compile for raspberry pi.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ deps/v8/src/base/atomicops_internals_arm_gcc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/v8/src/base/atomicops_internals_arm_gcc.h b/deps/v8/src/base/atomicops_internals_arm_gcc.h
+index 069b1ff..b924981 100644
+--- a/deps/v8/src/base/atomicops_internals_arm_gcc.h
++++ b/deps/v8/src/base/atomicops_internals_arm_gcc.h
+@@ -63,7 +63,7 @@ inline void MemoryBarrier() {
+     defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) || \
+     defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) || \
+     defined(__ARM_ARCH_6K__) || defined(__ARM_ARCH_6Z__) || \
+-    defined(__ARM_ARCH_6KZ__) || defined(__ARM_ARCH_6T2__)
++    defined(__ARM_ARCH_6ZK__) || defined(__ARM_ARCH_6T2__)
+ 
+ inline Atomic32 NoBarrier_CompareAndSwap(volatile Atomic32* ptr,
+                                          Atomic32 old_value,
+-- 
+2.1.4
+
