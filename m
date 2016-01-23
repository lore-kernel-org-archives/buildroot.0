From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 14:25:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/kexec: Fix musl build
In-Reply-To: <1453555545-28609-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453555545-28609-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453555545-28609-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c19/c19a016b7fd50b8cef110e70e6f3af7cd0369368/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch

diff --git a/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch b/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..adaac2f
--- /dev/null
+++ b/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
@@ -0,0 +1,38 @@
+Fix musl build
+
+Downloaded from http://patchwork.openembedded.org/patch/112685/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From d811875a41b4628040abaada3da29b7b9592e757 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Jan 2016 17:16:16 -0800
+Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE
+
+loff_t is guarded with _GNU_SOURCE on some C library implementations
+e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to
+include this define, it should help compiling on musl while nothing
+changes for glibc based systems since there _GNU_SOURCE is already
+defined
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ vmcore-dmesg/vmcore-dmesg.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
+index 0364636..a8f56df 100644
+--- a/vmcore-dmesg/vmcore-dmesg.c
++++ b/vmcore-dmesg/vmcore-dmesg.c
+@@ -1,4 +1,5 @@
+ #define _XOPEN_SOURCE 600
++#define _GNU_SOURCE
+ #define _LARGEFILE_SOURCE 1
+ #define _FILE_OFFSET_BITS 64
+ #include <endian.h>
+-- 
+2.7.0
+
-- 
2.7.0.rc3
