From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:29:50 +0200
Subject: [Buildroot] [git commit] uclibc: use numbered patches for 0.9.33.2
Message-ID: <20130716140823.575009A079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=808fe4af777332b822cc492516bb844e6ad9bb18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the addition of more patches that require a correct
ordering, rename uClibc 0.9.33.2 patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...bc-0001-bits-time.h-sync-with-glibc-2.16.patch} |    9 +++---
 ...on-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch} |   23 ++++++++++++----
 ...p3.patch => uclibc-0003-Add-dup3-syscall.patch} |   22 +++++++--------
 ...eps-add-__kernel_long-and-__kernel_ulong.patch} |    7 +++--
 .../uclibc-0005-Patch-from-OpenWRT-for-avr32.patch |   28 ++++++++++++++++++++
 .../uclibc-OpenWRT-140-avr32_atomic_fix.patch      |   16 -----------
 6 files changed, 64 insertions(+), 41 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch b/package/uclibc/0.9.33.2/uclibc-0001-bits-time.h-sync-with-glibc-2.16.patch
similarity index 82%
rename from package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch
rename to package/uclibc/0.9.33.2/uclibc-0001-bits-time.h-sync-with-glibc-2.16.patch
index 2ad0032..d93df6d 100644
--- a/package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch
+++ b/package/uclibc/0.9.33.2/uclibc-0001-bits-time.h-sync-with-glibc-2.16.patch
@@ -1,7 +1,7 @@
-From 3d1b82c7d9dce11c733fe23a85df7f975c7e2486 Mon Sep 17 00:00:00 2001
+From bb08cd16cb0353b3d4116ca8959dbecd2e78f545 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <jacmet@sunsite.dk>
 Date: Tue, 3 Jul 2012 15:54:57 +0200
-Subject: [PATCH] bits/time.h: sync with glibc 2.16
+Subject: [PATCH 1/8] bits/time.h: sync with glibc 2.16
 
 CLOCK_MONOTONIC_RAW is available since 2.6.28
 (2d42244ae71d: clocksource: introduce CLOCK_MONOTONIC_RAW), and
@@ -10,8 +10,9 @@ CLOCK_REALTIME_COARSE).
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- libc/sysdeps/linux/common/bits/time.h |    6 ++++++
+ libc/sysdeps/linux/common/bits/time.h | 6 ++++++
  1 file changed, 6 insertions(+)
 
 diff --git a/libc/sysdeps/linux/common/bits/time.h b/libc/sysdeps/linux/common/bits/time.h
@@ -32,5 +33,5 @@ index 7ed54bf..c871223 100644
  /* Flag to indicate time is absolute.  */
  #   define TIMER_ABSTIME		1
 -- 
-1.7.10.4
+1.8.1.2
 
diff --git a/package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch b/package/uclibc/0.9.33.2/uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch
similarity index 54%
rename from package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch
rename to package/uclibc/0.9.33.2/uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch
index c699b6b..9353e5b 100644
--- a/package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch
+++ b/package/uclibc/0.9.33.2/uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch
@@ -1,15 +1,23 @@
-Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
+From e95694dfd24779acaab0bb1500f182e46f8a518d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 13 Jul 2013 17:13:55 +0200
+Subject: [PATCH 2/8] Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
 
 From yocto:
 http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
 
 Upstream-Status: Pending
 
-Index: git/libc/sysdeps/linux/common/bits/socket.h
-===================================================================
---- git.orig/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:23:21.537456132 -0800
-+++ git/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:25:10.125461388 -0800
-@@ -235,8 +235,15 @@
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libc/sysdeps/linux/common/bits/socket.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common/bits/socket.h b/libc/sysdeps/linux/common/bits/socket.h
+index 7e12733..338fd92 100644
+--- a/libc/sysdeps/linux/common/bits/socket.h
++++ b/libc/sysdeps/linux/common/bits/socket.h
+@@ -235,8 +235,15 @@ enum
  #define	MSG_ERRQUEUE	MSG_ERRQUEUE
      MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
  #define	MSG_NOSIGNAL	MSG_NOSIGNAL
@@ -26,3 +34,6 @@ Index: git/libc/sysdeps/linux/common/bits/socket.h
    };
  
  
+-- 
+1.8.1.2
+
diff --git a/package/uclibc/0.9.33.2/uclibc-dup3.patch b/package/uclibc/0.9.33.2/uclibc-0003-Add-dup3-syscall.patch
similarity index 73%
rename from package/uclibc/0.9.33.2/uclibc-dup3.patch
rename to package/uclibc/0.9.33.2/uclibc-0003-Add-dup3-syscall.patch
index 87fe2a6..663b0e1 100644
--- a/package/uclibc/0.9.33.2/uclibc-dup3.patch
+++ b/package/uclibc/0.9.33.2/uclibc-0003-Add-dup3-syscall.patch
@@ -1,16 +1,18 @@
+From 518bc50ae42540574bba360225c8a65b56b79148 Mon Sep 17 00:00:00 2001
 From: Jonas Bonn <jonas@southpole.se>
-Subject: [RFC PATCH 16/38] Add dup3 syscall
-Date: Tue,  6 Sep 2011 10:30:40 +0200
+Date: Tue, 6 Sep 2011 10:30:40 +0200
+Subject: [PATCH 3/8] Add dup3 syscall
 
 Signed-off-by: Jonas Bonn <jonas@southpole.se>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- include/unistd.h                 |    4 ++++
