From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 22:30:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: needs threads
In-Reply-To: <20210120173803.90884-1-fontaine.fabrice@gmail.com>
References: <20210120173803.90884-1-fontaine.fabrice@gmail.com>
Message-ID: <20210121213008.GC2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-20 18:38 +0100, Fabrice Fontaine spake thusly:
> threads is mandatory since version 2.0 and
> https://github.com/troglobit/sysklogd/commit/f6e17bd6b30397912dcae33842b7aba8d32710a2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/33846ba0c6746c2befcd3c3ce0bbe0c5b32669ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, with dependencies reordered;
    https://buildroot.org/downloads/manual/manual.html#_config_files

Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysklogd/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
> index 18aff091c0..f4609f8297 100644
> --- a/package/sysklogd/Config.in
> +++ b/package/sysklogd/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_SYSKLOGD
>  	bool "sysklogd"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  The continuation of the original sysklogd package, based on
>  	  the original Berkeley syslog daemon. Now with kernel
> @@ -11,3 +12,8 @@ config BR2_PACKAGE_SYSKLOGD
>  	  clients.
>  
>  	  https://github.com/troglobit/sysklogd/
> +
> +comment "sysklogd needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.29.2
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
