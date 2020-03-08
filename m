From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 20:12:06 +0100
Subject: [Buildroot] [git commit] package/qt5base: fix double-conversion
 compile for nios2
Message-ID: <20200308190047.79EF38FF23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2fdb41f711db8894f9c5c83f32250728d4c3aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add double-conversion upstream patch to enable compile for nios2.

Fixes:

  http://autobuild.buildroot.net/results/19881951a328ff4df82b5753a23219eb634e86df

  ../3rdparty/double-conversion/include/double-conversion/utils.h:114:2: error: #error Target architecture was not detected as supported by Double-Conversion.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-double-conversion-enable-for-nios2.patch  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/qt5/qt5base/5.12.7/0003-double-conversion-enable-for-nios2.patch b/package/qt5/qt5base/5.12.7/0003-double-conversion-enable-for-nios2.patch
new file mode 100644
index 0000000000..79e276b17f
--- /dev/null
+++ b/package/qt5/qt5base/5.12.7/0003-double-conversion-enable-for-nios2.patch
@@ -0,0 +1,26 @@
+From e3f63db3124caf5bde9cf688eba563f7f025662d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 8 Mar 2020 18:08:26 +0100
+Subject: [PATCH] double-conversion: enable for nios2
+
+[Upstream: https://github.com/google/double-conversion/commit/a54561be5588ac9b16d3c20760b9b554168bb8aa]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/double-conversion/include/double-conversion/utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index d29de950..55ca5bf5 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -87,6 +87,7 @@ int main(int argc, char** argv) {
+     defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
++    defined(__nios2__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+     defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+-- 
+2.25.1
+
