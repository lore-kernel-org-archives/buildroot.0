From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Oct 2015 09:29:47 +0200
Subject: [Buildroot] [PATCH v1] nodejs: fix typo for arm predefined macro
	used for atomicops
Message-ID: <1444548587-30217-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix typo for arm predefined macrco in (__ARM_ARCH_6KZ__
vs. __ARM_ARCH_6ZK__) in atomicops_internals_arm_gcc.h

Fixes #8391: Node.js 0.12.7 fails to build on raspberry_pi defconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...r-arm-predefined-macrco-in-atomicops_inte.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macrco-in-atomicops_inte.patch

diff --git a/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macrco-in-atomicops_inte.patch b/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macrco-in-atomicops_inte.patch
new file mode 100644
index 0000000..f21599c
--- /dev/null
+++ b/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macrco-in-atomicops_inte.patch
@@ -0,0 +1,30 @@
+From b7b69cdcdb4e2d80a85e303cc3230666d565bc39 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 11 Oct 2015 09:14:52 +0200
+Subject: [PATCH] Fix typo for arm predefined macrco in
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
-- 
2.1.4
