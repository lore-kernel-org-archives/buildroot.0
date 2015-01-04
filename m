From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 21:32:09 +0100
Subject: [Buildroot] [PATCH] package/erlang: fix detection of
 libatomic_ops
In-Reply-To: <1420381034-16098-1-git-send-email-yann.morin.1998@free.fr>
References: <1420381034-16098-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150104213209.0bd70205@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Frank,

On Sun,  4 Jan 2015 15:17:14 +0100, Yann E. MORIN wrote:
> For some platforms, hardware-assisted compare-and-swap may not be
> available, so libatomic will not provide it.
> 
> However, libatomic_ops can provide a puerly software CASE emulation, but

puerly -> purely
CASE -> CAS

> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 56830da..2eb9eba 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -6,6 +6,8 @@ config BR2_PACKAGE_ERLANG
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS

 -> new dependency that must be propagated to the comment.

I've committed your patch with those two issues fixed, and I've added a
follow-up commit to further fix the dependencies of the comment, which
were already wrong.

Frank, do not hesitate to report about your testing after this patch.
It would be interesting if you could provide some simple test cases to
test the Erlang stuff, so that padawans like me can easily do a simple
testing of whether it still works or not.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
