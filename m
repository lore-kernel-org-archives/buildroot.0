From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:10:53 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashrom: fix
 build on riscv
Message-ID: <20190319191327.DDE4D81935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6c8348cca5aa1acf7b2d77b3f8c8d2cc21c35a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/fb95c22cbe1d19e73f0089103ed6da2f4b3081c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cc366832f2b4268d77e2f367d4d059c318ba4e3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-platform-Add-riscv-to-known-platforms.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch b/package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
new file mode 100644
index 0000000000..06eb9256e4
--- /dev/null
+++ b/package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
@@ -0,0 +1,41 @@
+From a9a03cc6ba71825bfae0d64e1888f33c77345bc3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Mar 2018 23:08:29 -0700
+Subject: [PATCH] platform: Add riscv to known platforms
+
+Change-Id: I724a99e2493fcbf71c2fc2d9f6a1ad607c737087
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-on: https://review.coreboot.org/25260
+Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
+Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
+Reviewed-by: David Hendricks <david.hendricks@gmail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/flashrom/flashrom/commit/a9a03cc6ba71825bfae0d64e1888f33c77345bc3]
+---
+ platform.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/platform.h b/platform.h
+index e3b7674ae..65fe85881 100644
+--- a/platform.h
++++ b/platform.h
+@@ -69,6 +69,9 @@
+ #elif defined (__m68k__)
+ 	#define __FLASHROM_ARCH__ "m68k"
+ 	#define IS_M68K 1
++#elif defined (__riscv)
++	#define __FLASHROM_ARCH__ "riscv"
++	#define IS_RISCV 1
+ #elif defined (__sh__)
+ 	#define __FLASHROM_ARCH__ "sh"
+ 	#define IS_SH 1
+@@ -77,7 +80,7 @@
+ 	#define IS_S390 1
+ #endif
+ 
+-#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_SH || IS_S390)
++#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_RISCV || IS_SH || IS_S390)
+ #error Unknown architecture
+ #endif
+ 
