From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 09:06:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix -Dman-pages=false
 syntax
In-Reply-To: <20210416072740.574979-1-james.hilliard1@gmail.com>
References: <20210416072740.574979-1-james.hilliard1@gmail.com>
Message-ID: <20210417070622.GM359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2021-04-16 01:27 -0600, James Hilliard spake thusly:
> The current -Dmanpages=false syntax is invalid.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, after rewording the commit log as per Peter's
suggestions, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libdrm/libdrm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 98e1ac079d..f5b205bb00 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -17,7 +17,7 @@ LIBDRM_DEPENDENCIES = \
>  
>  LIBDRM_CONF_OPTS = \
>  	-Dcairo-tests=false \
> -	-Dmanpages=false
> +	-Dman-pages=false
>  
>  ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>  LIBDRM_DEPENDENCIES += libatomic_ops
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
