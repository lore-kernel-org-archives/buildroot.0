From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 18:53:03 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: enable linuxthreads for
 all supported architectures
In-Reply-To: <20210521134122.122426-1-mgliga@bitdefender.com>
References: <20210521134122.122426-1-mgliga@bitdefender.com>
Message-ID: <20210521165303.GM3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mircea, All,

On 2021-05-21 16:41 +0300, Mircea GLIGA spake thusly:
> Synchronize the list of architectures that have LinuxThreads support
> with the ones from uClibc-ng.
> 
> Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - enable linuxthreads for all supported architectures,
>     not just MIPS (suggested by Yann E. MORIN)
> ---
>  package/uclibc/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index e59fef3c69..2091166b62 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -53,7 +53,8 @@ config BR2_PTHREADS_NATIVE
>  
>  config BR2_PTHREADS
>  	bool "linuxthreads"
> -	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
> +	depends on !BR2_aarch64 && !BR2_aarch64_be
> +	depends on !BR2_RISCV_64
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PTHREADS_NONE
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
