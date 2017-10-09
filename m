From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Oct 2017 09:58:20 +0200
Subject: [Buildroot] [PATCH] python-numpy: Add support of ARC
 architecture
In-Reply-To: <20170915105816.30856-1-abrodkin@synopsys.com>
References: <20170915105816.30856-1-abrodkin@synopsys.com>
Message-ID: <20171009095820.17c899f6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Sep 2017 13:58:16 +0300, Alexey Brodkin wrote:

> diff --git a/package/python-numpy/0002-Add-support-of-ARC.patch b/package/python-numpy/0002-Add-support-of-ARC.patch
> new file mode 100644
> index 0000000000..36e6ff2511
> --- /dev/null
> +++ b/package/python-numpy/0002-Add-support-of-ARC.patch
> @@ -0,0 +1,66 @@
> +From 9a225e7d4fb1de5c99c6b5b17cae2fc4c2d1c59a Mon Sep 17 00:00:00 2001
> +From: Alexey Brodkin <abrodkin@synopsys.com>
> +Date: Fri, 15 Sep 2017 11:59:14 +0300
> +Subject: [PATCH 2/2] Add support of ARC

Should be just [PATCH] and not [PATCH 2/2], use "git format-patch -N".

> +Synopsys DesignWare ARC Processors are a family of 32-bit CPUs
> +which in some configurations may run Linux kernel and full stack
> +of applications on top of it. Among other things is Python.
> +
> +With that change we allow building and usage of Numpy on ARC.

Missing SoB line.

> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index f7822efc79..a10e73388c 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	# Numpy has some CPU specific code
>  	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
> -		|| BR2_sh || BR2_x86_64
> +		|| BR2_sh || BR2_x86_64 || BR2_arc

Alphabetic ordering.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
