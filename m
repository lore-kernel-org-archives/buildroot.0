From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 6 Feb 2007 13:30:18 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
References: <20070206113150.1A70B48668@busybox.net>
Message-ID: <010701c749ea$94576980$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Author: aldot
> Date: 2007-02-06 03:31:50 -0800 (Tue, 06 Feb 2007)
> New Revision: 17788
>
> Log:
> - bump version to 2.6.20
>
>
> Modified:
>   trunk/buildroot/toolchain/kernel-headers/Config.in
>   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
>
>
> Changeset:
> Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/kernel-headers/Config.in 2007-02-06 11:22:50 
> UTC (rev 17787)
> +++ trunk/buildroot/toolchain/kernel-headers/Config.in 2007-02-06 11:31:50 
> UTC (rev 17788)
> @@ -38,9 +38,9 @@
>  depends !BR2_nios2
>  bool "Linux 2.6.12 kernel headers"
>
> - config BR2_KERNEL_HEADERS_2_6_19_2
> + config BR2_KERNEL_HEADERS_2_6_20
>  depends !BR2_nios2
> - bool "Linux 2.6.19.2 kernel headers"
> + bool "Linux 2.6.20 kernel headers"
>
> endchoice
>
> @@ -53,4 +53,4 @@
>  default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
>  default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
>  default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
> - default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2
> + default "2.6.20"    if BR2_KERNEL_HEADERS_2_6_20
>
> Modified: 
> trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
> ===================================================================
> --- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile 
> 2007-02-06 11:22:50 UTC (rev 17787)
> +++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile 
> 2007-02-06 11:31:50 UTC (rev 17788)
> @@ -4,11 +4,11 @@
> #
> #############################################################
>
> -ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.19.2")
> +ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20")
> VERSION:=2
> PATCHLEVEL:=6
> -SUBLEVEL:=19
> -EXTRAVERSION:=.2
> +SUBLEVEL:=20
> +EXTRAVERSION:=
> LOCALVERSION:=
> LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
>
> _______________________________________________

Why remove the 2.6.19.2 headers?
Why not just add the 2.6.20 headers?

Best Regards
Ulf Samuelsson
