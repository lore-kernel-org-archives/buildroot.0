From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:22:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/flac: enable building of
 libFLAC++
In-Reply-To: <20210628060125.73642-1-joerg.krause@embedded.rocks>
References: <20210628060125.73642-1-joerg.krause@embedded.rocks>
Message-ID: <20210629202245.GS2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2021-06-28 06:01 +0000, J?rg Krause spake thusly:
> Besides libFLAC, also build libFLAC++ when C++ support is enabled.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flac/flac.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/flac/flac.mk b/package/flac/flac.mk
> index 880c176f6e..9aa00b7ffd 100644
> --- a/package/flac/flac.mk
> +++ b/package/flac/flac.mk
> @@ -17,7 +17,7 @@ FLAC_CPE_ID_VENDOR = flac_project
>  FLAC_AUTORECONF = YES
>  
>  FLAC_CONF_OPTS = \
> -	--disable-cpplibs \
> +	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
>  	--disable-xmms-plugin \
>  	--disable-altivec
>  
> -- 
> 2.32.0
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
