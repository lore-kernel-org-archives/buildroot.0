From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu, 22 Nov 2018 13:31:12 +0000
Subject: [Buildroot] [PATCH 1/1] gcc/config/riscv: define _REENTRANT for
 RISC-V when -pthread is passed
Message-ID: <20181122133112.26701-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The detection of pthread support fails on RISC-V unless _REENTRANT
is defined. Added the CPP_SPEC definition from gcc 8.1.0 to correct
this.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 ...TRANT-for-RISC-V-when-pthread-is-pas.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch

diff --git a/package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch b/package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
new file mode 100644
index 0000000000..4f96bf7d81
--- /dev/null
+++ b/package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
@@ -0,0 +1,30 @@
+From 6ea832d09415cd82b744d0cf168cdd728c43df47 Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Thu, 22 Nov 2018 12:19:11 +0000
+Subject: [PATCH 1/1] gcc: define _REENTRANT for RISC-V when -pthread is passed
+
+The detection of pthread support fails on RISC-V unless _REENTRANT
+is defined. Added the CPP_SPEC definition from gcc 8.1.0 to correct
+this.
+
+Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+---
+ gcc/config/riscv/linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index 4b2f7b6e1fd..b00d23ddfa0 100644
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
+@@ -47,6 +47,8 @@ along with GCC; see the file COPYING3.  If not see
+ 
+ #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
+ 
++#define CPP_SPEC "%{pthread:-D_REENTRANT}"
++
+ #define LINK_SPEC "\
+ -melf" XLEN_SPEC "lriscv \
+ %{shared} \
+-- 
+2.19.1
+
-- 
2.19.1
