From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:23:51 +0200
Subject: [Buildroot] [PATCH] package/libbsd: needs an (e)glibc toolchain
In-Reply-To: <1402309581-18430-1-git-send-email-yann.morin.1998@free.fr>
References: <1402309581-18430-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140609142351.47e08090@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  9 Jun 2014 12:26:21 +0200, Yann E. MORIN wrote:

> -comment "libbsd needs a toolchain w/ threads"
> +comment "libbsd needs an (e)glibc toolchain w/ threads"
>  	depends on ( BR2_i386 || BR2_x86_64 )
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC

Is it possible to have a glibc toolchain without threads? I think no.
In this case, what is our policy? Should we keep both the glibc and
thread dependencies?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
