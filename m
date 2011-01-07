From: Henk <henk.vergonet@gmail.com>
Date: Fri, 7 Jan 2011 13:19:09 +0100
Subject: [Buildroot] [PATCH 2/2] Added some gcc patches to get the lm32
	toolchain compiled
In-Reply-To: <AANLkTimivtZi6HyFkkQ9oUcxPwsLBgY_BrVGTRzkXtec@mail.gmail.com>
References: <AANLkTimivtZi6HyFkkQ9oUcxPwsLBgY_BrVGTRzkXtec@mail.gmail.com>
Message-ID: <AANLkTikGmUycCESyJrDvw+m5-avNdpbkFMyUt+uHFsjq@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added some gcc patches to get the lm32 toolchain compiled.

Signed-off-by: Henk Vergonet <Henk.Vergonet@gmail.com>

diff --git a/toolchain/gcc/4.5.2/105-lm32-fix-linux-uclibc-target.patch
b/toolchain/gcc/4.5.2/105-lm32-fix-linux-uclibc-target.patch
new file mode 100644
index 0000000..ee6ec74
--- /dev/null
+++ b/toolchain/gcc/4.5.2/105-lm32-fix-linux-uclibc-target.patch
@@ -0,0 +1,11 @@
+--- gcc-4.5.2/gcc/config.gcc.orig ? ? ?2010-10-09 11:35:53.000000000 +0200
++++ gcc-4.5.2/gcc/config.gcc ? 2011-01-07 00:12:51.000000000 +0100
+@@ -1527,7 +1527,7 @@
+ ? ? ? tmake_file="${tmake_file} lm32/t-lm32 lm32/t-fprules-softfp
soft-fp/t-softfp"
+ ? ? ? tmake_file="${tmake_file} t-rtems"
+ ? ? ? ? ?;;
+-lm32-*-uclinux*)
++lm32-*-uclinux*|lm32-*-linux-uclibc*)
+ ? ? ? ? tm_file="dbxelf.h elfos.h ${tm_file} linux.h lm32/uclinux-elf.h"
+ ? ? ? tmake_file="${tmake_file} lm32/t-lm32 lm32/t-fprules-softfp
soft-fp/t-softfp"
+ ? ? ? ? ;;
diff --git a/toolchain/gcc/4.5.2/110-lm32-fix-bug-46692.patch
b/toolchain/gcc/4.5.2/110-lm32-fix-bug-46692.patch
new file mode 100644
index 0000000..a67f3e1
--- /dev/null
+++ b/toolchain/gcc/4.5.2/110-lm32-fix-bug-46692.patch
@@ -0,0 +1,5 @@
+--- gcc-4.5.2/gcc/config/lm32/t-lm32.orig ? ? ?2010-03-30
12:26:24.000000000 +0200
++++ gcc-4.5.2/gcc/config/lm32/t-lm32 ? 2010-11-28 12:42:30.047795004 +0100
+@@ -1,1 +1,1 @@
+-MULTILIB_OPTIONS = mmultiply-enabled mbarrel-shift-enabled
++MULTILIB_OPTIONS = mbarrel-shift-enabled mmultiply-enabled
mdivide-enabled msign-extend-enabled
