From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:10:09 +0100
Subject: [Buildroot] [git commit] xenomai: enable armv5tej support
Message-ID: <20131229111620.741579C220@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d36da1b1b60aa58fb6d0413c02446ec7d1f913ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The br-arm-full-2013.11-rc2 toolchain is builded with arch=armv5te
and tune=arm926ej-s, which is not recognized by xenomai.

fixes: http://autobuild.buildroot.net/results/e3b/e3b534dafb6dd7d788b0c3629ccc0b25702790f0/build-end.log

This patch has already been merged upstream:

http://git.xenomai.org/xenomai-2.6.git/commit/?id=ebc2779baa222db4a5936c3d3022803355585b8c

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xenomai-0001-arm-enable-armv5tej-support.patch |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch b/package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch
new file mode 100644
index 0000000..fdff0aa
--- /dev/null
+++ b/package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch
@@ -0,0 +1,40 @@
+From ebc2779baa222db4a5936c3d3022803355585b8c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 28 Dec 2013 13:31:14 +0100
+Subject: [PATCH 1/1] arm: enable armv5tej support
+
+armv5tej are not detected in include/asm-arm/features.h
+
+fixes: http://autobuild.buildroot.net/results/e3b/e3b534dafb6dd7d788b0c3629ccc0b25702790f0/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ include/asm-arm/features.h | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/include/asm-arm/features.h b/include/asm-arm/features.h
+index b83ac2c..bb3ea92 100644
+--- a/include/asm-arm/features.h
++++ b/include/asm-arm/features.h
+@@ -56,13 +56,14 @@
+ #define __LINUX_ARM_ARCH__ 4
+ #endif /* armv4 */
+ 
+-#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) \
+-	|| defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__)
++#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || \
++	defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || \
++	defined(__ARM_ARCH_5TEJ__)
+ #define __LINUX_ARM_ARCH__ 5
+ #endif /* armv5 */
+ 
+-#if defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6K__) \
+-	|| defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
++#if defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6K__) || \
++	defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
+ #define __LINUX_ARM_ARCH__ 6
+ #endif /* armv6 */
+ 
+-- 
+1.8.1.4
+
