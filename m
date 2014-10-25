From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 18:58:28 +0200
Subject: [Buildroot] [git commit] package/uclibc: enable long double math
	for xtensa
Message-ID: <20141025165835.5B338AF437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56004cf052a37e41d047ca950dba53322750a23b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It fixes the following build failure for packages that expect long
double support in libm:

  Linking C executable winpr-hash
  ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `powl'
  ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `fmodl'
  ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `ceill'
  ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `log10l'
  ../../libwinpr/utils/libwinpr-utils.so.0.1.0: undefined reference to `floorl'

Fixes:
  http://autobuild.buildroot.net/results/323/3236ddfe8eaf89f05f84db60eb42583cca397464/

Mainline status: patch submitted.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...n.arch-enable-long-double-math-for-xtensa.patch |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch
new file mode 100644
index 0000000..2aa7ac8
--- /dev/null
+++ b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch
@@ -0,0 +1,26 @@
+From b0fb0d1f69ceaceba05500602747d9f85f360fb9 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 25 Oct 2014 14:29:08 +0400
+Subject: [PATCH] Config.in.arch: enable long double math for xtensa
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ extra/Configs/Config.in.arch | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
+index 2338e3c..68e03bf 100644
+--- a/extra/Configs/Config.in.arch
++++ b/extra/Configs/Config.in.arch
+@@ -191,7 +191,7 @@ config UCLIBC_HAS_FENV
+ config UCLIBC_HAS_LONG_DOUBLE_MATH
+ 	bool "Enable long double support"
+ 	depends on DO_C99_MATH
+-	depends on TARGET_i386 || TARGET_m68k || TARGET_sparc || TARGET_x86_64 || TARGET_powerpc || TARGET_sh || TARGET_microblaze
++	depends on TARGET_i386 || TARGET_m68k || TARGET_sparc || TARGET_x86_64 || TARGET_powerpc || TARGET_sh || TARGET_microblaze || TARGET_xtensa
+ 	default y
+ 	help
+ 	  If you want the uClibc math library to contain the full set of C99
+-- 
+1.8.1.4
+
