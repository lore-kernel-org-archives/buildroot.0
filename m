From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 00:21:22 +0200
Subject: [Buildroot] [git commit] qt5base: fix double-conversion for or1k
Message-ID: <20180819221421.425948DE48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=670260d74bc9f5cc2549801b7e24233c9bcac461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
  #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/a3535cdf5e91df011a59a4b9f60d69195f5efdcb

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-double-conversion-enable-for-or1k.patch   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/qt5/qt5base/5.11.1/0003-double-conversion-enable-for-or1k.patch b/package/qt5/qt5base/5.11.1/0003-double-conversion-enable-for-or1k.patch
new file mode 100644
index 0000000000..53c5a31832
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0003-double-conversion-enable-for-or1k.patch
@@ -0,0 +1,27 @@
+From f9920819e6600a68829fb4600f11b70ebc2a33e7 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 18 Aug 2018 23:44:20 +0200
+Subject: [PATCH] double-conversion: enable for or1k
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../double-conversion/include/double-conversion/utils.h        | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index 77baa2861a..b0a7d5d4f4 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -65,7 +65,8 @@
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__) || defined(__AARCH64EB__)
++    defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
++    defined(__or1k__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.18.0
+
