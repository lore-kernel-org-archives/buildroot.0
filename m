From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:27:48 +0200
Subject: [Buildroot] [git commit] qt5base: fix double conversion for
 microblazeel/microblazebe
Message-ID: <20180821202022.AB6838E1D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=530668ddb709cf27aa6694e00f44cf58af858b0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
  #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/489/4891d96f45c64c2e66fe819bd4175cc1d6243a93

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...4-double-conversion-enable-for-microblaze.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch
new file mode 100644
index 0000000000..2d7164b67c
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch
@@ -0,0 +1,27 @@
+From 372d33fbe549ea73318c187505716ac99fbf3054 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 21 Aug 2018 21:11:40 +0200
+Subject: [PATCH] double-conversion: enable for microblaze
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../double-conversion/include/double-conversion/utils.h        | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index b0a7d5d4f4..485f680180 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -66,7 +66,8 @@
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
+-    defined(__or1k__)
++    defined(__or1k__) || \
++    defined(__microblaze__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.18.0
+
