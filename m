From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 11:14:21 +0200
Subject: [Buildroot] [PATCH v5 05/34] package/xmlstarlet: add host
	variant
In-Reply-To: <20170417195433.26672-6-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-6-bernd.kuhls@t-online.de>
Message-ID: <20170422091421.GF15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Needed for the Kodi skin package to control the default skin setup.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xmlstarlet/xmlstarlet.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
> index 61d38f29f..091c371e8 100644
> --- a/package/xmlstarlet/xmlstarlet.mk
> +++ b/package/xmlstarlet/xmlstarlet.mk
> @@ -24,4 +24,7 @@ else
>  XMLSTARLET_CONF_OPTS += --disable-static-libs
>  endif
>  
> +HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.11.0
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
