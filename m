From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 5 Jul 2008 03:47:19 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <20080705063720.8C5643C608@busybox.net>
References: <20080705063720.8C5643C608@busybox.net>
Message-ID: <d6cda7730807042347s4c4c4f8cw39dd088dd891803@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AFAIK 4.2.1 is the only gcc release that produces valid binaries.
4.2.2 produces C++ programs that crash. I think we shouldn't deprecate
it.

On Sat, Jul 5, 2008 at 3:37 AM,  <ulf@uclibc.org> wrote:
> Author: ulf
> Date: 2008-07-04 23:37:17 -0700 (Fri, 04 Jul 2008)
> New Revision: 22642
>
> Log:
> Run AVR32 toolchain with Sysroot (will fail if not enabled), deprecate 4.1.2 and 4.2.1
>
> Modified:
>   trunk/buildroot/target/device/Config.in.toolchain
>
>
> Changeset:
> Modified: trunk/buildroot/target/device/Config.in.toolchain
> ===================================================================
> --- trunk/buildroot/target/device/Config.in.toolchain   2008-07-05 04:30:05 UTC (rev 22641)
> +++ trunk/buildroot/target/device/Config.in.toolchain   2008-07-05 06:37:17 UTC (rev 22642)
> @@ -9,6 +9,7 @@
>  config BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
>        bool "Use prepatched source for AVR32 gcc-4.1.2 toolchain"
>        depends on BR2_avr32
> +       depends on BR2_DEPRECATED
>        select BR2_EXT_GCC_VERSION_4_1_2
>        select BR2_EXT_BINUTILS_VERSION_2_17
>        select BR2_EXT_UCLIBC_VERSION_0_9_29
> @@ -19,10 +20,12 @@
>  config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
>        bool "Use prepatched source for AVR32 gcc-4.2.1 toolchain"
>        depends on BR2_avr32
> +       depends on BR2_DEPRECATED
>        select BR2_EXT_GCC_VERSION_4_2_1
>        select BR2_EXT_BINUTILS_VERSION_2_17
>        select BR2_EXT_UCLIBC_VERSION_0_9_29
>        select BR2_TOOLCHAIN_ATMEL_AVR32
> +       select BR2_GCC_SUPPORTS_SYSROOT
>        help
>          The gcc-4.2.1 toolchain for the AVR32
>          * gcc-4.2.1
> @@ -39,6 +42,7 @@
>        select BR2_EXT_BINUTILS_VERSION_2_17
>        select BR2_EXT_UCLIBC_VERSION_0_9_29
>        select BR2_TOOLCHAIN_ATMEL_AVR32
> +       select BR2_GCC_SUPPORTS_SYSROOT
>        help
>          The gcc-4.2.2 toolchain for the AVR32
>          * gcc-4.2.2
> @@ -67,6 +71,7 @@
>
>  config BR2_TOOLCHAIN_UNKNOWNVENDOR
>        bool "Use prepatched source from unknown vendor"
> +       depends on !BR2_avr32
>
>  endchoice
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
