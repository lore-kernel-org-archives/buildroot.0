From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:34:52 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
 core
In-Reply-To: <20170406234139.31532-2-sikor6@gmail.com>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
Message-ID: <20170408153452.54837e4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Apr 2017 01:41:39 +0200, Pawel Sikora wrote:

> +choice
> +	prompt "Xenomai core"
> +	default BR2_PACKAGE_XENOMAI_MERCURY
> +	help
> +	  Manually select the Xenomai core. Default option depends if
> +	  you selected BR2_LINUX_KERNEL_EXT_XENOMAI.
> +	  If yes, then default option will be Cobalt.
> +	  Otherwise you can use just the Mercury core with the
> +	  native Linux kernel.
> +
> +config BR2_PACKAGE_XENOMAI_MERCURY
> +	bool "Mercury"
> +	depends on !BR2_LINUX_KERNEL_EXT_XENOMAI
> +	help
> +	  Select Mercury core for the Xenomai userspace.
> +	  If you want Cobalt core, you need to enable
> +	  BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
> +	  Linux Kernel Extensions menu.
> +
> +config BR2_PACKAGE_XENOMAI_COBALT
> +	bool "Cobalt"
> +	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
> +	help
> +	  Select Cobalt core for the Xenomai userspace.
> +	  If you want Mercury core, you need to disable
> +	  BR2_LINUX_KERNEL_EXT_XENOMAI in the Linux Kernel ->
> +	  Linux Kernel Extensions menu.

Does it really make sense to have a "choice" when in fact it's
impossible to have both options of the choice visible at the same time?
One option depends on !BR2_LINUX_KERNEL_EXT_XENOMAI and the other
option depends on BR2_LINUX_KERNEL_EXT_XENOMAI.

I'm not sure how to handle this. Do we automatically switch between
Cobalt and Mercury depending on whether the Xenomai kernel extension is
enabled?

Do we use Mercury by default, and offer a sub-option to explicitly
enable Cobalt when the Linux kernel extension is available?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
