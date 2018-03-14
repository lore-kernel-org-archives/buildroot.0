From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2018 21:24:24 +0100
Subject: [Buildroot] [PATCH 2/3] libmpdclient: pass PARALLEL_JOBS to
 NINJA_OPTS
In-Reply-To: <20180314201837.21398-2-joerg.krause@embedded.rocks>
References: <20180314201837.21398-1-joerg.krause@embedded.rocks>
 <20180314201837.21398-2-joerg.krause@embedded.rocks>
Message-ID: <20180314202424.GE24940@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2018-03-14 21:18 +0100, J?rg Krause spake thusly:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libmpdclient/libmpdclient.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
> index a399516fe3..6ff27241c0 100644
> --- a/package/libmpdclient/libmpdclient.mk
> +++ b/package/libmpdclient/libmpdclient.mk
> @@ -20,7 +20,7 @@ LIBMPDCLIENT_CONF_OPTS += \
>  	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
>  	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
>  
> -LIBMPDCLIENT_NINJA_OPTS = $(if $(VERBOSE),-v)
> +LIBMPDCLIENT_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
>  
>  define LIBMPDCLIENT_CONFIGURE_CMDS
>  	rm -rf $(@D)/build
> -- 
> 2.16.2
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
