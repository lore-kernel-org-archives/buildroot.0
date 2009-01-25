From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 25 Jan 2009 22:06:52 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target:	device/Atmel/at91rm9200df
	device/Atmel/a etc...
In-Reply-To: <20090125201134.560DF768D3@busybox.osuosl.org>
References: <20090125201134.560DF768D3@busybox.osuosl.org>
Message-ID: <1232917612.2298.2.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 20:11 +0000 skrev jacmet at uclibc.org:
> Author: jacmet
> Date: 2009-01-25 20:11:31 +0000 (Sun, 25 Jan 2009)
> New Revision: 25014
> 
> Log:
> target/linux-advanced: default to menuconfig for all archs
> 
> Default to menuconfig for atmel targets as well, mention QT3 dependency
> for make xconfig and update affected defconfigs.
> 
> Modified:
>    trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
>    trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
>    trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
>    trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
>    trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
>    trunk/buildroot/target/linux/Config.in.advanced
>    trunk/buildroot/target/linux/Makefile.in.advanced
> 

Don't do this!
Either you revert, or I will do it.

You are NOT the maintainer of these boards.

BR
Ulf Samuelsson

> 
> Changeset:
> Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
> ===================================================================
> --- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -996,9 +996,9 @@
>  BR2_PACKAGE_LINUX_USE_KCONFIG=y
>  # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
>  # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
> -BR2_MAKE_XCONFIG=y
> -# BR2_MAKE_MENUCONFIG is not set
> -BR2_KERNEL_CONFIG_METHOD="xconfig"
> +# BR2_MAKE_XCONFIG is not set
> +BR2_MAKE_MENUCONFIG=y
> +BR2_KERNEL_CONFIG_METHOD="menuconfig"
>  # BR2_LINUX_BIN_BZIMAGE is not set
>  BR2_LINUX_BIN_UIMAGE=y
>  # BR2_LINUX_BIN_VMLINUX is not set
> 
> Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
> ===================================================================
> --- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -882,9 +882,9 @@
>  BR2_PACKAGE_LINUX_USE_KCONFIG=y
>  # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
>  # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
> -BR2_MAKE_XCONFIG=y
> -# BR2_MAKE_MENUCONFIG is not set
> -BR2_KERNEL_CONFIG_METHOD="xconfig"
> +# BR2_MAKE_XCONFIG is not set
> +BR2_MAKE_MENUCONFIG=y
> +BR2_KERNEL_CONFIG_METHOD="menuconfig"
>  # BR2_LINUX_BIN_BZIMAGE is not set
>  BR2_LINUX_BIN_UIMAGE=y
>  # BR2_LINUX_BIN_VMLINUX is not set
> 
> Modified: trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
> ===================================================================
> --- trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -587,9 +587,9 @@
>  BR2_PACKAGE_LINUX_USE_KCONFIG=y
>  # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
>  # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
> -BR2_MAKE_XCONFIG=y
> -# BR2_MAKE_MENUCONFIG is not set
> -BR2_KERNEL_CONFIG_METHOD="xconfig"
> +# BR2_MAKE_XCONFIG is not set
> +BR2_MAKE_MENUCONFIG=y
> +BR2_KERNEL_CONFIG_METHOD="menuconfig"
>  # BR2_LINUX_BIN_BZIMAGE is not set
>  BR2_LINUX_BIN_UIMAGE=y
>  # BR2_LINUX_BIN_VMLINUX is not set
> 
> Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
> ===================================================================
> --- trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -1091,9 +1091,9 @@
>  BR2_PACKAGE_LINUX_USE_KCONFIG=y
>  # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
>  # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
> -BR2_MAKE_XCONFIG=y
> -# BR2_MAKE_MENUCONFIG is not set
> -BR2_KERNEL_CONFIG_METHOD="xconfig"
> +# BR2_MAKE_XCONFIG is not set
> +BR2_MAKE_MENUCONFIG=y
> +BR2_KERNEL_CONFIG_METHOD="menuconfig"
>  # BR2_LINUX_BIN_BZIMAGE is not set
>  BR2_LINUX_BIN_UIMAGE=y
>  # BR2_LINUX_BIN_VMLINUX is not set
> 
> Modified: trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
> ===================================================================
> --- trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -857,9 +857,9 @@
>  BR2_PACKAGE_LINUX_USE_KCONFIG=y
>  # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
>  # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
> -BR2_MAKE_XCONFIG=y
> -# BR2_MAKE_MENUCONFIG is not set
> -BR2_KERNEL_CONFIG_METHOD="xconfig"
> +# BR2_MAKE_XCONFIG is not set
> +BR2_MAKE_MENUCONFIG=y
> +BR2_KERNEL_CONFIG_METHOD="menuconfig"
>  # BR2_LINUX_BIN_BZIMAGE is not set
>  BR2_LINUX_BIN_UIMAGE=y
>  # BR2_LINUX_BIN_VMLINUX is not set
> 
> Modified: trunk/buildroot/target/linux/Config.in.advanced
> ===================================================================
> --- trunk/buildroot/target/linux/Config.in.advanced	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -390,7 +390,7 @@
>  	bool "Run make ARCH=$(ARCH) [xconfig|menuconfig] before build"
>  	depends on BR2_PACKAGE_LINUX
>  	help
> -	  Configure Linux by make xconfig
> +	  Configure Linux by make xconfig|menuconfig
>  endchoice
>  
>  config BR2_PACKAGE_LINUX_KCONFIG
> @@ -406,14 +406,13 @@
>  
>  choice
>  	prompt "Preferred config tool"
> -	default BR2_MAKE_XCONFIG if BR2_TARGET_ATMEL
>  	default BR2_MAKE_MENUCONFIG
>  	depends on BR2_PACKAGE_LINUX_USE_XCONFIG
>  	help
>  	  Define the preferred tool to invoke if a configuration is invalid
>  
>  config	BR2_MAKE_XCONFIG
> -	bool "make xconfig"
> +	bool "make xconfig (needs QT3 headers on host)"
>  	help
>  	  Run "make xconfig" if kernel ".config" is invalid
>  
> 
> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
> ===================================================================
> --- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-25 08:18:35 UTC (rev 25013)
> +++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-25 20:11:31 UTC (rev 25014)
> @@ -112,7 +112,7 @@
>  KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
>  #"))
>  ifeq ($(KERNEL_CONFIG_METHOD),)
> -KERNEL_CONFIG_METHOD:=xconfig
> +KERNEL_CONFIG_METHOD:=menuconfig
>  endif
>  
>  # -----------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
