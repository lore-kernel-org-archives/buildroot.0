From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu,  1 May 2014 19:11:18 +0400
Subject: [Buildroot] [PATCH] uclibc: arc: bump to git commit 8af9dc8
Message-ID: <1398957078-8590-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will resolve uClibc build error for configurations without large file
support.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 configs/arc_defconfig    | 8 ++++++++
 package/uclibc/Config.in | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 configs/arc_defconfig

diff --git a/configs/arc_defconfig b/configs/arc_defconfig
new file mode 100644
index 0000000..467bf3d
--- /dev/null
+++ b/configs/arc_defconfig
@@ -0,0 +1,8 @@
+BR2_arcle=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_HOST_GDB=y
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index cc244a9..4b3b975 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "arc-4.8-R3"	if BR2_arc
+	default "8af9dc8f714d20a68df034f6ed1ededc2d752f5b" if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
-- 
1.8.4.1
