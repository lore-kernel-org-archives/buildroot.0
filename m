From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:29:43 +0200
Subject: [Buildroot] [git commit] package/icu: fix double conversion compile
 for microblaze
Message-ID: <20191005212734.C447988F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e9eaf7d570a647133972fbc3cfe300770c31ade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  In file included from double-conversion.h:42:0,
                   from number_decimalquantity.cpp:19:
  double-conversion-utils.h:120:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   #error Target architecture was not detected as supported by Double-Conversion.

Apply the same fix as previously for qt5base ([2], already sent upstream [3],
but seems to be lost while merging [4]).

[1] http://autobuild.buildroot.net/results/24005bc54cbc742decee221fb09bca19ee70502c
[2] https://git.buildroot.net/buildroot/commit/?id=530668ddb709cf27aa6694e00f44cf58af858b0b
[3] https://github.com/google/double-conversion/issues/73
[4] https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...7-double-conversion-enable-for-microblaze.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/icu/0007-double-conversion-enable-for-microblaze.patch b/package/icu/0007-double-conversion-enable-for-microblaze.patch
new file mode 100644
index 0000000000..278c6c61ea
--- /dev/null
+++ b/package/icu/0007-double-conversion-enable-for-microblaze.patch
@@ -0,0 +1,25 @@
+From 395f063b6af8885cc9d688eeeb44acf9d75c6045 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 3 Oct 2019 16:31:22 +0200
+Subject: [PATCH] double-conversion: enable for microblaze
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ source/i18n/double-conversion-utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index 0cf9939..a00037e 100644
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
+@@ -104,6 +104,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+     defined(__or1k__) || defined(__arc__) || \
++    defined(__microblaze__) || \
+     defined(__EMSCRIPTEN__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+--
+2.23.0
+
