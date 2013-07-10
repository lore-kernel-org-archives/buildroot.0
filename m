From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 10 Jul 2013 11:25:51 +0200
Subject: [Buildroot] [PATCH] uclibc: arc: add patch that adds
	__kernel_(u)long
Message-ID: <1373448351-2201-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a patch that adds the __kernel_long and __kernel_ulong types to
uClibc. This fixes the build failure with Linux 3.10 headers.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 .../0.9.33-arc/uclibc-arc-add-__kernel_long.patch  |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch

diff --git a/package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch b/package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch
new file mode 100644
index 0000000..caebac1
--- /dev/null
+++ b/package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch
@@ -0,0 +1,29 @@
+From 5164fb28e9205626211d0436933e6eb4960be582 Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mjonker@synopsys.com>
+Date: Wed, 10 Jul 2013 09:05:25 +0200
+Subject: [PATCH] ARC: libc/sysdeps: add __kernel_long and __kernel_ulong
+
+Linux 3.4 added these two types and updated various exported header
+files to use them. While other architectures were updated before,
+this was not the case for ARC.
+
+This fixes the build failure with Linux 3.10 headers.
+
+Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
+---
+ libc/sysdeps/linux/arc/bits/kernel_types.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libc/sysdeps/linux/arc/bits/kernel_types.h b/libc/sysdeps/linux/arc/bits/kernel_types.h
+index fd52e1c..fc28fa1 100755
+--- a/libc/sysdeps/linux/arc/bits/kernel_types.h
++++ b/libc/sysdeps/linux/arc/bits/kernel_types.h
+@@ -39,6 +39,8 @@ typedef	__kernel_uid_t		__kernel_old_uid_t;
+ typedef __kernel_gid_t		__kernel_old_gid_t;
+ typedef long long		__kernel_loff_t;
+ typedef unsigned int		__kernel_old_dev_t;
++typedef long			__kernel_long_t;
++typedef unsigned long		__kernel_ulong_t;
+
+ typedef struct {
+ #ifdef __USE_ALL
-- 
1.7.9.5
