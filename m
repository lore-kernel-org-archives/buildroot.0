From: Henk <henk.vergonet@gmail.com>
Date: Fri, 7 Jan 2011 13:17:44 +0100
Subject: [Buildroot] [PATCH 1/2] Add the lm32 target
In-Reply-To: <mailman.154.1294400356.14141.buildroot@busybox.net>
References: <mailman.154.1294400356.14141.buildroot@busybox.net>
Message-ID: <AANLkTimWWxzQ9-kQHeD5bZPNgMURMssN3qETQOCvkBmj@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the lm32 target

Signed-off-by: Henk Vergonet <Henk.Vergonet@gmail.com>

diff --git a/linux/Config.in b/linux/Config.in
index 5e28b44..6c725ea 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -127,11 +127,11 @@ config BR2_LINUX_KERNEL_ZIMAGE

?config BR2_LINUX_KERNEL_VMLINUX_BIN
? ? ? ?bool "vmlinux.bin"
- ? ? ? depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
+ ? ? ? depends on BR2_lm32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64

?config BR2_LINUX_KERNEL_VMLINUX
? ? ? ?bool "vmlinux"
- ? ? ? depends on BR2_mips || BR2_mipsel
+ ? ? ? depends on BR2_lm32 || BR2_mips || BR2_mipsel

?endchoice

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 0774d55..e59bffb 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -16,6 +16,8 @@ config BR2_avr32
? ? ? ?select BR2_SOFT_FLOAT
?config BR2_i386
? ? ? ?bool "i386"
+config BR2_lm32
+ ? ? ? bool "lm32"
?config BR2_m68k
? ? ? ?bool "m68k"
? ? ? ?depends on BROKEN # ice in uclibc / inet_ntoa_r
@@ -461,6 +463,7 @@ config BR2_ARCH
? ? ? ?default "i686" ? ? ? ? ?if BR2_x86_pentiumpro
? ? ? ?default "i686" ? ? ? ? ?if BR2_x86_nocona
? ? ? ?default "i686" ? ? ? ? ?if BR2_x86_core2
+ ? ? ? default "lm32" ? ? ? ? ?if BR2_lm32
? ? ? ?default "m68k" ? ? ? ? ?if BR2_m68k
? ? ? ?default "mips" ? ? ? ? ?if BR2_mips
? ? ? ?default "mipsel" ? ? ? ?if BR2_mipsel
@@ -487,9 +490,9 @@ config BR2_ENDIAN
? ? ? ?string
? ? ? ?default "LITTLE" if BR2_arm || BR2_i386 || BR2_mipsel || \
? ? ? ? ? ? ? ? ? ? ? ? ? ?BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_sh64
- ? ? ? default "BIG" ? ?if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
- ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
- ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh3eb || BR2_sh4eb || BR2_sparc
+ ? ? ? default "BIG" ? ?if BR2_armeb || BR2_avr32 || BR2_lm32 || BR2_m68k || \
+ ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_mips || BR2_powerpc || BR2_sh2a_nofpueb || \
+ ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh2eb || BR2_sh3eb || BR2_sh4eb || BR2_sparc

?config BR2_GCC_TARGET_TUNE
? ? ? ?string
