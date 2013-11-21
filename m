From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Nov 2013 12:02:42 +0100
Subject: [Buildroot] [git commit] libsigsegv: fix aarch64 build
Message-ID: <20131121110327.0856A9BD77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99bccdce43f905181f4d151cbb8214a748914262
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/9821f4d44e65db1ec503acc89685ccfa7664fc32/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libsigsegv-0002-fix-aarch64-build.patch        |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch b/package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch
new file mode 100644
index 0000000..a916e9d
--- /dev/null
+++ b/package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch
@@ -0,0 +1,31 @@
+From 2a2dac797cc41fb3f106c4186fc68d3e15b4ea47 Mon Sep 17 00:00:00 2001
+From: Will Newton <will.newton@linaro.org>
+Date: Tue, 28 May 2013 18:31:46 +0100
+Subject: [PATCH] m4/stack-direction.m4: AArch64 stack grows down.
+
+Submitted-Upstream: https://lists.gnu.org/archive/html/bug-libsigsegv/2013-05/msg00001.html
+
+ChangeLog:
+
+2013-05-28  Will Newton  <will.newton@linaro.org>
+
+	* m4/stack-direction.m4: AArch64 stack grows down.
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 00e0445..890b77e 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -13,6 +13,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+     case "$host_cpu" in
+       dnl See the #define STACK_GROWS_DOWNWARD in gcc-3.1/gcc/config/*/*.h.
+       a29k | \
++      aarch64* | \
+       alpha* | \
+       arc | \
+       arm* | strongarm* | xscale* | \
+-- 
+1.8.1.4
+
