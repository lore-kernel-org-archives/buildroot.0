From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 16 Feb 2019 10:48:32 +0100
Subject: [Buildroot] [PATCH v1] qt5base: fix double-conversion compile for
 riscv
Message-ID: <20190216094832.9515-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1], [2]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:83:2: error: #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/8bdb6a2b56f6ea96649184e5fef6ce2c56b9ec2b
[2] http://autobuild.buildroot.net/results/63ba267674b424786bb10c97c565f4306147f95a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...5-double-conversion-enable-for-riscv.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/qt5/qt5base/5.11.3/0005-double-conversion-enable-for-riscv.patch

diff --git a/package/qt5/qt5base/5.11.3/0005-double-conversion-enable-for-riscv.patch b/package/qt5/qt5base/5.11.3/0005-double-conversion-enable-for-riscv.patch
new file mode 100644
index 0000000000..0bdfd4918d
--- /dev/null
+++ b/package/qt5/qt5base/5.11.3/0005-double-conversion-enable-for-riscv.patch
@@ -0,0 +1,31 @@
+From 982801a21c3abad7025a7110275a49e200bc460f Mon Sep 17 00:00:00 2001
+From: Stefan O'Rear <stefanor@cox.net>
+Date: Thu, 17 Nov 2016 09:54:33 -0800
+Subject: [PATCH] double-conversion: enable for riscv
+
+Original double conversion patch [1] 'Add support for RISC-V' ported
+to qtbase-5.11.3.
+
+[1] Upstream: https://github.com/google/double-conversion/commit/8316ed5bf405835558a476e528d8e1d0adf69dd9
+
+Change-Id: Id88a356940f4d61dbcec3741a74db695e47af3f0
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/double-conversion/include/double-conversion/utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index 485f680180..a736b14d1e 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -66,6 +66,7 @@
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
++    defined(__riscv) || \
+     defined(__or1k__) || \
+     defined(__microblaze__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+-- 
+2.20.1
+
-- 
2.20.1
