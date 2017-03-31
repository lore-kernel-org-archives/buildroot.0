From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 31 Mar 2017 22:26:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/xenomai: enable armv5tej support
Message-ID: <20170331202604.18153-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply a patch from Xenomai 2.6 [1].

Fixes:
http://autobuild.buildroot.net/results/762/7623410a81b1587b33b4f4b9cf1572c872b8a6e9/build-end.log

[1] https://git.xenomai.org/xenomai-2.6.git/commit/?id=ebc2779baa222db4a5936c3d3022803355585b8c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../xenomai/0002-arm-enable-armv5tej-support.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/xenomai/0002-arm-enable-armv5tej-support.patch

diff --git a/package/xenomai/0002-arm-enable-armv5tej-support.patch b/package/xenomai/0002-arm-enable-armv5tej-support.patch
new file mode 100644
index 0000000..5feaa59
--- /dev/null
+++ b/package/xenomai/0002-arm-enable-armv5tej-support.patch
@@ -0,0 +1,32 @@
+From fcd06f42fef4d52bb0d9772fa71015988c828b1b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 31 Mar 2017 21:10:23 +0200
+Subject: [PATCH] arm: enable armv5tej support
+
+armv5tej are not detected in lib/cobalt/arch/arm/include/asm/xenomai/features.h
+
+Apply the same patch from xenomai-2.6:
+https://git.xenomai.org/xenomai-2.6.git/commit/?id=ebc2779baa222db4a5936c3d3022803355585b8c
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ lib/cobalt/arch/arm/include/asm/xenomai/features.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cobalt/arch/arm/include/asm/xenomai/features.h b/lib/cobalt/arch/arm/include/asm/xenomai/features.h
+index 10bd0c7..e84b809 100644
+--- a/lib/cobalt/arch/arm/include/asm/xenomai/features.h
++++ b/lib/cobalt/arch/arm/include/asm/xenomai/features.h
+@@ -34,7 +34,8 @@
+ #endif /* armv4 */
+ 
+ #if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) \
+-	|| defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__)
++	|| defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) \
++	|| defined(__ARM_ARCH_5TEJ__)
+ #define __LINUX_ARM_ARCH__ 5
+ #endif /* armv5 */
+ 
+-- 
+2.9.3
+
-- 
2.9.3
