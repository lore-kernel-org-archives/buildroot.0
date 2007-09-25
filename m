From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 26 Sep 2007 00:39:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <20070925220441.CE64FA681D@busybox.net>
References: <20070925220441.CE64FA681D@busybox.net>
Message-ID: <1190759987.19731.105.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-25 klockan 15:04 -0700 skrev aldot at uclibc.org:
> Author: aldot
> Date: 2007-09-25 15:04:39 -0700 (Tue, 25 Sep 2007)
> New Revision: 20029
> 
> Log:
> - comment out bad logic
> 
> 
> Modified:
>    trunk/buildroot/target/device/Toolchain.in
> 
> 
> Changeset:
> Modified: trunk/buildroot/target/device/Toolchain.in
> ===================================================================
> --- trunk/buildroot/target/device/Toolchain.in	2007-09-25 22:03:18 UTC (rev 20028)
> +++ trunk/buildroot/target/device/Toolchain.in	2007-09-25 22:04:39 UTC (rev 20029)
> @@ -1,7 +1,7 @@
>  if BR2_TOOLCHAIN_EXTERNAL_SOURCE
>  choice
>  	prompt "Source location:"
> -	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
> +#	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
>  	help
>  	  Select whether to use the toolchain built by the buildroot
>  	  system or an external pre-built toolchain.
> @@ -9,10 +9,10 @@
>  config BR2_TOOLCHAIN_ATMEL_AVR32
>  	bool "Use prepatched source for AVR32 toolchain"
>  	depends on BR2_avr32
> -	depends on BR2_GCC_VERSION_4_1_2
> -	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
> -	depends on BR2_BINUTILS_VERSION_2_17
> -	depends on BR2_UCLIBC_VERSION_0_9_28_3
> +#	depends on BR2_GCC_VERSION_4_1_2
> +#	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
> +#	depends on BR2_BINUTILS_VERSION_2_17
> +#	depends on BR2_UCLIBC_VERSION_0_9_28_3

Please revert this patch and fix the real problem.

BR
Ulf Samuelsson


>  
>  endchoice
>  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
