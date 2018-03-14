From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2018 21:24:49 +0100
Subject: [Buildroot] [PATCH 3/3] mpd-mpc: pass PARALLEL_JOBS to
 NINJA_OPTS
In-Reply-To: <20180314201837.21398-3-joerg.krause@embedded.rocks>
References: <20180314201837.21398-1-joerg.krause@embedded.rocks>
 <20180314201837.21398-3-joerg.krause@embedded.rocks>
Message-ID: <20180314202449.GF24940@scaer>
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
>  package/mpd-mpc/mpd-mpc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
> index 3eecf8a3ef..e16f600491 100644
> --- a/package/mpd-mpc/mpd-mpc.mk
> +++ b/package/mpd-mpc/mpd-mpc.mk
> @@ -17,7 +17,7 @@ MPD_MPC_CONF_OPTS += \
>  	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
>  	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
>  
> -MPD_MPC_NINJA_OPTS = $(if $(VERBOSE),-v)
> +MPD_MPC_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
>  
>  define MPD_MPC_CONFIGURE_CMDS
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
