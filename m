From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 15:18:50 +0200
Subject: [Buildroot] [PATCH 1/2] Add the lm32 target
In-Reply-To: <AANLkTimWWxzQ9-kQHeD5bZPNgMURMssN3qETQOCvkBmj@mail.gmail.com>
	(Henk's message of "Fri, 7 Jan 2011 13:17:44 +0100")
References: <mailman.154.1294400356.14141.buildroot@busybox.net>
	<AANLkTimWWxzQ9-kQHeD5bZPNgMURMssN3qETQOCvkBmj@mail.gmail.com>
Message-ID: <87wrih40cl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Henk" == Henk  <henk.vergonet@gmail.com> writes:

 Henk> Add the lm32 target

Sorry, what is lm32 - And is is supported by upstream Linux/uClibc?

 Henk> Signed-off-by: Henk Vergonet <Henk.Vergonet@gmail.com>

 Henk> diff --git a/linux/Config.in b/linux/Config.in
 Henk> index 5e28b44..6c725ea 100644
 Henk> --- a/linux/Config.in
 Henk> +++ b/linux/Config.in
 Henk> @@ -127,11 +127,11 @@ config BR2_LINUX_KERNEL_ZIMAGE

 Henk> ?config BR2_LINUX_KERNEL_VMLINUX_BIN
 Henk> ? ? ? ?bool "vmlinux.bin"
 Henk> - ? ? ? depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
 Henk> + ? ? ? depends on BR2_lm32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64

 Henk> ?config BR2_LINUX_KERNEL_VMLINUX
 Henk> ? ? ? ?bool "vmlinux"
 Henk> - ? ? ? depends on BR2_mips || BR2_mipsel
 Henk> + ? ? ? depends on BR2_lm32 || BR2_mips || BR2_mipsel

 Henk> ?endchoice

 Henk> diff --git a/target/Config.in.arch b/target/Config.in.arch
 Henk> index 0774d55..e59bffb 100644
 Henk> --- a/target/Config.in.arch
 Henk> +++ b/target/Config.in.arch
 Henk> @@ -16,6 +16,8 @@ config BR2_avr32
 Henk> ? ? ? ?select BR2_SOFT_FLOAT
 Henk> ?config BR2_i386
 Henk> ? ? ? ?bool "i386"
 Henk> +config BR2_lm32
 Henk> + ? ? ? bool "lm32"
 Henk> ?config BR2_m68k
 Henk> ? ? ? ?bool "m68k"
 Henk> ? ? ? ?depends on BROKEN # ice in uclibc / inet_ntoa_r
 Henk> @@ -461,6 +463,7 @@ config BR2_ARCH
 Henk> ? ? ? ?default "i686" ? ? ? ? ?if BR2_x86_pentiumpro
 Henk> ? ? ? ?default "i686" ? ? ? ? ?if BR2_x86_nocona
 Henk> ? ? ? ?default "i686" ? ? ? ? ?if BR2_x86_core2
 Henk> + ? ? ? default "lm32" ? ? ? ? ?if BR2_lm32
 Henk> ? ? ? ?default "m68k" ? ? ? ? ?if BR2_m68k
 Henk> ? ? ? ?default "mips" ? ? ? ? ?if BR2_mips
 Henk> ? ? ? ?default "mipsel" ? ? ? ?if BR2_mipsel
 Henk> @@ -487,9 +490,9 @@ config BR2_ENDIAN
 Henk> ? ? ? ?string
 Henk> ? ? ? ?default "LITTLE" if BR2_arm || BR2_i386 || BR2_mipsel || \
 Henk> ? ? ? ? ? ? ? ? ? ? ? ? ? ?BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_sh64
 Henk> - ? ? ? default "BIG" ? ?if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
 Henk> - ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
 Henk> - ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh3eb || BR2_sh4eb || BR2_sparc
 Henk> + ? ? ? default "BIG" ? ?if BR2_armeb || BR2_avr32 || BR2_lm32 || BR2_m68k || \
 Henk> + ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_mips || BR2_powerpc || BR2_sh2a_nofpueb || \
 Henk> + ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh2eb || BR2_sh3eb || BR2_sh4eb || BR2_sparc

 Henk> ?config BR2_GCC_TARGET_TUNE
 Henk> ? ? ? ?string
 Henk> _______________________________________________
 Henk> buildroot mailing list
 Henk> buildroot at busybox.net
 Henk> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