- libc/sysdeps/linux/common/dup3.c |   15 +++++++++++++++
- 2 files changed, 19 insertions(+), 0 deletions(-)
+ include/unistd.h                 |  4 ++++
+ libc/sysdeps/linux/common/dup3.c | 17 +++++++++++++++++
+ 2 files changed, 21 insertions(+)
  create mode 100644 libc/sysdeps/linux/common/dup3.c
 
 diff --git a/include/unistd.h b/include/unistd.h
-index 9568790..7c2fa4a 100644
+index 1b2fd4d..f7d070b 100644
 --- a/include/unistd.h
 +++ b/include/unistd.h
 @@ -513,6 +513,10 @@ extern int dup (int __fd) __THROW __wur;
@@ -26,7 +28,7 @@ index 9568790..7c2fa4a 100644
  #ifdef __USE_GNU
 diff --git a/libc/sysdeps/linux/common/dup3.c b/libc/sysdeps/linux/common/dup3.c
 new file mode 100644
-index 0000000..5fdab2e
+index 0000000..7b57438
 --- /dev/null
 +++ b/libc/sysdeps/linux/common/dup3.c
 @@ -0,0 +1,17 @@
@@ -48,9 +50,5 @@ index 0000000..5fdab2e
 +libc_hidden_def(dup3)
 +#endif
 -- 
-1.7.5.4
+1.8.1.2
 
-_______________________________________________
-uClibc mailing list
-uClibc at uclibc.org
-http://lists.busybox.net/mailman/listinfo/uclibc
diff --git a/package/uclibc/0.9.33.2/uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch b/package/uclibc/0.9.33.2/uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
similarity index 98%
rename from package/uclibc/0.9.33.2/uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
rename to package/uclibc/0.9.33.2/uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
index 4ba60e9..0381ba8 100644
--- a/package/uclibc/0.9.33.2/uclibc-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
+++ b/package/uclibc/0.9.33.2/uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
@@ -1,7 +1,7 @@
-From 6a76edddaa62ff06f178143b582167734cb55c18 Mon Sep 17 00:00:00 2001
+From 7fef6b983456e4c529a5239ea90715050e6f4452 Mon Sep 17 00:00:00 2001
 From: Chris Packham <chris.packham@alliedtelesis.co.nz>
 Date: Mon, 1 Oct 2012 18:12:54 +1300
-Subject: [PATCH] libc/sysdeps: add __kernel_long and __kernel_ulong
+Subject: [PATCH 4/8] libc/sysdeps: add __kernel_long and __kernel_ulong
 
 Linux 3.4 added __kernel_long_t and __kernel_ulong_t and various
 exported header files were updated to use these new types. Add the
@@ -50,6 +50,7 @@ I can break this up per arch or per maintainer if requested.
  22 files changed, 50 insertions(+)
 Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  libc/sysdeps/linux/alpha/bits/kernel_types.h      | 2 ++
  libc/sysdeps/linux/arm/bits/kernel_types.h        | 2 ++
@@ -388,5 +389,5 @@ index 44f1075..ed38f2e 100644
  
  /* Beginning in 2.6 kernels, which is the first version that includes the
 -- 
-1.8.1.5
+1.8.1.2
 
diff --git a/package/uclibc/0.9.33.2/uclibc-0005-Patch-from-OpenWRT-for-avr32.patch b/package/uclibc/0.9.33.2/uclibc-0005-Patch-from-OpenWRT-for-avr32.patch
new file mode 100644
index 0000000..9b6be2b
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0005-Patch-from-OpenWRT-for-avr32.patch
@@ -0,0 +1,28 @@
+From b0bbb35065e1c8fdd308573f38eed35c30760d87 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 13 Jul 2013 17:14:49 +0200
+Subject: [PATCH 5/8] Patch from OpenWRT for avr32.
+
+https://dev.openwrt.org/browser/trunk/toolchain/uClibc/patches-0.9.32/140-avr32_atomic_fix.patch
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libc/sysdeps/linux/avr32/bits/atomic.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libc/sysdeps/linux/avr32/bits/atomic.h b/libc/sysdeps/linux/avr32/bits/atomic.h
+index e6be41f..3bc2aee 100644
+--- a/libc/sysdeps/linux/avr32/bits/atomic.h
++++ b/libc/sysdeps/linux/avr32/bits/atomic.h
+@@ -28,6 +28,7 @@ typedef uintmax_t uatomic_max_t;
+ 
+ #define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)	\
+ 	({								\
++		__uint32_t __result;					\
+ 		__typeof__(*(mem)) __prev;				\
+ 		__asm__ __volatile__(					\
+ 			"/* __arch_compare_and_exchange_val_32_acq */\n" \
+-- 
+1.8.1.2
+
diff --git a/package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch b/package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch
deleted file mode 100644
index e28b6d2..0000000
--- a/package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Patch from OpenWRT for avr32.
-
-https://dev.openwrt.org/browser/trunk/toolchain/uClibc/patches-0.9.32/140-avr32_atomic_fix.patch
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
---- a/libc/sysdeps/linux/avr32/bits/atomic.h
-+++ b/libc/sysdeps/linux/avr32/bits/atomic.h
-@@ -28,6 +28,7 @@ typedef uintmax_t uatomic_max_t;
- 
- #define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)	\
- 	({								\
-+		__uint32_t __result;					\
- 		__typeof__(*(mem)) __prev;				\
- 		__asm__ __volatile__(					\
- 			"/* __arch_compare_and_exchange_val_32_acq */\n" \
