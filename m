From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:36:07 +0100
Subject: [Buildroot] [PATCH 1/3] package/linux-headers: add option to
 use same sources as the kernel
In-Reply-To: <dde8a16a5331beb6280d7b86002aa917eae44664.1453314776.git.yann.morin.1998@free.fr>
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <dde8a16a5331beb6280d7b86002aa917eae44664.1453314776.git.yann.morin.1998@free.fr>
Message-ID: <20160120213607.063c1447@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, 20 Jan 2016 19:34:28 +0100, Yann E. MORIN wrote:

> +	config BR2_KERNEL_HEADERS_AS_KERNEL
> +		bool "Same as kernel"
> +		depends on BR2_LINUX_KERNEL
> +
> +	comment "Using the same version as that of the"
> +		depends on !BR2_LINUX_KERNEL
> +	comment "kernel needs a kernel to be built.   "
> +		depends on !BR2_LINUX_KERNEL

I think this Config.in comment is useless. It is completely obvious
that if you want to re-use the same kernel headers as the kernel you're
building, you must have enabled building a kernel with Buildroot.

Other than that, the patch looks good. I haven't tested it, but it
looks good.

Yet another feature that would desperately need a test case in our test
suite :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
