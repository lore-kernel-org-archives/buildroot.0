From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 15:38:31 +0200
Subject: [Buildroot] [git commit] qt5base: fix double-conversion compile for
 aarch64_be
Message-ID: <20180814133219.56EC38D28B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d944d1523108a13c446917d2ed55cc6dedab1f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
  #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/1fe2be0f26e5b92db57a5cfb5646dd253b731a5c

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-double-conversion-enable-for-aarch64_be.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch b/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch
new file mode 100644
index 0000000000..838f4dd7ad
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0002-double-conversion-enable-for-aarch64_be.patch
@@ -0,0 +1,26 @@
+From e81ba4e0de16ff741417ae7ed7dfe7b5a83d66e2 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 13 Aug 2018 20:15:05 +0200
+Subject: [PATCH] double-conversion: enable for aarch64_be
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../double-conversion/include/double-conversion/utils.h         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index 20bfd36c84..77baa2861a 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -65,7 +65,7 @@
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__)
++    defined(__AARCH64EL__) || defined(__AARCH64EB__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.18.0
+
