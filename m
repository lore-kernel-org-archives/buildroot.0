From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Aug 2014 00:34:16 +0200
Subject: [Buildroot] [PATCH] package/infozip: Rename HOST_CC to HOSTCC
In-Reply-To: <1408141375-3893-1-git-send-email-bernd.kuhls@t-online.de>
References: <1408141375-3893-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140815223416.GF27341@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-16 00:22 +0200, Bernd Kuhls spake thusly:
> Wrong variable name is used which can lead to build errors for the host variant:
> 
> [...] -I. -DUNIX" AS=" -c" -f unix/Makefile generic
> 
> c _match.s
> make[1]: c: command not found
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/infozip/infozip.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
> index 42cd1db..229299c 100644
> --- a/package/infozip/infozip.mk
> +++ b/package/infozip/infozip.mk
> @@ -29,7 +29,7 @@ endef
>  define HOST_INFOZIP_BUILD_CMDS
>  	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
>  		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
> -		AS="$(HOST_CC) -c" \
> +		AS="$(HOSTCC) -c" \
>  		-f unix/Makefile generic
>  endef
>  
> -- 
> 1.7.10.4
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
