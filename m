From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2011 15:09:05 +0100
Subject: [Buildroot] [git commit] gdb: fix kconfig dependency handling
 with !BR_TOOLCHAIN_BUILDROOT
In-Reply-To: <20111124134059.5A2918F66D@busybox.osuosl.org>
References: <20111124134059.5A2918F66D@busybox.osuosl.org>
Message-ID: <20111124150905.40405e14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 24 Nov 2011 14:26:52 +0100,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> Fix it by introducing 2 more hidden config options:
>  - BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  - BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
> 
> The first tells us if the toolchain HAS pthreads debugging support,
> and is checked by check_uclibc_feature in helper.mk for external
> uClibc based toolchains.
> 
> The second tells us if the toolchain is ABLE TO provide pthreads
> debugging support if threads are enabled, either because it's an
> internal toolchain where we can force enable it or an external
> glibc/eglibc toolchain or uClibc with the option enabled.

I don't get why two different options are needed here. Could you expand
a bit on that ?

> +config BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
> +	default y if !BR2_TOOLCHAIN_HAS_THREADS
> +	bool
> +

I also don't get this "default y if !BR2_TOOLCHAIN_HAS_THREADS". Could
you give some details ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
