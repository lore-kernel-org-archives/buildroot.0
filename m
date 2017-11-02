From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:12:15 +0100
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <20171102181405.6476-1-yann.morin.1998@free.fr>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
Message-ID: <20171102221215.1250bc0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for looking into this issue!

On Thu,  2 Nov 2017 19:14:05 +0100, Yann E. MORIN wrote:

> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index c2cfc34284..797c07c3f9 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -1,4 +1,17 @@
> +config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
> +	bool
> +	default y
> +	# The ARC version needs C++11, thus gcc >= 4.8, like gdb-8.0.x
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_arc
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_arc

Why do we have a dependency on the target compiler version for
host-gdb ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
