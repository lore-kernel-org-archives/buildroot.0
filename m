From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 09:08:13 +0200
Subject: [Buildroot] [PATCH RESEND] package/systemd: fix homed
 dependency warning
In-Reply-To: <20210416072956.151549-1-buildroot@heine.tech>
References: <20210416072956.151549-1-buildroot@heine.tech>
Message-ID: <20210417070813.GN359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2021-04-16 09:29 +0200, Michael Nosthoff via buildroot spake thusly:
> Fixes:
> 
> showing "enable home daemon"
> and "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
> when BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> 
> introduced by fa62b5165ca41e4800e00a84af9026bfa5fb9155
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index fbe1a4081b..d658308213 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -233,7 +233,7 @@ comment "homed support needs a toolchain w/ threads, dynamic library, kernel hea
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
>  
>  config BR2_PACKAGE_SYSTEMD_HOSTNAMED
>  	bool "enable hostname daemon"
> -- 
> 2.25.1
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
