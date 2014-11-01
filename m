From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 17:54:58 +0100
Subject: [Buildroot] [PATCH] package/mono: add threads dependency
In-Reply-To: <1414764111-21739-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1414764111-21739-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141101165458.GC10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2014-10-31 15:01 +0100, Angelo Compagnucci spake thusly:
> This patch adds a depends on BR2_TOOLCHAIN_HAS_THREADS.

Since this fixes autobuild failures, you should list at least a few of
them (the most recent ones), like:

Fixes:
    http://autobuild.buildroot.net/results/ece/ece1051cb9238735130b29f76d90a4994058345a/
    http://autobuild.buildroot.net/results/658/65850774d4c6b875cb6ebbf461dcc48cf8208f4f/
    http://autobuild.buildroot.net/results/5d5/5d5074aa73e167099410d244a18114dbced348d1/
    ...

> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I've looked at uClibc, and it looks like its implementations of LT,
LT-old and NPTL do all have this, so (with the afore-mentioned autobuild
references added):

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mono/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index f8f4895..cc015e6 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_MONO
>  	bool "mono"
>  	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40
>  	help
>  	  An open source, cross-platform, implementation of C#
> @@ -36,5 +37,5 @@ config BR2_PACKAGE_MONO_45
>  
>  endif
>  
> -comment "mono needs a toolchain w/ IPv6"
> -	depends on !BR2_INET_IPV6
> +comment "mono needs a toolchain w/ IPv6, threads"
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
