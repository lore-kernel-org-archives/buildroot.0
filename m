From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 09:11:11 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/icu: Fix xtensa build
In-Reply-To: <20190803071111.27367-1-bernd.kuhls@t-online.de>
References: <20190803071111.27367-1-bernd.kuhls@t-online.de>
Message-ID: <20190803071111.27367-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e6c/e6c6f826d8280f2bef923b3327d2a9a13ce2f7e1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added upstream bug report and pull request URLs (Thomas)

 .../icu/0007-ICU-20751-Fix-xtensa-build.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/icu/0007-ICU-20751-Fix-xtensa-build.patch

diff --git a/package/icu/0007-ICU-20751-Fix-xtensa-build.patch b/package/icu/0007-ICU-20751-Fix-xtensa-build.patch
new file mode 100644
index 0000000000..27b655e857
--- /dev/null
+++ b/package/icu/0007-ICU-20751-Fix-xtensa-build.patch
@@ -0,0 +1,38 @@
+From 8bb098a8d887939bf8eb41998c6ddfa847c12665 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 3 Aug 2019 08:25:02 +0200
+Subject: [PATCH] ICU-20751 Fix xtensa build
+
+Solves build error
+In file included from double-conversion.h:42:0,
+                 from number_decimalquantity.cpp:19:
+double-conversion-utils.h:119:2: error: #error Target architecture was not detected as supported by Double-Conversion.
+ #error Target architecture was not detected as supported by Double-Conversion.
+
+detected by buildroot autobuilders:
+http://autobuild.buildroot.net/results/e6c/e6c6f826d8280f2bef923b3327d2a9a13ce2f7e1/
+
+Patch sent upstream: https://github.com/unicode-org/icu/pull/726
+Bug report: https://unicode-org.atlassian.net/browse/ICU-20751
+
+[Bernd: Fixed path]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ source/i18n/double-conversion-utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index 1e44fcaa0e..79816c7e05 100644
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
+@@ -103,6 +103,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+     defined(__or1k__) || defined(__arc__) || \
++    defined(__XTENSA__) || \
+     defined(__EMSCRIPTEN__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+-- 
+2.20.1
+
-- 
2.20.1
