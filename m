From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 21:55:34 +0100
Subject: [Buildroot] [PATCH v1] package/bind: disable backtrace support
In-Reply-To: <20210103192548.13720-1-ps.report@gmx.net>
References: <20210103192548.13720-1-ps.report@gmx.net>
Message-ID: <20210103205534.GQ2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-03 20:25 +0100, Peter Seiderer spake thusly:
> Disable backtrace support, fixes linking failure for uclibc/musl based
> toolchains.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/7a1a140314bc8d134f9eeb95ef2e46e7fb0ce9fd/
> 
>   .../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'
> 
>   - http://autobuild.buildroot.net/results/f0db5fe7fc6860b7270c784989c451e2e7aa2afb/
> 
>   .../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'
> 
>   - http://autobuild.buildroot.net/results/cb963298885df37f1e5c4d3ab3989773c01c54fc/
> 
>   .../arm-buildroot-linux-musleabihf/bin/ld: ../isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bind/bind.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 0df2467bc5..ab42762e12 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -30,7 +30,8 @@ BIND_CONF_OPTS = \
>  	--with-randomdev=/dev/urandom \
>  	--enable-epoll \
>  	--with-gssapi=no \
> -	--enable-filter-aaaa
> +	--enable-filter-aaaa \
> +	--disable-backtrace
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  BIND_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
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
