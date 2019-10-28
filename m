From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 00:11:23 +0100
Subject: [Buildroot] [git commit] package/icu: fix double conversion compile
 for xtensa
Message-ID: <20191028230754.3CBA98C589@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b33e61c57d01384f981c45855e6a0ad7e5dfa97b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  In file included from double-conversion.h:42,
                   from number_decimalquantity.cpp:19:
  double-conversion-utils.h:121:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/fc331ae8e2484be6818f4fc334d3f8c9658fffdc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0008-double-conversion-enable-for-xtensa.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/icu/0008-double-conversion-enable-for-xtensa.patch b/package/icu/0008-double-conversion-enable-for-xtensa.patch
new file mode 100644
index 0000000000..cb6be5188b
--- /dev/null
+++ b/package/icu/0008-double-conversion-enable-for-xtensa.patch
@@ -0,0 +1,26 @@
+From f8f37357fa7cc403848d2bafe6152a707ca3a074 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 28 Oct 2019 21:26:05 +0100
+Subject: [PATCH] double-conversion: enable for xtensa
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ source/i18n/double-conversion-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index a00037e..b3100ac 100644
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
+@@ -104,7 +104,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+     defined(__or1k__) || defined(__arc__) || \
+-    defined(__microblaze__) || \
++    defined(__microblaze__) || defined(__XTENSA__) || \
+     defined(__EMSCRIPTEN__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+--
+2.23.0
+
