From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 22:24:49 +0100
Subject: [Buildroot] [PATCH] autofs: use libtirpc instead of internal C
 implementation
In-Reply-To: <20170321193213.GA18747@waldemar-brodkorb.de>
References: <20170321193213.GA18747@waldemar-brodkorb.de>
Message-ID: <20170321222449.5ceb21f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 20:32:13 +0100, Waldemar Brodkorb wrote:

> @@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
>  	bool "autofs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	depends on !BR2_STATIC_LIBS # dlfcn
> +	select BR2_PACKAGE_LIBTIRPC

Why should we force people to use libtirpc ? What about instead:

	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

and adjust the .mk file accordingly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
